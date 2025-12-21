Proposed telemetry events (specs)

1) `comment_submission_started`
   - fields: { pr_id, draft_id, timestamp, client_version }

2) `comment_local_save_success`
   - fields: { pr_id, draft_id, timestamp }

3) `comment_api_timeout_triggered`
   - fields: { pr_id, draft_id, duration_ms, network_type }

4) `comment_retry_attempted`
   - fields: { pr_id, draft_id, attempt_count }

5) `comment_draft_restored`
   - fields: { pr_id, draft_id, draft_age_seconds }

Suggested alerts / dashboards
- Alert if `comment_api_timeout_triggered` increases by >50% after rollout.
- Dashboard: draft restoration rate and duplicate comment count.
