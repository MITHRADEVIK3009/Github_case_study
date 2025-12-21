Subject: Technical proposal — resolving New Conversation hang (Issue #181590)

Hi @kangarruu,

Summary
Based on user reports from @viceice and @Rob--W, we've isolated a client-side failure when creating new PR conversations: the UI shows an infinite spinner while a background POST request hangs, and comments are lost when the app is force-closed on many devices.

Proposed prioritized fixes

P0 — Atomic Persistence (client)
- Persist the draft to local storage (Room/SQLite) before initiating the POST. Include {pr_id, body, draft_id, idempotency_key, status}.

P0 — Client-Side Timeout + Retry UX
- Apply a 30s client timeout to the NewConversation POST. On timeout, set draft status='failed' and surface a Retry/Save Draft UI so users keep agency.

P1 — Idempotency Protection
- Generate a UUID per draft and include it with the POST so backend can de-duplicate retries. Please confirm preferred header/field for idempotency keys.

Why this helps
- Prevents data loss on force-close by ensuring drafts are stored persistently prior to network calls.
- Provides a clear failure/recovery UI within 30s instead of an indefinite spinner.
- Keeps initial changes client-focused and low-risk; backend coordination is limited to idempotency and telemetry hooks.

Next actions
1. Engineering: confirm idempotency support and header/field format.
2. Design: provide two static screens for the timeout state and draft restoration.
3. Analytics: add `comment_local_save_success` and `comment_api_timeout_triggered` events for the canary rollout.

If useful, I can attach the schema and telemetry snippets to this thread — let me know and I will post them.

—

Posted-by: Candidate
