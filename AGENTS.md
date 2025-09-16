# Repository Guidelines

## Project Structure & Module Organization
The Jekyll site lives at the repository root: Markdown pages under `docs/`, shared layouts in `_layouts/`, includes in `_includes/`, and theme styles in `_sass/`. Source message contracts are maintained as TypeScript interfaces in `requestTypes.ts` and `callbackTypes.ts`. TypeSpec definitions and generated SDKs are contained in `typespec/`, with compiled artifacts landing in `typespec/tsp-output/` and client folders under `typespec/generated/`. Static assets are stored in `images/` and `assets/`; treat `_site/` as disposable build output.

## Build, Test, and Development Commands
- `bundle install && bundle exec jekyll serve` — run the documentation site locally at http://127.0.0.1:4000.
- `bundle exec jekyll build` — produce a production-ready `_site/` folder.
- `npm install` (inside `typespec/`) — install schema and generator tooling.
- `npm run build` (inside `typespec/`) — compile TypeSpec, refresh OpenAPI, and regenerate all SDKs.
- `npx tsp compile .` — iterate quickly on schema-only changes without regenerating clients.

## Coding Style & Naming Conventions
Use two-space indentation and prefer single quotes within TypeScript files; omit trailing semicolons to align with existing style. Interfaces and types follow PascalCase (`Salgsmelding`), while properties remain camelCase (`datoOverdragelse`). Enum members are lowercase string literals to mirror API payloads. Keep TypeSpec models synchronized with their TypeScript counterparts, mirroring property ordering and doc comments where possible. Markdown pages should start with Jekyll frontmatter (`---`) and use sentence-case headings.

## Testing Guidelines
There are no unit tests, so rely on automated schema validation: `npm run build` must succeed before merging. For TypeScript edits, run `tsc --noEmit requestTypes.ts callbackTypes.ts` to catch typing regressions. When touching documentation, verify the rendered site via `bundle exec jekyll serve` and spot-check affected pages. Avoid committing generated SDKs unless the change requires updated clients; if regenerated, ensure each target language builds cleanly using the instructions in the respective `typespec/generated/*` README files.

## Commit & Pull Request Guidelines
Commits typically use a short imperative prefix (`Fix:`/`feat:`) followed by a concise change summary; mirror that tone and scope. Group related schema and documentation updates together so reviewers see aligned changes. Pull requests should include: a narrative of the change, affected message types or pages, regeneration steps taken (`npm run build`, Jekyll build), and any screenshots for visual tweaks. Link to relevant issue IDs when available and highlight breaking API changes explicitly in the description.
