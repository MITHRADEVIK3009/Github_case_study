Metrics table (simple)

| Metric | Current (reported) | Target | How to measure |
|--------|--------------------:|-------:|----------------|
| Data loss incidents | ~30% (user reports) | 0% | Count of drafts vs successful server posts, user reports
| Max wait time (UI) | Infinite / spinner | 30s | Client-side timer for POST requests
| Task completion (comments per session) | Unknown | 95%+ | Session analytics: sessions with ≥1 comment

Notes: Baselines must be validated by engineering/analytics prior to rollout.
