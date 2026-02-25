# Nebula Drift: Rosette Sample

Dark theme preview for Vim / Neovim.

## Checklist

- [x] Strings
- [x] Numbers (`42`, `3.14159`)
- [x] Comments
- [x] Keywords
- [ ] UI screenshot

## Inline styles

Use `:colorscheme nebula_drift_rosette` and enable **true color** with
`set termguicolors`.

> The Rosette Nebula palette is bold but readable.

```vim
set background=dark
colorscheme nebula_drift_rosette
```

## Language coverage

| Family | Samples | Notes |
|---|---:|---|
| Systems | 5 | C, C++, Rust, Go, Pascal |
| Web | 4 | HTML, CSS, JS, TS |
| Scripting | 4 | Python, Bash, PowerShell, Vim script |
| Data | 3 | JSON, YAML, Markdown |
| SQL | 3 | DB2, MySQL, PostgreSQL |

## Screenshot plan

1. Open `samples/python.py` with line numbers enabled.
2. Split window with `samples/sql/postgresql.sql`.
3. Add `samples/web/index.html` in a third pane for tags/attributes.
4. Capture one shot with cursorline and one without.

### Notes

- Prefer a monospaced font with clear italics for comments.
- Turn on `:set list` once to inspect whitespace contrast.
- Test both `Normal` and `Visual` selection readability.

## Diff examples to verify

- `+ added_line = "Nebula Teal"`
- `- removed_line = "Old Accent"`
- `! changed_line = "Solar Gold" -> "Young Star"`
- Merge conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)

## Vim commands for capture

```vim
:set number relativenumber cursorline
:vsplit samples/sql/postgresql.sql
:split samples/vimscript.vim
:setlocal foldmethod=syntax
:hi
```
