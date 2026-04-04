---
summary: "Curated vendored Vercel agent skills and the update policy for keeping them pinned"
read_when:
  - Working on React, Next.js, UI review, or interaction patterns in this starter.
  - Updating vendored skills from `vercel-labs/agent-skills`.
  - Deciding whether a new upstream skill belongs in the default starter layer.
---

# Agent Skills

PI Starter vendors a small subset of Vercel's upstream agent skills so repo-local workflows can reference stable, pinned guidance.

## Pinned Upstream

- Source repo: `https://github.com/vercel-labs/agent-skills`
- Manifest: `agent/skills-manifest.json`
- Sync command: `npm run skills:sync`
- Verify command: `npm run skills:verify-sync`

## Vendored Skills

- `agent/skills/vercel-labs/react-best-practices`
- `agent/skills/vercel-labs/composition-patterns`
- `agent/skills/vercel-labs/react-view-transitions`
- `agent/skills/vercel-labs/web-design-guidelines`

Use these as repo-local references when:

- building or refactoring React and Next.js code
- reviewing UI code for accessibility or web interaction issues
- designing component APIs that should avoid prop sprawl
- adding view transitions or route-level motion

## What Stays Local

The starter keeps its own canonical workflow docs in `docs/` and its own deployment baseline in `docs/deploying-to-vercel.md`.

We intentionally do not vendor every upstream skill into the default starter. The following are currently excluded on purpose:

- `deploy-to-vercel`: broad operational workflow that overlaps with this starter's local deployment doc
- `vercel-cli-with-tokens`: token-handling workflow that should stay opt-in
- `react-native-skills`: outside the default web-first starter scope

## Update Flow

1. Review the upstream `skills/` tree and decide whether the curated subset should change.
2. Update `agent/skills-manifest.json` with the new pinned commit or with any curated-scope changes.
3. Run `npm run skills:sync`.
4. Run `npm run skills:verify-sync`.
5. Run `npm run docs:list` if this doc or other docs changed.
6. Run `npm run agent:check` before handoff or ship.

## Multi-Machine Note

`docs:list`, `skills:sync`, and `skills:verify-sync` are Node-only and should work even when native packages need reinstalling.

`npm run check` still depends on native packages such as Biome, esbuild, and the TypeScript native preview build. After moving between `darwin-x64`, `darwin-arm64`, Linux, or Rosetta/native modes, reinstall dependencies on that machine before running `npm run check`.
