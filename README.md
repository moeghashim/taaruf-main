# pi-starter

Monorepo template following the pi-mono style:
- ESM TypeScript
- Biome formatting/linting (tabs, indentWidth 3, lineWidth 120)
- Strict TypeScript
- `npm run check` gates formatting, linting, and type checking
- Optional max-lines-per-file check
- Required local safeguard: block `gh pr merge` from CLI

Inspired by [badlogic/pi-mono](https://github.com/badlogic/pi-mono).

## Agent Rules

- Canonical source of agent instructions: `AGENTS.md` at repo root.
- Keep tool-specific agent config optional and manual.
- Do not depend on symlink managers for this starter by default.

## Safeguard Policy

- This starter requires a local `gh` wrapper that blocks `gh pr merge`.
- The wrapper is installed to `~/.local/bin/gh` and delegates all other commands to the real GitHub CLI.
- This protects against accidental or automated PR merges from local agent workflows.

## Setup

```bash
npm install
npm run setup
npm run safeguards:verify
npm run check
npm test
```

## Packages

- `@pi-starter/core`
