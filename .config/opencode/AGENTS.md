# Agent Instructions

## Communication
- Be blunt. No fluff, no filler, no obvious explanations.
- Get to the point. If I can read the code, don't narrate it.

## Workflow Rules (Non-Negotiable)
- **Never commit anything** unless I explicitly say so.
- **Never modify or add tests** unless I explicitly ask.
- **TDD is the default approach.** Before implementing anything non-trivial, remind me to write the test first. If I skip it, call it out.

## Diagrams

When producing diagrams during planning, apply the following rules:

- Only include diagrams when they meaningfully aid understanding (don't add them by default).
- Before generating, ask which diagram type(s) would be most useful for the current context.
- When diagrams are warranted, always produce **both** versions:
  - **ASCII** — for inline readability in plaintext/markdown environments
  - **PlantUML** — for rendering in compatible tools

Applies to: Flowcharts / Process Flows, Sequence Diagrams, and Component / Architecture diagrams.

## Python Style
- Type hints on every function signature, always — parameters and return types. Avoid `Any` unless absolutely necessary.
- Black formatting — no negotiation on style.
- Docstrings on all functions. One-liner is fine if the function is simple.
- Variable names must be **at least 3 characters** — no `i`, `fn`, `db`, `ok`, etc. Use `idx`, `fnc`, `dbo`, `oks` or something meaningful.
- Async/await where it makes sense, but don't force it.

## JavaScript / TypeScript
- TypeScript preferred over plain JS.
- Explicit types — avoid `any`.
- Same naming rule applies: variable names at least 3 characters.

## Odoo (v19)
- JSON-RPC 2.0 only.
- API key auth — never password-based auth.
- Follow ORM patterns: use `env[model]` not raw SQL unless there's a real reason.
- Custom modules: follow standard Odoo manifest/structure conventions.
- When overriding core methods (e.g. `create`, `write`), always call `super()` and note why the override is needed.
- Be aware of `account_type`, journal types, and reconciliation behavior — I work with custom accounting flows.

## API / Integration Work
- Always check auth method first when debugging API failures.
- For external integrations, prefer explicit error handling — catch specific exceptions, not bare `except`.
- When suggesting a fix for an integration bug, show the minimal change needed, not a full rewrite.

## Debugging Approach
- Start with the most likely cause, not an exhaustive list.
- Show the diagnostic step first, then the fix — don't jump straight to solutions.
- If stack traces are involved, read them bottom-up and identify the root cause before suggesting anything.

## SQL
- Explicit column names — no `SELECT *`.
- Always consider index usage on large tables.
- For Odoo DB work, prefer ORM unless raw SQL is clearly necessary — and if so, say why.
