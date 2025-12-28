
##  STUDENT LEARNING PROJECT 

**This is an academic case study created by a student for learning and portfolio purposes.**

### What this project is:
-  Practice applying product management frameworks to real-world bug reports
-  Hypothesis formation based on publicly observable user behavior
-  Learning exercise in technical analysis and communication
-  Portfolio demonstration of PM thinking and prioritization skills

### What this project is NOT:
-  Access to GitHub's source code, internal systems, or telemetry data
-  Verified root cause analysis (all technical claims are speculative)
-  Official solution proposal or recommendation to GitHub
-  Replacement for maintainer or engineering team investigation

**All technical explanations are hypotheses** based on general Android/mobile development patterns and public user reports. Proposed solutions are conceptual exercises, not implementation-ready specifications.

**Source:** Public discussion at [GitHub Discussion #181590](https://github.com/orgs/community/discussions/181590)

---

# Case Study: Analyzing GitHub Mobile Android PR Regression (Issue #181590)

## Executive Summary
This case study documents my analysis of a critical reliability issue in GitHub Mobile (Android) where users cannot start new PR conversations. The project demonstrates product thinking, user research synthesis, hypothesis formation, and solution prioritization—core PM skills practiced in an academic context.

**For detailed analysis:** [Wiki Documentation](https://github.com/MITHRADEVIK3009/Github_case_study/wiki/GitHub-Mobile-PR-Reliability-Case-Study)

---

## Problem Statement (From User Reports)
New PR conversation creation hangs indefinitely (infinite spinner). The UI remains responsive while the background request never completes. Users who force-close the app lose their comment on many devices, though behavior varies across Android versions.

While general comments work correctly, new inline code review conversations consistently fail. This pattern suggests a specific code path issue.

---

## Visualizing the Problem

<img width="448" height="1024" alt="image" src="https://github.com/user-attachments/assets/97048281-ef8e-491a-9297-36cc4493d394" />

**Figure 1:** Observed "deadlock point" based on user reports. The diagram illustrates the divergence in behavior across Android environments, suggesting inconsistent data persistence handling.

*Note: This visualization is based on reported symptoms, not verified internal architecture.*

---

## Hypothesis: Possible Root Cause

Based on user-reported symptoms, one possible explanation could be:

- Background POST request hangs without timeout mechanism
- Comment data stored in volatile memory (RAM) during submission
- UI thread remains responsive (allowing navigation), masking the underlying failure
- Process termination leads to data loss on devices without OS-level state preservation
- Android 16 appears to have different behavior, possibly due to OS-level caching

**Important:** Without access to the actual codebase or error logs, this remains speculative.

---

## Conceptual Solution Framework

If I were approaching this as a exercise, I might explore:

### Core Principle
Never lose user data, regardless of network or app state.

### Hypothetical Approach
1. **Pre-submission persistence**: Save draft to local storage before network call
2. **Client-side timeout**: Surface actionable state after reasonable wait time (e.g., 30s)
3. **Idempotency protection**: Prevent duplicate submissions on retry
4. **Draft recovery UI**: Allow users to resume unsent comments

---

## Study Scope & Limitations

### This case study includes:
-  Evidence gathering from public user reports
-  Pattern analysis and symptom clustering
-  Hypothesis formation using general mobile development knowledge
-  Conceptual solution frameworks (for learning purposes)

### This case study does NOT include:
-  Access to GitHub Mobile source code
-  Internal error logs or telemetry data
-  Verified technical architecture details
-  Actual implementation or testing
-  Production-ready specifications
### Key Assumptions
- User reports accurately describe observed behavior
- Device/version information may be imprecise
- Technical hypotheses are based on standard Android patterns, not GitHub's actual implementation
- Proposed solutions are conceptual and would require validation by GitHub's engineering team

---

## Hypothetical Success Metrics

*If this were a real implementation, success might be measured by:*

- **Data loss prevention:** Percentage of drafts successfully persisted and recoverable
- **User feedback:** Time until actionable UI state appears during failures
- **Duplicate prevention:** Rate of duplicate comment submissions on retry

*Note: These are practice metrics for learning purposes, not actual targets for GitHub's team.*

---

### Technical Knowledge Applied:
- Android app lifecycle and process management
- Mobile persistence patterns (Room/SQLite, ViewModel state)
- Network failure handling and timeout strategies
- Idempotency in distributed systems
- UI/UX considerations for error states

---

## Reflections & Learnings

### What I Learned About Product Management:
- The importance of separating observation from inference
- How to form testable hypotheses from limited information
- Balancing technical depth with scope constraints
- The value of clear stakeholder communication about limitations

### What I Learned About Open Source Engagement:
- Timing matters: active incidents require different participation than post-mortems
- Transparency about role and constraints prevents misunderstandings
- Community norms vary between academic and practitioner spaces
- Humility is essential when proposing solutions without internal context

### Technical Growth:
- Deeper understanding of Android persistence mechanisms
- Experience with system design thinking for mobile apps
- Practice translating user pain points into technical requirements

---

## Acknowledgements

This case study references public user reports from [GitHub Discussion #181590](https://github.com/orgs/community/discussions/181590).

Special thanks to the users who documented their experiences: @viceice, @Rob--W, @Coding-Hen, @ricardoV94, and @Netail. Their detailed reproduction steps and diagnostic information made this learning exercise possible.

Thanks also to @kangarruu (GitHub staff) for community engagement, and to @Rob--W for direct feedback that helped me understand the importance of clear scope communication.

---

## Future Improvements

If continuing this learning exercise, I would:

**Short-term:**
- Conduct structured interviews with Android developers to validate hypotheses
- Research GitHub Mobile's actual tech stack (React Native vs native Android)
- Study similar failures in other mobile apps (comparative analysis)

**Long-term:**
- Contribute to actual open source Android projects to gain practitioner experience
- Study real post-mortem reports from production incidents
- Develop deeper expertise in mobile reliability engineering

---

## Contact & Feedback

I'm a student learning product management and open to feedback on:
- Technical accuracy of mobile development assumptions
- Clarity of documentation and visual communication
- Scope definition and constraint acknowledgment
- Any aspect of the analysis methodology

**Author:** Mithradevi K  
**Institution:** Chennai Institute of Technology (Anna University)  
**Purpose:** Learning portfolio for PM internship applications  
**Date:** December 2025

---
