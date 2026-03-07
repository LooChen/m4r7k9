# Project Context: The Filter & The Heart

## What you're looking at
This folder is the local git repository for a personal blog/book site that publishes to:
- **Live URL:** https://loochen.github.io
- **GitHub repo:** https://github.com/LooChen/loochen.github.io

The site is built with static HTML/CSS files — no framework, no build step. GitHub Pages serves it directly.

## Your role (Claude Code)
You are the **publishing layer** for this project. All writing and design happens in claude.ai (a separate Claude instance with project memory). That Claude writes finished HTML files directly into this folder. Your job is to:

1. **Keep the repo connected and authenticated with GitHub**
2. **Push new/updated files whenever asked**
3. **Set up the repo if it isn't already** (git init, remote, auth)
4. **Help with any git issues** that come up

You are NOT responsible for writing content or designing pages — just publishing what's here.

## Current git status
- Folder has been initialized as a git repo
- Remote should point to: https://github.com/LooChen/loochen.github.io.git
- GitHub username: LooChen
- Authentication may not be set up yet — handle this if needed

## Site structure (to be built)
```
/index.html              ← homepage listing all essays
/assets/style.css        ← shared design system stylesheet  
/essays/                 ← individual essay HTML files
  preface.html
  01-ego-as-process.html
  ... etc
```

## Design system (for reference — already established in claude.ai)
- Background: #FAFAF8 (warm off-white)
- Text: #2E2A24 (warm near-black)
- Accent: #7A6A52 (warm brown)
- Positive: #5A8A5A green, Negative: #B85450 terracotta
- Fonts: Cormorant Garamond (display), EB Garamond (body)
- Tone: clean, minimal, warm, editorial

## Book outline (context only)
A meditation-based philosophy book in essay form. 13 chapters across 4 parts:
- Part I: The Machine (ego, filter, status, addiction)
- Part II: The Curator (curation, wisdom, realms)  
- Part III: The Paths (conform, dissolve, de-objectify)
- Part IV: The Heart (traps, spirit vs status path, opening the heart)

## Typical publish workflow
When the human says "push new files" or "publish":
```bash
git add .
git commit -m "descriptive message based on what changed"
git push origin main
```

## Important notes
- The human is not a developer — keep explanations simple
- If authentication fails, find the simplest possible solution
- GitHub Pages auto-deploys on push to main — no other steps needed
- If something breaks, explain clearly what happened and what to do
