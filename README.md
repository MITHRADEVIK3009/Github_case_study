# Case Study: Resolving GitHub Mobile Android PR Regression (Issue #181590)
Detailed explantaion can be found in wiki page:https://github.com/MITHRADEVIK3009/Github_case_study/wiki/GitHub-Mobile-PR-Reliability-Case-Study
## Executive summary
This focused case study documents discovery, analysis, and a prioritized, implementable solution for a critical reliability regression in GitHub Mobile (Android) that prevents users from starting new PR conversations. The deliverable demonstrates product judgment, prioritization, measurable success criteria, and cross-functional alignment.

## Problem in one sentence
New PR conversation creation can hang indefinitely (infinite spinner). The UI remains responsive while the background POST request never completes; users who force-close the app lose their comment (volatile RAM loss) on many devices.

## Primary recommendation (concise)
Adopt an Atomic Persistence Layer: write drafts to local persistent storage (Room/SQLite) before initiating the network POST, add a client-side timeout (30s) to surface a Retry/Save Draft state, and attach a client-generated idempotency key to avoid duplicate posts on retry.

**Timeline (4 days)**
- Day 1: Collected and annotated user evidence from the GitHub discussion; reconstructed repro steps.
- Day 2: Performed root-cause mapping (sequence diagrams) and evaluated solution options (persistence vs. server fixes).
- Day 3: Drafted the Atomic Persistence design, Room/SQLite schema sketch, and telemetry events; created low-fi wireframes.
- Day 4: Polished the proposal, added acceptance criteria, QA checklist, and assembled the PDF export for review.

**Constraints and scope note**
This package is scoped as a product-level deliverable: conceptual architectures, prioritized requirements, and a clear implementation path for engineering to execute. It intentionally excludes production code, internal telemetry extraction, or stress-test harnesses which require engineering access and are out of scope for a short student PM case study.

**Assumptions**
- This analysis uses public GitHub discussion quotes as primary evidence; no internal telemetry was available.
- Device/version mentions in the thread may be imprecise; treat platform divergence as an observed anomaly until engineering reproduces it.
- 
## Acceptance criteria (example - to be validated by engineering/analytics)
- Draft persistence: On force-close after a failed send, 90% > of persisted drafts are recoverable by the client (functional verification).
- Timeout behavior: The UI surfaces a Retry/Save Draft state within 30s of the POST request being initiated under network failure conditions.
- Duplicate prevention: Re-sent drafts should not create duplicate comments in greater than 0.1% of retries (to be validated via telemetry after rollout).

