Key user quotes (extracted from the GitHub discussion)

1) "I can add comments to existing conversations but cannot start new conversations." — indicates the problem is specific to starting new threads.

2) "You see the waiting circle and nothing happens. Conversation is never added." — demonstrates a hanging POST request / infinite spinner.

3) "Comment is gone when stopping and reopen the app." — demonstrates data loss when the app is killed; motivates pre-POST persistence.

4) "When I force close the app and navigate back to the PR, the comment is still there. I just cannot save it." — shows inconsistent device behavior (partial OS-level persistence on some devices).

Context: these quotes are the primary qualitative evidence for the case study. No internal telemetry was available for validation.
