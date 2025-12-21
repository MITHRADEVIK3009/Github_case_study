Supporting excerpts from referenced resources (selected highlights)

1) GitHub Discussion (primary user evidence)
- "I can add comments to existing conversations but cannot start new conversations"
- "you see the waiting circle and nothing happens. conversation is never added"
- "comment is gone when stopping and reopen the app"

Notes: These user quotes are the primary data for this analysis; internal telemetry was not available.

2) Android Developers: Room (local persistence guidance)
- "Apps that handle non-trivial amounts of structured data can benefit greatly from persisting that data locally."
- "Room provides an abstraction layer over SQLite to allow fluent database access while harnessing the full power of SQLite."

3) FMEA (methodology)
- "Failure mode and effects analysis (FMEA) is a systematic, step-by-step approach to identify and prioritize possible failures..."
- "Failures are prioritized according to how serious their consequences are, how frequently they occur, and how easily they can be detected."

4) Idempotent Requests (best practice)
- "A client generates an idempotency key... We suggest using V4 UUIDs... Subsequent requests with the same key return the same result."

Practical cautions drawn from the sources
- Do not assume access to internal telemetry — document events and request them from engineering instead of inventing numbers.
- Keep the client changes minimal and clear: pre-POST persistence + timeout + Retry UI.
