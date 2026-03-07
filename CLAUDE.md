# The Filter & The Heart — Project Instructions for Claude Code

## What this project is
A short book / blog series of essays based on insights from meditation practice.
Written for friends and family. Conversational, warm, no academic credentials claimed.
Written collaboratively with Claude (claude.ai) — that's acknowledged openly in the preface.

## Your job (Claude Code)
This folder is the local git repository that publishes to https://loochen.github.io
GitHub repo: https://github.com/LooChen/loochen.github.io

**Your primary task is publishing:** when new files appear in this folder, commit and push them to the repo so the site updates.

A typical command when new files are ready:
```
git add .
git commit -m "Add [filename or description]"
git push origin main
```

## Site structure
```
/                        ← index.html (homepage, lists all essays)
/essays/                 ← individual essay HTML files
/assets/style.css        ← shared stylesheet (design system)
```

## Design system (already established)
- Background: #FAFAF8 (warm off-white)
- Text: #2E2A24 (warm near-black)
- Light text: #6B6357
- Faint text/labels: #9A9080, #B0A898
- Rules/borders: #DDD8CE, #C8C0B0
- Accent: #7A6A52
- Positive/pride: #5A8A5A green
- Negative/resentment: #B85450 terracotta
- Display font: Cormorant Garamond (light/300)
- Body font: EB Garamond
- Tone: Clean, minimal, warm, editorial

## Book outline (for context)
**Preface** — personal note, role of Claude, invitation to test ideas yourself

**Part I — The Machine**
1. The Ego as Process
2. The Filter in Action
3. The Pack Animal Substrate
4. The Addiction Engine

**Part II — The Curator**
5. The Curator
6. Why Wisdom Gets Filtered Out
7. The Realms

**Part III — The Paths**
8. Making the World Conform
9. Dissolving the Beliefs
10. De-objectifying the Self

**Part IV — The Heart**
11. The Trap on Both Paths
12. The Spirit Path vs. The Status Path
13. What Opening the Heart Actually Means

**Epilogue**

## Collaboration workflow
- All writing and design happens in claude.ai (this project)
- Claude (claude.ai) writes finished HTML files directly into this folder
- Claude Code's job is purely to git commit and push when files are ready
- Do not edit content or design — just publish what's here

## GitHub Pages
The site is served via GitHub Pages from the main branch root.
No build step required — just push HTML/CSS files and they go live.
