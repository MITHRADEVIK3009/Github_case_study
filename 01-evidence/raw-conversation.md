Evidence: GitHub Discussion excerpts (primary source)

Selected quotes and observations used as primary evidence for this case study:

- "I can add comments to existing conversations but cannot start new conversations" — user report indicating the failure is specific to starting new conversations.
- "yes, you can start it and hit the send arrow. then you see the waiting circle and nothing happens. conversation is never added" — indicates a hanging POST request and infinite spinner.
- "comment is gone when stopping and reopen the app" — demonstrates data loss when the app is killed; supports need for pre-POST persistence.
- "The spinner keeps spinning forever." — supports adding a finite client-side timeout and a Retry UI.
- "When I force close the app and navigate back to the PR, the comment is still there. I just cannot save it." — platform divergence: some devices show partial persistence.
- App versions mentioned in the thread include `1.237.1` and latest beta; reproduce notes are inconsistent across devices.


Primary evidence assumptions and constraints
- The GitHub discussion is the primary data source for this analysis; internal telemetry was not available and is out of scope for this project.
- Where device/OS names are ambiguous in the thread, this repo treats them as anomalies and documents them as such (see `03-analysis/diagrams/android-divergence.mmd`).

Repro steps (as reported)
1. Open GitHub Mobile and navigate to a Pull Request conversation.
2. Tap the inline comment composer to start a new conversation thread.
3. Enter text and tap the Send arrow.
4. Observe: the UI shows a waiting spinner; no success or error is presented.
5. If the user force-closes the app and re-opens, some devices show the comment persisted, while others show the comment lost.

Notes on reproducibility
- These steps are reconstructed from user reports in the thread and may not capture device-specific steps or app-state required to reproduce locally. Engineering should attempt to reproduce on the same app versions and network conditions reported by users (`1.237.1`, beta builds where available).


Files to attach (place screenshots in this folder):
- `thread-screenshots/initial-report.png` (annotated)
- `thread-screenshots/android-version-divergence.png` (annotated)

