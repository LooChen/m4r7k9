# Custom Web Editor — Requirements Brief

## What we're building
A custom browser-based editing interface for a personal book/blog project ("The Filter & The Heart") currently published as a static HTML site on GitHub Pages. The editor should feel like an extension of the book itself — same fonts, same aesthetic — not a third-party CMS.

## Current stack
- Static HTML/CSS site hosted on GitHub Pages
- Repo: github.com/LooChen/m4r7k9 (public)
- Live: https://loochen.github.io/m4r7k9/
- No backend, no database, no build step
- Essays are hand-authored HTML files
- Claude (AI) has GitHub connector access and reads/writes files directly to the repo
- All collaboration between author and Claude happens in Claude.ai chat

## Core workflow (what this enables)
1. Author opens editor in browser, logs in
2. Author reads essays, leaves inline comments/notes
3. Author opens Claude.ai, says "look at my notes on chapter 2"
4. Claude reads comments.json from GitHub, drafts with author
5. Claude pushes updated essay to GitHub
6. Author refreshes editor page, sees new version

Claude is NOT integrated into the editor app itself. Claude accesses the same GitHub repo independently via its connector. The editor just needs to make the author's side of the workflow clean.

## Requirements

### Must Have
- **Secure login** — GitHub OAuth preferred (single button, no new account)
- **Inline commenting** — select text, leave a note, saved to GitHub as structured data (comments.json or similar)
- **Claude can read/write** — all data stored in GitHub repo files, accessible to Claude via API
- **Timeline/planner** — Kanban-style board for chapter status (Draft / In Progress / Review / Published). Currently exists as a standalone HTML page, needs to survive in new system.
- **Multi-session** — works from any browser, any device

### Nice to Have
- **Inline editing** — click a paragraph, edit text, save commits to GitHub
- **Custom styling** — editor UI uses book's own design system (not a third-party editor skin)

### Hard constraints
- No third-party CMS UI (Pages CMS, TinaCMS, etc.) — editing experience must use book's own typography and styles
- GitHub must remain the single source of truth for all content and comments
- No lock-in — if the editor disappears, everything is still in GitHub as readable files
- Author is non-technical — no command line, no git commands
- Claude must be able to read comments and essay files without any special integration

## Design system (must be preserved in editor)
- Background: #FAFAF8 (warm off-white)
- Text: #2E2A24 (warm near-black)
- Display font: Cormorant Garamond (light/300)
- Body font: EB Garamond
- Tone: clean, minimal, warm, editorial

## Content structure
- ~13 HTML essay files in /essays/
- 1 comments.json (to be created) for all inline notes
- 1 planner page (Kanban board, currently planner.html)
- Supporting assets: style.css, SVG diagrams, comment-mode.js

## Auth options being considered
- GitHub OAuth App (free, scoped to one repo, author logs in with GitHub account)
- Simple password + token stored in browser (lower security, simpler setup)
- Magic link via email (requires email sending service)

## Deployment options being considered
- Single edit.html file hosted on GitHub Pages (no backend — auth token stored in browser)
- Vercel serverless function for OAuth flow + static HTML for editor UI
- Fully custom Next.js app on Vercel (most capable, most work)

## Key open question
Can GitHub OAuth be implemented securely in a purely static/client-side setup (no backend server), or does the OAuth callback require a serverless function? If a serverless function is required, what is the minimum viable backend — can it be a single Vercel function with no database?

## What we're NOT building
- A public-facing CMS for multiple authors
- A real-time collaborative editor (one author, one AI)
- Anything with a database
- A replacement for the book's public site (that stays as-is)
