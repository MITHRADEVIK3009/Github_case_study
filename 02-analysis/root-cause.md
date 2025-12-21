Root cause analysis (≈300 words)

Summary
The symptom is consistent: when a user starts a new PR conversation and taps Send, the UI shows a spinner while the background POST request hangs; the UI thread remains responsive. Some devices persist the text after a force-close, others lose it — indicating inconsistent local persistence.

Why the UI stays responsive
Modern mobile apps separate UI/main-thread operations from network I/O via background workers. The observed behavior (UI responsive, spinner active) indicates the network call runs asynchronously but never resolves (no success or error). This suggests the client either lacks a network timeout, or the background worker enters a zombie/wait state when the server stalls.

Why data is lost on some devices
When a draft exists only in RAM (editor buffer) and the app process is killed, that memory is reclaimed; the draft is lost. The devices that retain drafts likely rely on OS-level caching or a background persistence mechanism not consistently invoked. The divergence implies the app lacks a standardized, explicit pre-POST persistence step.

Critical path failure
1. User composes comment in editor (RAM).
2. Client initiates async POST without first writing a durable draft.
3. POST hangs (server or network); client shows infinite spinner because no timeout is enforced.
4. User force-closes app to recover; if draft was RAM-only, data is lost.

Root cause: Missing atomic client-side persistence combined with absent/insufficient client-side timeout handling.

Implications
- Fixing this requires a client change (pre-POST persistence + timeout + retry UI). Backend support for idempotency reduces duplicate risk but is not strictly required for basic data-preservation.
- The fix is implementable in isolation on the client and is high-impact for user retention and task completion.
