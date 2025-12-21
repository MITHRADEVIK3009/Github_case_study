Wireframe guidance (low-fidelity; static PNGs recommended)

State 1 — Active Sending
- Top: PR header
- Editor: user text area
- Footer: "Sending comment..." with spinner and a Cancel button
- Secondary: subtle text "Saved locally" appears after draft write

State 2 — Timeout / Failure
- Orange inline banner: "Connection timed out"
- Buttons: [Retry Now] [Save as Draft]
- Editor remains editable; draft is preserved locally

State 3 — Draft Restoration
- Bottom sheet notification: "You have 1 unsent comment"
- Preview of draft with actions: [Send Now] [Edit] [Discard]


Delivery notes
- Create three static PNGs (hand-drawn or simple shapes) and place them in `04-solution/ui-prototype/`.
- Keep visuals functional: highlight the Retry state and the persistence indicator.

UX copy (exact strings)
- Sending banner: "Sending comment..."
- Saved indicator (small text): "Saved locally"
- Timeout banner: "Connection timed out"
- Timeout actions: `Retry Now`, `Save as Draft`
- Draft restoration sheet title: "You have an unsent comment"
- Draft restoration actions: `Send Now`, `Edit`, `Discard`

Accessibility notes
- Ensure all buttons have accessible labels (e.g., `aria-label="Retry sending comment"`).
- Provide non-visual feedback for state changes (e.g., announce "Comment saved locally" via accessibility API when draft is persisted).
- Ensure color contrast for the timeout banner meets WCAG AA standards; do not rely on color alone to convey state.

