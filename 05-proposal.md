Proposed fix for Issue #181590 (short)

Problem
New conversation creation on GitHub Mobile (Android) can hang indefinitely; users see an infinite spinner and may lose their comment if the app process is killed.

Proposed solution (P0/P1)
1. Pre-POST local save (P0): write draft to local DB before initiating the POST.
2. Client timeout + Retry UI (P0): 30s default timeout, then show Retry / Save Draft.
3. Draft restoration on restart (P0): surface unsent drafts with actions.
4. Idempotency key (P1): client attaches `X-Idempotency-Key` header; backend de-duplicates.

Engineering requirements
- Minimal Room/SQLite schema attached: `03-solution/database-schema.sql`.
- Client must support a configurable timeout and background retry logic (WorkManager or equivalent).
- Backend: confirm idempotency header and desired behavior on duplicate requests.

Canary plan
- 5% rollout for 72 hours; monitor `comment_api_timeout_triggered`, draft restoration rate, and duplicate comment count.

Short ask to thread
Could the backend team confirm whether the NewConversation endpoint supports idempotency keys (preferred header name), and whether a 5% canary is feasible for an initial client rollout?
