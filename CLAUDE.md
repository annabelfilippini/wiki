# Knowledge Router

This is Annabel's Obsidian knowledge vault.

## Folders

- `raw/` - immutable source drops and assets.
- `wiki/` - organized knowledge graph maintained by AI.
- `outputs/` - answers, reports, todos, business ideas, and generated deliverables.
- `wayloft/` and other project folders - operational project artifacts, not general wiki pages.

## Default Workflow

- Read `index.md` before answering broad wiki queries.
- For source ingest, save to `raw/` first.
- Use lite ingest for Telegram by default: raw file plus one source summary, no cross-wiki updates.
- Use deep ingest only when explicitly requested.
- Keep `raw/` filenames lowercase kebab-case with source/date prefixes.
- Keep `wiki/` and `outputs/` pages concise, linked, and frontmatter-backed.

## File Style

- Use Obsidian wikilinks for concepts and entities.
- Lead with the most important facts.
- Flag uncertainty and source conflicts explicitly.
- Update `log.md` when ingesting or materially changing the vault.

## Full Schema

The full pre-slim schema is preserved at `docs/CLAUDE.full.md`.

Compatibility note: `../wiki` is a symlink to this vault. Prefer `~/Documents/AI-OS/knowledge/...` in new docs and scripts.
