# /fix

Purpose: fix a bug or issue end-to-end with regression safety.

Workflow:
1. Reproduce and isolate the root cause.
2. If the fix touches React, Next.js, UI review, or transitions, read `docs/agent-skills.md` and consult the relevant vendored Vercel skill before editing.
3. Implement the smallest safe fix.
4. Add or update regression tests.
5. Run `npm run check`, `npm test`, and `npm run agent:check`.
6. Summarize behavior change, tests added, and residual risks.
