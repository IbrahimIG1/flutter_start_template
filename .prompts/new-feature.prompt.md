# New Feature Prompt

Use this prompt when implementing a new feature or extending an existing one.

## Goal
Build the simplest maintainable solution that fits the existing project architecture.

## Workflow
1. Understand the feature request fully.
2. Ask questions if requirements are unclear or risky.
3. Search shared code and similar features first.
4. Choose the simplest maintainable design.
5. Follow existing architecture unless there is a strong reason not to.
6. Use localization for all user-facing text.
7. Create or update the feature README.
8. Keep Cubits clean and repositories focused.
9. Explain tradeoffs when introducing a new pattern.

## Use With Skills
- Use `flutter-architecture` for Flutter/Cubit structure.
- Use `documentation` to create or update the feature README.

## Output Format
Before coding provide:
- Feature Understanding
- Assumptions
- Reuse Opportunities
- Proposed Approach
- Risks or Open Questions

After coding provide:
- Files Changed
- Architectural Decisions
- Localization Keys Added
- README Status
- Validation Performed

## Rules
- Prefer readability over cleverness.
- Do not introduce abstractions without a real maintenance benefit.
- Keep UI split by logical sections, not by tiny widgets.
