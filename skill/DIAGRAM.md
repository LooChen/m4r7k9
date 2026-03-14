---
name: diagram
description: >
  SVG and HTML diagram style guide for The Filter & The Heart book. Use this
  skill whenever creating, editing, or recreating any diagram, illustration,
  or interactive visual for the book — even if the user just says "make a
  diagram" or "add an image". Covers color palette, typography, centering
  rules, interactive HTML patterns, and button styling. Always read this
  before writing any SVG or diagram HTML for the book.
---

# Diagram Style Guide — The Filter & The Heart

This skill captures the visual language of all diagrams in the book. Every
new diagram should feel like it belongs in the same family as the existing
ones. When in doubt, match what's already there.

---

## Color Palette

These are the exact hex values used across all existing diagrams. Do not
substitute or approximate.

| Role | Hex | Usage |
|---|---|---|
| Page background | `#FAFAF8` | SVG background rect, page bg |
| Node fill (default) | `#F5F2ED` | Belief boxes, outcome circles |
| Node fill (self/emphasis) | `#F0EDE6` | SELF circle, heavier nodes |
| Border / stroke (primary) | `#6B6357` | Belief box borders, spoke lines |
| Border / stroke (light) | `#C8C0B0` | Connector lines, dividers |
| Rule / divider | `#DDD8CE` | HR lines, nav borders |
| Text (dark) | `#3D3830` | Headings, SELF label |
| Text (mid) | `#6B6357` | Belief labels, box text |
| Text (faint) | `#9A9080` | Italic subtitles, captions |
| Text (very faint) | `#B0A898` | Loosened sub-labels |
| Accent / warm | `#7A6A52` | Used in CSS vars, nav active |
| Positive (green) | `#5A8A5A` | + outcome circles and labels |
| Negative (red) | `#B85450` | − outcome circles and labels |
| Joy / contentment | `#7A9A7A` | Emergent positive states (Mode 3) |

---

## Typography

Font stack (in order of preference):
```
Georgia, 'EB Garamond', serif
```

Use `font-family="Georgia, 'EB Garamond', serif"` on the root `<svg>` element.
In HTML wrappers use `font-family: Georgia, 'EB Garamond', serif`.

### Font sizes in SVG
| Element | Size |
|---|---|
| Section/node title (caps) | 10.5–11px |
| Italic subtitle inside node | 9.5px |
| Circle label (SELF) | 13px |
| Circle sub-label (italic) | 10px |
| + / − glyph | 18–20px |
| Outcome word label (positive/negative) | 9.5px |
| Caption line at bottom | 10.5–11px |
| Joy/contentment label | 9.5px |

Letter spacing: `0.05em–0.08em` on uppercase labels. Italic subtitles: no
letter spacing.

---

## Centering Rules (Critical)

SVG text does not auto-center vertically. These rules prevent the most common
failure mode (text drifting above or below its container).

### Single-line text in a circle
Use `dominant-baseline="central"` and set `y` exactly to the circle's `cy`:
```svg
<circle cx="522" cy="54" r="18" fill="#F5F2ED" stroke="#5A8A5A" stroke-width="1.4"/>
<text x="522" y="54" text-anchor="middle" dominant-baseline="central"
      font-size="18" fill="#5A8A5A">+</text>
```
Never offset `y` by hand. Never use `dy` on a single-line circle label.

### Two-line text in a circle
Use `tspan` with `dy` offsets. Set the parent `<text>` y to the circle center,
then push lines with `dy`:
```svg
<!-- Circle: cx=110 cy=290 r=70 -->
<text x="110" text-anchor="middle">
  <tspan x="110" y="290" dy="-0.6em" font-size="13" fill="#3D3830"
         letter-spacing="0.08em">SELF</tspan>
  <tspan x="110" dy="1.5em" font-size="10" fill="#9A9080"
         font-style="italic">identity</tspan>
</text>
```
The `dy="-0.6em"` on the first tspan shifts the pair upward so the block
centers on cy. The `dy="1.5em"` on the second tspan steps down one line.
Adjust `-0.6em` if font sizes differ significantly.

### Two-line text in a rect
Find the vertical centre of the rect: `cy = rect_y + rect_height / 2`.
Use that as the anchor y, with `dy` offsets:
```svg
<!-- Rect: x=264 y=94 width=162 height=48, centre y=118 -->
<text text-anchor="middle">
  <tspan x="345" y="118" dy="-0.55em" font-size="10.5" fill="#6B6357"
         letter-spacing="0.05em">BELIEF 1</tspan>
  <tspan x="345" dy="1.5em" font-size="9.5" fill="#9A9080"
         font-style="italic">"being smart is good"</tspan>
</text>
```

### Side labels next to circles
For labels that sit beside an outcome circle, use `dominant-baseline="central"`
and set `y` to the circle's `cy`. This keeps the word vertically aligned with
the circle's centre regardless of font rendering:
```svg
<text x="548" y="54" dominant-baseline="central" font-size="9.5"
      fill="#5A8A5A">positive</text>
```

---

## SVG Structure

### Root element
```svg
<svg xmlns="http://www.w3.org/2000/svg"
     viewBox="0 0 780 520" width="780" height="520"
     font-family="Georgia, 'EB Garamond', serif">
  <rect width="780" height="520" fill="#FAFAF8"/>
  <!-- content -->
</svg>
```
For inline/responsive use (inside HTML), drop `width`/`height` and use
`viewBox="0 0 760 H" width="100%"` instead.

### Connector lines
- Solid connector (spoke): `stroke="#C8C0B0"` `stroke-width="1.2"`
- Dotted connector (outcome link): `stroke="#6B6357"` `stroke-width="0.9"`
  `stroke-dasharray="4 3"`
- Transition lines all get `style="transition:opacity 0.5s"` when used in
  interactive diagrams

### Circles (outcome nodes)
- Radius: 18px for outcome circles in the belief diagram
- Fill: `#F5F2ED`
- Stroke: `#5A8A5A` (positive) or `#B85450` (negative), `stroke-width="1.4"`

### Belief boxes (rect nodes)
- Width: 162px, Height: 48px, `rx="4"`
- Fill: `#F5F2ED`, Stroke: `#6B6357`, `stroke-width="1.2"`

### Caption line
Always a single italic line at the bottom of the diagram:
```svg
<text x="380" y="572" text-anchor="middle" font-size="10.5"
      fill="#9A9080" font-style="italic">Caption text here.</text>
```

---

## Interactive HTML Diagrams

When a diagram needs mode switching, tabs, or animation, embed the SVG inside
an HTML wrapper with a button nav.

### Button nav pattern
The host page CSS will override button text color to transparent unless you
force it. Always use `!important` on button color properties:

```css
.mode-btn {
  background: #F0EDE6 !important;
  border: 1px solid #C8C0B0 !important;
  border-radius: 20px;
  font-family: Georgia, 'EB Garamond', serif !important;
  font-size: 11px !important;
  letter-spacing: 0.06em;
  color: #6B6357 !important;
  cursor: pointer;
  padding: 5px 14px;
  transition: all 0.2s;
  white-space: nowrap;
  outline: none;
}
.mode-btn.active {
  background: #3D3830 !important;
  border-color: #3D3830 !important;
  color: #F5F2ED !important;
}
.mode-btn:hover:not(.active) {
  background: #E8E4DC !important;
  border-color: #9A9080 !important;
  color: #3D3830 !important;
}
```

Nav container — use `flex-wrap: wrap` so buttons reflow on narrow viewports
rather than getting clipped:
```css
.mode-nav {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 6px;
  padding: 14px 12px 12px;
  border-bottom: 1px solid #DDD8CE;
}
```

### SVG transition pattern
Add `style="transition:opacity 0.5s"` inline on every element that will
change between modes. Set opacity via JS `element.style.opacity = value`.
For stroke/fill changes (e.g. self circle border), use `setAttribute` not
inline style:
```js
selfBg.setAttribute('stroke', '#9A9080');
selfBg.setAttribute('stroke-width', '1');
selfBg.style.opacity = 0.35;
```

### Mode data object pattern
Encode all per-mode values in an array of objects, then apply in a single
`setMode(i)` function. This keeps the JS clean and makes adding modes trivial:
```js
const modes = [
  {
    selfOp: 1, selfStroke: '#6B6357', selfSW: 1.5,
    lblFill: '#3D3830', subFill: '#9A9080', subTxt: 'identity',
    beliefOp: 1, spokeOp: 1,
    posOp: 1, negOp: 1, dotPOp: 1, dotNOp: 1,
    lblPOp: 1, lblNOp: 1, joyOp: 0,
    title: '...', desc: '...', caption: '...',
  },
  // ...
];
```

---

## Existing Diagrams — Reference

| File | What it shows |
|---|---|
| `assets/images/belief-vectors.svg` | Belief → internal/external response vectors |
| `assets/images/ego-filter.svg` | World → perception → ego filter → response |
| `assets/images/dissolution.svg` | Dissolution concept |
| `assets/images/oscillation.svg` | Oscillation between states |
| `assets/images/wisdom-matrix.svg` | Four-scenario wisdom matrix |
| `assets/images/book-map.svg` | Full book structure map |
| `essays/05-three-modes.html` | Interactive three-modes diagram (inline SVG + JS) |

Before starting a new diagram, check whether an existing one covers the
territory. New diagrams should feel like they belong in the same family.

---

## Three Modes Opacity Reference

The three-modes diagram established these opacity conventions for "loosening"
states. Reuse them in any diagram that shows a spectrum from solid to dissolved:

| Element | Base | Mode 1 (eliminate −) | Mode 2 (loosen beliefs) | Mode 3 (loosen self) |
|---|---|---|---|---|
| SELF circle | 1.0 | 1.0 | 1.0 | 0.35 |
| Spokes | 1.0 | 1.0 | 0.15 | 0.15 |
| Belief boxes | 1.0 | 1.0 | 0.35 | 0.35 |
| + outcomes | 1.0 | 1.0 | 0.20 | 0.20 |
| − outcomes | 1.0 | 0.07 | 0.07 | 0.07 |
| Dotted lines (+) | 1.0 | 1.0 | 0.20 | 0.20 |
| Dotted lines (−) | 1.0 | 0.08 | 0.07 | 0.07 |
| Joy ring | 0 | 0 | 0 | 1.0 |

Key insight: Mode 2 and Mode 3 use identical opacities for beliefs and
outcomes. The only visual difference between them is that Mode 3 fades the
SELF circle and reveals the joy ring.

---

## Checklist Before Finishing Any Diagram

- [ ] Background rect is `#FAFAF8`
- [ ] All text uses Georgia / EB Garamond stack
- [ ] Single-line circle text: `y` = circle `cy`, `dominant-baseline="central"`
- [ ] Two-line text: `tspan` with `dy` offsets, never absolute `y` guesses
- [ ] Side labels next to circles: `dominant-baseline="central"`, `y` = circle `cy`
- [ ] Interactive buttons: all color properties use `!important`
- [ ] Button nav: `flex-wrap: wrap` so buttons don't get clipped on narrow screens
- [ ] Caption line present at bottom, italic, `fill="#9A9080"`
- [ ] Viewbox height checked — last element + 20px buffer
