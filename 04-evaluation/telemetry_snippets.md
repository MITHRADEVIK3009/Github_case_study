Recommended telemetry events (specs)

1) `comment_local_save_success`
   - payload: { pr_id, draft_id, timestamp }

2) `comment_api_timeout_triggered`
   - payload: { pr_id, draft_id, duration_seconds, network_type }

3) `comment_draft_restored`
   - payload: { pr_id, draft_id, draft_age_seconds }

Acceptance criteria (example)
- `comment_api_timeout_triggered` should surface within 30s for failed requests.
- Reduce user-reported data-loss incidents (qualitative) to near zero for users with saved drafts.

Notes
- Telemetry implementation is engineering-owned; this file documents the minimal events to request when aligning with eng and analytics.

Suggested thresholds and owners
- `comment_local_save_success`: target >= 99% for successful local writes; owner: Analytics/Client Telemetry
- `comment_api_timeout_triggered`: target drop >= 50% after rollout; owner: Analytics/Client Telemetry
- `comment_draft_restored`: target >= 90% restoration success; owner: Analytics/Client Telemetry

Manual QA checklist (basic, 6–8 steps)
1. Install the client build with the client-side persistence change.
2. Open a PR and create a new conversation comment; observe `Saved locally` indicator appears immediately.
3. Simulate a network failure (airplane mode) and tap Send; verify the UI times out within ~30s and shows Retry/Save as Draft.
4. Select Save as Draft; force-close the app; reopen and confirm the draft restoration sheet appears and `comment_draft_restored` can be observed in logs.
5. Retry sending the draft; verify a single comment appears on the server (no duplicates) and `comment_local_save_success` then `comment_draft_restored` events are emitted.
6. Validate accessibility: screen reader announces state changes and buttons have accessible labels.

Notes on telemetry baselines
- This case study uses user-reported evidence as the baseline. Engineering must provide pre-rollout baseline values for `comment_api_timeout_triggered` and duplicate rates to measure impact accurately.

