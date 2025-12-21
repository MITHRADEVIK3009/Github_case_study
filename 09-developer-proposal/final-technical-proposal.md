Subject: Technical proposal — resolving New Conversation hang (Issue #181590)

Hi @kangarruu,

Summary
Based on user reports from @viceice and @Rob--W, I have isolated a repeated client-side failure when creating new PR conversations: the UI shows an infinite spinner while a background POST request hangs, and comments are lost when the app is force-closed on many devices.

Proposed immediate fixes (prioritized)

P0 — Atomic Persistence (client)
- Write the comment to a local persistent store (Room/SQLite) before initiating the POST. Store {pr_id, body, draft_id, idempotency_key, status}.

P0 — Client-Side Timeout + Retry UX
- Apply a 30s client timeout to the NewConversation POST. On timeout, update draft status='failed' and show a clear Retry/Save Draft UI so the user retains agency.

P1 — Idempotency Protection
- Generate a UUID per draft and include it with the POST so backend can detect and de-duplicate retries. Request backend confirmation whether idempotency keys are supported or preferred format.

Why this approach
- Prevents 100% data loss on force-close by ensuring drafts are persisted locally.
- Fails fast for users with a clear recovery path (Retry/Save Draft) rather than indefinite waiting.
- Keeps changes client-scoped and low-risk for an initial rollout; backend coordination is limited to idempotency contract and optional telemetry.

Next actions I recommend
1. Engineering: confirm backend idempotency support and preferred header/field for idempotency key.
2. Design: provide two static screens for the 30s timeout state and draft restoration flow.
3. Analytics: instrument `comment_local_save_success` and `comment_api_timeout_triggered` events.
4. Developer validation: small canary rollout to 5–10% of mobile users and monitor telemetry for reduced data-loss incidents.

Owners & contacts (suggested)
- Product / PM: <product contact> — owner of the case study and thread post
- Engineering: <engineering contact> (replace with the assigned eng lead)
- Design: <design contact> (replace with the assigned design lead)
- Analytics: <analytics contact>

Canary and monitoring proposal
- Canary: 5% initial rollout for 72 hours, monitor `comment_api_timeout_triggered` and `comment_local_save_success` rates hourly.
- Success criteria for canary: fewer user-reported data-loss incidents in the canary cohort and >=90% draft restoration success on restart.
- Rollback criteria: if duplicate comment rate rises above 0.1% or `comment_api_timeout_triggered` increases >50% vs baseline, rollback the client change.

Backend question (required)
- Does the server support idempotency keys for the NewConversation endpoint? If not, what is the recommended approach for de-duplication? Please confirm preferred header or request field.

If useful, I can post this summary to the GitHub thread and include the proposed schema and telemetry snippet.

— End of proposal
