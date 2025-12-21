Technical requirements (one page)

Objective
Prevent user data loss and provide a clear recovery UX when New Conversation POST requests hang.

R1 — Pre-POST Local Persistence (P0)
- Description: Write the draft to a local persistent store (Room/SQLite) before initiating the network POST.
- Acceptance: Draft persists across app restarts and device process kills.

R2 — Client-Side Timeout (P0)
- Description: Apply a configurable client-side timeout (default 30s) to the NewConversation POST and fail fast.
- Acceptance: After timeout, UI shows Retry/Save Draft options and background worker terminates retry attempt.

R3 — Draft Restoration UI (P0)
- Description: On app restart, surface unsent drafts with a clear action panel: Send Now / Edit / Discard.
- Acceptance: Users can recover or resend drafts without retyping.

R4 — Idempotency Key (P1)
- Description: Client attaches `X-Idempotency-Key: <uuid>` to POSTs; backend should de-duplicate duplicates by key.
- Acceptance: Duplicate comment rate remains below 0.1% after retries (validate via telemetry).

Engineering notes
- Keep schema minimal; client should clean up sent drafts. Coordinate with backend for idempotency header name and response codes.
