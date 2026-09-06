# Debug Prompt

Use this prompt when the task is a bug fix, regression, runtime issue, broken state flow, or unexpected behavior.

## Goal
Find the real cause and apply the smallest safe fix.

## Workflow
1. Reproduce or understand the failure clearly.
2. Identify the user-visible symptom.
3. Trace the actual cause before proposing a fix.
4. Preserve existing behavior outside the bug scope.
5. Prefer targeted fixes over broad rewrites.
6. Add cleanup only when it directly helps the bug fix.
7. If the bug reveals an architectural problem, explain it separately from the fix.

## Use With Skills
- Use `flutter-architecture` when the bug involves Cubit, widget lifecycle, or feature structure.
- Use `flutter-code-style` when simplifying the fix improves clarity.

## Output Format
Before implementation provide:
- Symptom
- Likely Cause
- Evidence
- Fix Plan
- Risk

After implementation provide:
- Root Cause
- Fix Applied
- Behavior Preserved
- Validation Performed

## Rules
- Do not refactor broadly during a bug fix.
- Do not change contracts unless required to fix the issue.
- If the bug is not reproducible from available context, say what is missing.
