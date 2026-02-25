" ============================================================
"  nebula_drift_omega.vim — Nebula Drift: Omega
"  A Cosmic Vim Colour Scheme
"  by Iwan Kelaiah & Claude, in the spirit of C.S. Lewis & Dr. Seuss
" ============================================================
"
"  Installation:
"    1. Copy to ~/.vim/colors/nebula-drift-omega.vim
"    2. Add to your .vimrc:
"         let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"         let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"         set termguicolors
"         set background=dark  " always dark
"         colorscheme nebula-drift-omega
"
"  Supports: SQL, Python, JS, TS, PHP, HTML, CSS, SCSS/SASS,
"            C, C++, Java, Rust, Go, Bash/Shell, PowerShell,
"            YAML, JSON, INI, LISP, Scheme, Racket,
"            Markdown, Pascal/Delphi, Vimscript
" ============================================================

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "nebula-drift-omega"

" ============================================================
"  PALETTE — Sampled from the Omega Nebula (NASA/Marshall)
" ============================================================
"
"  DARK VARIANT — 'The Omega Void'
"  -------------------------------------------------------
"  bg0     #0c1a1e   deepest teal-black void — main background
"  bg1     #112228   nebula depth — cursorline
"  bg2     #162c32   teal murk — visual selection
"  bg3     #1c3640   deep water — statusbar bg
"  bg4     #244048   far shore — line number bg
"
"  fg0     #eedcb8   warm cream starlight — primary text
"  fg1     #c8b898   aged parchment — secondary text
"  fg2     #7a7060   comment smoke — comments (recessed)
"  fg3     #3e3830   void floor — line numbers
"
"  Accents sampled directly from the nebula photograph:
"  amber0  #d48820   gas pillar gold — keywords
"  amber1  #e8a838   bright corona — statements / bold keywords
"  jade0   #5aaa88   jade nebula gas — strings
"  jade1   #3e8870   deep jade — types / classes
"  teal0   #4898a8   nebula ice — functions
"  teal1   #6ab8c8   bright teal star — methods
"  sienna0 #b86030   burnt sienna fold — operators
"  sienna1 #d07848   light copper — special chars
"  var0    #a8c8e0   blue-white starlight — variables & identifiers
"  olive0  #788840   olive haze — numbers (teal meets amber)
"  olive1  #909858   bright olive — booleans
"  rose0   #c86858   deep pink star — errors
"  rose1   #e07868   bright error — error borders
"  gold0   #c89840   harvest gold — warnings

" ============================================================
"  HELPER FUNCTION
" ============================================================

function! s:hi(group, fg, bg, attr)
  if a:fg != ""
    exec "hi " . a:group . " guifg=" . a:fg
  endif
  if a:bg != ""
    exec "hi " . a:group . " guibg=" . a:bg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
  endif
  if a:fg == "" && a:bg == "" && a:attr == ""
    exec "hi " . a:group . " guifg=NONE guibg=NONE gui=NONE cterm=NONE"
  endif
endfunction

" ============================================================
"  THE OMEGA VOID — Dark Variant (only)
" ============================================================



  let s:bg0     = "#0c1a1e"
  let s:bg1     = "#112228"
  let s:bg2     = "#162c32"
  let s:bg3     = "#1c3640"
  let s:bg4     = "#244048"
  let s:bg5     = "#2c4c58"

  let s:fg0     = "#eedcb8"
  let s:fg1     = "#c8b898"
  let s:fg2     = "#7a7060"
  let s:fg3     = "#3e3830"

  let s:amber0  = "#d48820"
  let s:amber1  = "#e8a838"
  let s:jade0   = "#5aaa88"
  let s:jade1   = "#3e8870"
  let s:teal0   = "#4898a8"
  let s:teal1   = "#6ab8c8"
  let s:sienna0 = "#b86030"
  let s:sienna1 = "#d07848"
  let s:var0    = "#a8c8e0"  " blue-white starlight — variables & identifiers
  let s:olive0  = "#788840"
  let s:olive1  = "#909858"
  let s:rose0   = "#c86858"
  let s:rose1   = "#e07868"
  let s:gold0   = "#c89840"

  " ── Editor Chrome ──────────────────────────────────────────
  call s:hi("Normal",        s:fg0,     s:bg0,    "NONE")
  call s:hi("NormalFloat",   s:fg0,     s:bg2,    "NONE")
  call s:hi("NormalNC",      s:fg1,     s:bg0,    "NONE")
  call s:hi("CursorLine",    "NONE",    s:bg1,    "NONE")
  call s:hi("CursorColumn",  "NONE",    s:bg1,    "NONE")
  call s:hi("CursorLineNr",  s:amber1,  s:bg1,    "bold")
  call s:hi("LineNr",        s:fg3,     "NONE",   "NONE")
  call s:hi("SignColumn",    s:fg3,     s:bg0,    "NONE")
  call s:hi("ColorColumn",   "NONE",    s:bg2,    "NONE")
  call s:hi("FoldColumn",    s:fg3,     s:bg0,    "NONE")
  call s:hi("Folded",        s:fg2,     s:bg2,    "italic")
  call s:hi("VertSplit",     s:bg4,     "NONE",   "NONE")
  call s:hi("WinSeparator",  s:bg4,     "NONE",   "NONE")
  call s:hi("EndOfBuffer",   s:bg3,     "NONE",   "NONE")
  call s:hi("Conceal",       s:fg3,     "NONE",   "NONE")

  " ── Selection & Search ─────────────────────────────────────
  call s:hi("Visual",        "NONE",    s:bg3,    "NONE")
  call s:hi("VisualNOS",     "NONE",    s:bg3,    "NONE")
  call s:hi("Search",        s:bg0,     s:amber1, "bold")
  call s:hi("IncSearch",     s:bg0,     s:teal1,  "bold")
  call s:hi("CurSearch",     s:bg0,     s:rose1,  "bold")
  call s:hi("Substitute",    s:bg0,     s:rose0,  "bold")
  call s:hi("MatchParen",    s:amber1,  s:bg4,    "bold")

  " ── Status Bar & UI ────────────────────────────────────────
  call s:hi("StatusLine",    s:fg0,     s:bg3,    "NONE")
  call s:hi("StatusLineNC",  s:fg2,     s:bg2,    "NONE")
  call s:hi("TabLine",       s:fg2,     s:bg2,    "NONE")
  call s:hi("TabLineFill",   "NONE",    s:bg1,    "NONE")
  call s:hi("TabLineSel",    s:fg0,     s:bg0,    "bold")
  call s:hi("WildMenu",      s:bg0,     s:amber0, "bold")
  call s:hi("Pmenu",         s:fg1,     s:bg2,    "NONE")
  call s:hi("PmenuSel",      s:fg0,     s:bg4,    "bold")
  call s:hi("PmenuSbar",     "NONE",    s:bg3,    "NONE")
  call s:hi("PmenuThumb",    "NONE",    s:fg3,    "NONE")

  " ── Messages ───────────────────────────────────────────────
  call s:hi("ModeMsg",       s:jade0,   "NONE",   "bold")
  call s:hi("MoreMsg",       s:jade0,   "NONE",   "bold")
  call s:hi("Question",      s:teal1,   "NONE",   "bold")
  call s:hi("ErrorMsg",      s:rose1,   "NONE",   "bold")
  call s:hi("WarningMsg",    s:gold0,   "NONE",   "bold")
  call s:hi("Directory",     s:teal0,   "NONE",   "bold")
  call s:hi("Title",         s:amber1,  "NONE",   "bold")

  " ── Spelling ───────────────────────────────────────────────
  call s:hi("SpellBad",      s:rose1,   "NONE",   "undercurl")
  call s:hi("SpellCap",      s:gold0,   "NONE",   "undercurl")
  call s:hi("SpellRare",     s:teal1,   "NONE",   "undercurl")
  call s:hi("SpellLocal",    s:jade0,   "NONE",   "undercurl")

  " ── Diff ───────────────────────────────────────────────────
  call s:hi("DiffAdd",       s:jade0,   s:bg1,    "NONE")
  call s:hi("DiffChange",    s:amber0,  s:bg1,    "NONE")
  call s:hi("DiffDelete",    s:rose0,   s:bg1,    "NONE")
  call s:hi("DiffText",      s:teal1,   s:bg2,    "bold")
  call s:hi("Added",         s:jade0,   "NONE",   "NONE")
  call s:hi("Changed",       s:amber0,  "NONE",   "NONE")
  call s:hi("Removed",       s:rose0,   "NONE",   "NONE")

  " ── Core Syntax ────────────────────────────────────────────
  " Contrast hierarchy (brightest to dimmest):
  "   amber1 keywords > fg0 plain text > jade0 strings
  "   > teal1 functions > olive0 numbers > fg2 comments
  call s:hi("Comment",       s:fg2,     "NONE",   "italic")
  call s:hi("Constant",      s:olive0,  "NONE",   "NONE")
  call s:hi("String",        s:jade0,   "NONE",   "NONE")
  call s:hi("Character",     s:jade0,   "NONE",   "NONE")
  call s:hi("Number",        s:olive0,  "NONE",   "NONE")
  call s:hi("Float",         s:olive0,  "NONE",   "NONE")
  call s:hi("Boolean",       s:olive1,  "NONE",   "bold")
  call s:hi("Identifier",    s:var0,    "NONE",   "NONE")
  call s:hi("Function",      s:teal1,   "NONE",   "NONE")
  call s:hi("Statement",     s:amber1,  "NONE",   "bold")
  call s:hi("Conditional",   s:amber1,  "NONE",   "bold")
  call s:hi("Repeat",        s:amber1,  "NONE",   "bold")
  call s:hi("Label",         s:amber0,  "NONE",   "bold")
  call s:hi("Operator",      s:sienna0, "NONE",   "NONE")
  call s:hi("Keyword",       s:amber1,  "NONE",   "bold")
  call s:hi("Exception",     s:rose0,   "NONE",   "bold")
  call s:hi("PreProc",       s:sienna1, "NONE",   "NONE")
  call s:hi("Include",       s:teal0,   "NONE",   "NONE")
  call s:hi("Define",        s:jade1,   "NONE",   "NONE")
  call s:hi("Macro",         s:sienna1, "NONE",   "NONE")
  call s:hi("PreCondit",     s:sienna1, "NONE",   "NONE")
  call s:hi("Type",          s:jade1,   "NONE",   "NONE")
  call s:hi("StorageClass",  s:jade1,   "NONE",   "bold")
  call s:hi("Structure",     s:jade1,   "NONE",   "NONE")
  call s:hi("Typedef",       s:jade1,   "NONE",   "italic")
  call s:hi("Special",       s:sienna1, "NONE",   "NONE")
  call s:hi("SpecialChar",   s:sienna1, "NONE",   "NONE")
  call s:hi("Tag",           s:amber0,  "NONE",   "NONE")
  call s:hi("Delimiter",     s:fg1,     "NONE",   "NONE")
  call s:hi("SpecialComment",s:fg2,     "NONE",   "bold,italic")
  call s:hi("Debug",         s:rose0,   "NONE",   "NONE")
  call s:hi("Underlined",    s:teal0,   "NONE",   "underline")
  call s:hi("Ignore",        s:fg3,     "NONE",   "NONE")
  call s:hi("Error",         s:rose1,   "NONE",   "bold,underline")
  call s:hi("Todo",          s:amber1,  s:bg2,    "bold,italic")

  " ── SQL ────────────────────────────────────────────────────
  call s:hi("sqlKeyword",     s:amber1,  "NONE",  "bold")
  call s:hi("sqlStatement",   s:amber1,  "NONE",  "bold")
  call s:hi("sqlSpecial",     s:jade0,   "NONE",  "NONE")
  call s:hi("sqlType",        s:jade1,   "NONE",  "NONE")
  call s:hi("sqlString",      s:jade0,   "NONE",  "NONE")
  call s:hi("sqlNumber",      s:olive0,  "NONE",  "NONE")
  call s:hi("sqlComment",     s:fg2,     "NONE",  "italic")
  call s:hi("sqlOperator",    s:sienna0, "NONE",  "NONE")
  call s:hi("sqlVariable",    s:sienna1, "NONE",  "NONE")
  call s:hi("sqlFunction",    s:teal1,   "NONE",  "NONE")

  " ── Python ─────────────────────────────────────────────────
  call s:hi("pythonStatement",     s:amber1,  "NONE", "bold")
  call s:hi("pythonBuiltin",       s:teal0,   "NONE", "NONE")
  call s:hi("pythonFunction",      s:teal1,   "NONE", "NONE")
  call s:hi("pythonDecorator",     s:sienna1, "NONE", "italic")
  call s:hi("pythonDecoratorName", s:amber0,  "NONE", "italic")
  call s:hi("pythonClass",         s:jade1,   "NONE", "bold")
  call s:hi("pythonImport",        s:amber1,  "NONE", "bold")
  call s:hi("pythonException",     s:rose0,   "NONE", "bold")
  call s:hi("pythonSelf",          s:sienna1, "NONE", "italic")
  call s:hi("pythonDot",           s:fg2,     "NONE", "NONE")
  call s:hi("pythonString",        s:jade0,   "NONE", "NONE")
  call s:hi("pythonNumber",        s:olive0,  "NONE", "NONE")
  call s:hi("pythonBoolean",       s:olive1,  "NONE", "bold")
  call s:hi("pythonNone",          s:olive1,  "NONE", "bold")
  call s:hi("pythonOperator",      s:sienna0, "NONE", "NONE")
  call s:hi("pythonComment",       s:fg2,     "NONE", "italic")
  call s:hi("pythonTodo",          s:amber1,  s:bg2,  "bold,italic")
  call s:hi("pythonStrFormat",     s:sienna1, "NONE", "NONE")
  call s:hi("pythonFString",       s:jade0,   "NONE", "NONE")

  " ── JavaScript ─────────────────────────────────────────────
  call s:hi("javaScriptFunction",    s:amber1,  "NONE", "bold")
  call s:hi("javaScriptIdentifier",  s:amber1,  "NONE", "bold")
  call s:hi("javaScriptMember",      s:teal1,   "NONE", "NONE")
  call s:hi("javaScriptType",        s:jade1,   "NONE", "NONE")
  call s:hi("javaScriptNull",        s:olive1,  "NONE", "bold")
  call s:hi("javaScriptNumber",      s:olive0,  "NONE", "NONE")
  call s:hi("javaScriptRegexpString",s:sienna1, "NONE", "NONE")
  call s:hi("javaScriptTemplateVar", s:sienna1, "NONE", "NONE")
  call s:hi("jsArrowFunction",       s:sienna0, "NONE", "bold")
  call s:hi("jsClassKeyword",        s:amber1,  "NONE", "bold")
  call s:hi("jsExtendsKeyword",      s:amber0,  "NONE", "bold")
  call s:hi("jsExportDefault",       s:amber1,  "NONE", "bold")
  call s:hi("jsTemplateBraces",      s:sienna1, "NONE", "bold")
  call s:hi("jsObjectKey",           s:teal0,   "NONE", "NONE")
  call s:hi("jsThis",                s:sienna1, "NONE", "italic")
  call s:hi("jsImport",              s:amber1,  "NONE", "bold")
  call s:hi("jsFrom",                s:amber0,  "NONE", "bold")
  call s:hi("jsModuleKeyword",       s:amber1,  "NONE", "bold")
  call s:hi("jsFuncArgs",            s:fg1,     "NONE", "italic")

  " ── PHP ────────────────────────────────────────────────────
  call s:hi("phpKeyword",        s:amber1,  "NONE", "bold")
  call s:hi("phpVarSelector",    s:sienna1, "NONE", "NONE")
  call s:hi("phpIdentifier",     s:var0,     "NONE", "NONE")
  call s:hi("phpFunctions",      s:teal1,   "NONE", "NONE")
  call s:hi("phpClasses",        s:jade1,   "NONE", "bold")
  call s:hi("phpClass",          s:jade1,   "NONE", "bold")
  call s:hi("phpType",           s:jade1,   "NONE", "NONE")
  call s:hi("phpStructure",      s:jade1,   "NONE", "bold")
  call s:hi("phpException",      s:rose0,   "NONE", "bold")
  call s:hi("phpBoolean",        s:olive1,  "NONE", "bold")
  call s:hi("phpNumber",         s:olive0,  "NONE", "NONE")
  call s:hi("phpStringSingle",   s:jade0,   "NONE", "NONE")
  call s:hi("phpStringDouble",   s:jade0,   "NONE", "NONE")
  call s:hi("phpOperator",       s:sienna0, "NONE", "NONE")
  call s:hi("phpMemberSelector", s:fg2,     "NONE", "NONE")
  call s:hi("phpComment",        s:fg2,     "NONE", "italic")
  call s:hi("phpDocComment",     s:fg2,     "NONE", "italic")
  call s:hi("phpNullValue",      s:olive1,  "NONE", "bold")
  call s:hi("phpSuperGlobal",    s:sienna1, "NONE", "italic")

  " ── HTML ────────────────────────────────────────────────────
  call s:hi("htmlTag",            s:jade1,   "NONE", "NONE")
  call s:hi("htmlEndTag",         s:jade1,   "NONE", "NONE")
  call s:hi("htmlTagName",        s:teal0,   "NONE", "bold")
  call s:hi("htmlSpecialTagName", s:amber1,  "NONE", "bold")
  call s:hi("htmlArg",            s:amber0,  "NONE", "NONE")
  call s:hi("htmlString",         s:jade0,   "NONE", "NONE")
  call s:hi("htmlValue",          s:jade0,   "NONE", "NONE")
  call s:hi("htmlComment",        s:fg2,     "NONE", "italic")
  call s:hi("htmlCommentPart",    s:fg2,     "NONE", "italic")
  call s:hi("htmlSpecialChar",    s:sienna1, "NONE", "NONE")
  call s:hi("htmlLink",           s:teal1,   "NONE", "underline")
  call s:hi("htmlTitle",          s:amber1,  "NONE", "bold")
  call s:hi("htmlH1",             s:amber1,  "NONE", "bold")
  call s:hi("htmlH2",             s:amber0,  "NONE", "bold")
  call s:hi("htmlH3",             s:jade0,   "NONE", "bold")

  " ── CSS ────────────────────────────────────────────────────
  call s:hi("cssTagName",         s:teal0,   "NONE", "NONE")
  call s:hi("cssClassName",       s:amber0,  "NONE", "NONE")
  call s:hi("cssClassNameDot",    s:fg2,     "NONE", "NONE")
  call s:hi("cssIdentifier",      s:sienna1, "NONE", "NONE")
  call s:hi("cssProp",            s:jade0,   "NONE", "NONE")
  call s:hi("cssAttr",            s:fg0,     "NONE", "NONE")
  call s:hi("cssColor",           s:olive0,  "NONE", "NONE")
  call s:hi("cssValueLength",     s:olive0,  "NONE", "NONE")
  call s:hi("cssValueNumber",     s:olive0,  "NONE", "NONE")
  call s:hi("cssFunction",        s:teal1,   "NONE", "NONE")
  call s:hi("cssFunctionName",    s:teal1,   "NONE", "NONE")
  call s:hi("cssUnit",            s:sienna1, "NONE", "NONE")
  call s:hi("cssComment",         s:fg2,     "NONE", "italic")
  call s:hi("cssImportant",       s:rose0,   "NONE", "bold")
  call s:hi("cssPseudoClass",     s:amber0,  "NONE", "italic")
  call s:hi("cssPseudoClassId",   s:amber0,  "NONE", "italic")
  call s:hi("cssAtRule",          s:amber1,  "NONE", "bold")
  call s:hi("cssAtKeyword",       s:amber1,  "NONE", "bold")

  " ── JSON ────────────────────────────────────────────────────
  call s:hi("jsonKeyword",        s:teal0,   "NONE", "NONE")
  call s:hi("jsonString",         s:jade0,   "NONE", "NONE")
  call s:hi("jsonNumber",         s:olive0,  "NONE", "NONE")
  call s:hi("jsonBoolean",        s:olive1,  "NONE", "bold")
  call s:hi("jsonNull",           s:olive1,  "NONE", "bold")
  call s:hi("jsonBraces",         s:fg1,     "NONE", "NONE")
  call s:hi("jsonComment",        s:fg2,     "NONE", "italic")

  " ── INI / Config ────────────────────────────────────────────
  call s:hi("dosiniHeader",       s:amber1,  "NONE", "bold")
  call s:hi("dosiniLabel",        s:teal0,   "NONE", "NONE")
  call s:hi("dosiniValue",        s:jade0,   "NONE", "NONE")
  call s:hi("dosiniNumber",       s:olive0,  "NONE", "NONE")
  call s:hi("dosiniComment",      s:fg2,     "NONE", "italic")

  " ── Markdown ────────────────────────────────────────────────
  call s:hi("markdownH1",                s:amber1,  "NONE", "bold")
  call s:hi("markdownH2",                s:amber0,  "NONE", "bold")
  call s:hi("markdownH3",                s:jade0,   "NONE", "bold")
  call s:hi("markdownH4",                s:teal0,   "NONE", "bold")
  call s:hi("markdownH5",                s:fg0,     "NONE", "bold")
  call s:hi("markdownH6",                s:fg1,     "NONE", "bold")
  call s:hi("markdownRule",              s:fg3,     "NONE", "NONE")
  call s:hi("markdownBold",              s:amber0,  "NONE", "bold")
  call s:hi("markdownItalic",            s:amber0,  "NONE", "italic")
  call s:hi("markdownBoldItalic",        s:amber0,  "NONE", "bold,italic")
  call s:hi("markdownCode",              s:jade0,   s:bg1,  "NONE")
  call s:hi("markdownCodeBlock",         s:jade0,   s:bg1,  "NONE")
  call s:hi("markdownCodeDelimiter",     s:sienna1, "NONE", "NONE")
  call s:hi("markdownListMarker",        s:amber0,  "NONE", "bold")
  call s:hi("markdownOrderedListMarker", s:amber0,  "NONE", "bold")
  call s:hi("markdownLink",              s:teal1,   "NONE", "underline")
  call s:hi("markdownUrl",               s:jade0,   "NONE", "underline")
  call s:hi("markdownLinkText",          s:teal0,   "NONE", "NONE")
  call s:hi("markdownBlockquote",        s:fg2,     "NONE", "italic")

  " ── Pascal ──────────────────────────────────────────────────
  call s:hi("pascalKeyword",    s:amber1,  "NONE", "bold")
  call s:hi("pascalStatement",  s:amber1,  "NONE", "bold")
  call s:hi("pascalType",       s:jade1,   "NONE", "NONE")
  call s:hi("pascalString",     s:jade0,   "NONE", "NONE")
  call s:hi("pascalNumber",     s:olive0,  "NONE", "NONE")
  call s:hi("pascalFloat",      s:olive0,  "NONE", "NONE")
  call s:hi("pascalBoolean",    s:olive1,  "NONE", "bold")
  call s:hi("pascalOperator",   s:sienna0, "NONE", "NONE")
  call s:hi("pascalFunction",   s:teal1,   "NONE", "NONE")
  call s:hi("pascalPredefined", s:teal0,   "NONE", "NONE")
  call s:hi("pascalComment",    s:fg2,     "NONE", "italic")
  call s:hi("pascalTodo",       s:amber1,  s:bg2,  "bold,italic")
  call s:hi("pascalLabel",      s:sienna1, "NONE", "NONE")

  " ── Vimscript ───────────────────────────────────────────────
  " Core commands & statements
  call s:hi("vimCommand",        s:amber1,  "NONE", "bold")
  call s:hi("vimStatement",      s:amber1,  "NONE", "bold")
  call s:hi("vimLet",            s:amber1,  "NONE", "bold")
  call s:hi("vimSet",            s:amber1,  "NONE", "bold")
  call s:hi("vimSetEqual",       s:sienna0, "NONE", "NONE")
  call s:hi("vimNotFunc",        s:amber1,  "NONE", "bold")
  call s:hi("vimKeyword",        s:amber1,  "NONE", "bold")
  call s:hi("vimMap",            s:amber0,  "NONE", "bold")
  call s:hi("vimMapModKey",      s:sienna1, "NONE", "bold")
  call s:hi("vimMapLhs",         s:jade0,   "NONE", "NONE")
  call s:hi("vimMapRhs",         s:fg0,     "NONE", "NONE")
  call s:hi("vimUnmap",          s:rose0,   "NONE", "bold")
  call s:hi("vimAugroupKey",     s:amber1,  "NONE", "bold")
  call s:hi("vimAutoCmd",        s:amber0,  "NONE", "NONE")
  call s:hi("vimAutoEvent",      s:teal1,   "NONE", "NONE")
  call s:hi("vimAutoCmdSpace",   s:fg2,     "NONE", "NONE")
  call s:hi("vimAutoCmdSfxList", s:jade0,   "NONE", "NONE")

  " Functions
  call s:hi("vimFunction",       s:teal1,   "NONE", "bold")
  call s:hi("vimUserFunc",       s:teal1,   "NONE", "NONE")
  call s:hi("vimFuncName",       s:teal1,   "NONE", "bold")
  call s:hi("vimFuncVar",        s:sienna1, "NONE", "NONE")
  call s:hi("vimFuncSID",        s:sienna1, "NONE", "NONE")
  call s:hi("vimFuncBody",       s:fg0,     "NONE", "NONE")
  call s:hi("vimEndfunction",    s:amber1,  "NONE", "bold")
  call s:hi("vimFuncKey",        s:amber1,  "NONE", "bold")
  call s:hi("vimBuiltinFunc",    s:teal0,   "NONE", "NONE")
  call s:hi("vimFunc",           s:teal1,   "NONE", "NONE")
  call s:hi("vimCallParen",      s:fg1,     "NONE", "NONE")

  " Variables & scope
  call s:hi("vimVar",            s:sienna1, "NONE", "NONE")
  call s:hi("vimScriptFuncName", s:teal1,   "NONE", "bold")
  call s:hi("vimEnvVar",         s:sienna1, "NONE", "NONE")
  call s:hi("vimRegister",       s:sienna1, "NONE", "NONE")

  " Options
  call s:hi("vimOption",         s:jade1,   "NONE", "NONE")
  call s:hi("vimSetMod",         s:amber0,  "NONE", "NONE")

  " Highlight groups
  call s:hi("vimGroup",          s:teal0,   "NONE", "bold")
  call s:hi("vimHiGroup",        s:teal0,   "NONE", "NONE")
  call s:hi("vimHiAttrib",       s:amber0,  "NONE", "NONE")
  call s:hi("vimHiGuiFgBg",      s:olive0,  "NONE", "NONE")
  call s:hi("vimHiGui",          s:jade0,   "NONE", "NONE")
  call s:hi("vimHiGuiFont",      s:jade0,   "NONE", "NONE")
  call s:hi("vimHiTerm",         s:jade1,   "NONE", "NONE")
  call s:hi("vimHiTermcap",      s:jade1,   "NONE", "NONE")
  call s:hi("vimHiCtermFgBg",    s:olive0,  "NONE", "NONE")
  call s:hi("vimHiCterm",        s:olive0,  "NONE", "NONE")
  call s:hi("vimHiKeyList",      s:amber0,  "NONE", "NONE")
  call s:hi("vimHiBang",         s:rose0,   "NONE", "bold")
  call s:hi("vimHighlight",      s:amber1,  "NONE", "bold")

  " Strings & numbers
  call s:hi("vimString",         s:jade0,   "NONE", "NONE")
  call s:hi("vimStringCont",     s:jade0,   "NONE", "NONE")
  call s:hi("vimNumber",         s:olive0,  "NONE", "NONE")
  call s:hi("vimFloat",          s:olive0,  "NONE", "NONE")

  " Operators & syntax
  call s:hi("vimOper",           s:sienna0, "NONE", "NONE")
  call s:hi("vimOperParen",      s:sienna0, "NONE", "NONE")
  call s:hi("vimSep",            s:fg2,     "NONE", "NONE")
  call s:hi("vimParenSep",       s:fg2,     "NONE", "NONE")
  call s:hi("vimBracket",        s:fg1,     "NONE", "NONE")
  call s:hi("vimNotation",       s:sienna1, "NONE", "bold")
  call s:hi("vimContinue",       s:fg2,     "NONE", "NONE")
  call s:hi("vimIsCommand",      s:amber0,  "NONE", "NONE")

  " Comments
  call s:hi("vimComment",        s:fg2,     "NONE", "italic")
  call s:hi("vimCommentString",  s:fg2,     "NONE", "italic")
  call s:hi("vimCommentTitle",   s:amber0,  "NONE", "bold,italic")
  call s:hi("vimLineComment",    s:fg2,     "NONE", "italic")

  " Control flow
  call s:hi("vimCondHL",         s:amber1,  "NONE", "bold")
  call s:hi("vimElseif",         s:amber1,  "NONE", "bold")
  call s:hi("vimFor",            s:amber1,  "NONE", "bold")
  call s:hi("vimWhile",          s:amber1,  "NONE", "bold")
  call s:hi("vimReturn",         s:amber1,  "NONE", "bold")
  call s:hi("vimExecute",        s:amber0,  "NONE", "NONE")
  call s:hi("vimEcho",           s:amber0,  "NONE", "NONE")
  call s:hi("vimEchoHL",         s:amber0,  "NONE", "NONE")

  " Special
  call s:hi("vimTodo",           s:amber1,  s:bg2,  "bold,italic")
  call s:hi("vimError",          s:rose1,   "NONE", "bold")
  call s:hi("vimSubst",          s:teal0,   "NONE", "NONE")
  call s:hi("vimSubst1",         s:teal0,   "NONE", "NONE")
  call s:hi("vimSubstRange",     s:jade0,   "NONE", "NONE")
  call s:hi("vimSubstRep",       s:jade0,   "NONE", "NONE")
  call s:hi("vimCollection",     s:sienna1, "NONE", "NONE")
  call s:hi("vimPatSepR",        s:sienna1, "NONE", "NONE")
  call s:hi("vimPatSep",         s:sienna1, "NONE", "NONE")

  " ── Diagnostics (LSP / ALE / CoC) ───────────────────────────
  call s:hi("DiagnosticError",             s:rose1,   "NONE", "NONE")
  call s:hi("DiagnosticWarn",              s:gold0,   "NONE", "NONE")
  call s:hi("DiagnosticInfo",              s:teal1,   "NONE", "NONE")
  call s:hi("DiagnosticHint",              s:jade0,   "NONE", "NONE")
  call s:hi("DiagnosticUnderlineError",    s:rose1,   "NONE", "undercurl")
  call s:hi("DiagnosticUnderlineWarn",     s:gold0,   "NONE", "undercurl")
  call s:hi("DiagnosticUnderlineInfo",     s:teal1,   "NONE", "undercurl")
  call s:hi("DiagnosticUnderlineHint",     s:jade0,   "NONE", "undercurl")
  call s:hi("DiagnosticVirtualTextError",  s:rose1,   "NONE", "italic")
  call s:hi("DiagnosticVirtualTextWarn",   s:gold0,   "NONE", "italic")
  call s:hi("DiagnosticVirtualTextInfo",   s:teal1,   "NONE", "italic")
  call s:hi("DiagnosticVirtualTextHint",   s:jade0,   "NONE", "italic")

  " ── Git Signs ───────────────────────────────────────────────
  call s:hi("GitGutterAdd",          s:jade0,   s:bg0, "NONE")
  call s:hi("GitGutterChange",       s:amber0,  s:bg0, "NONE")
  call s:hi("GitGutterDelete",       s:rose0,   s:bg0, "NONE")
  call s:hi("GitGutterChangeDelete", s:sienna1, s:bg0, "NONE")

  " ── Telescope ───────────────────────────────────────────────
  call s:hi("TelescopeNormal",        s:fg0,    s:bg1,  "NONE")
  call s:hi("TelescopeBorder",        s:jade1,  s:bg1,  "NONE")
  call s:hi("TelescopePromptBorder",  s:amber1, s:bg1,  "NONE")
  call s:hi("TelescopeResultsBorder", s:jade1,  s:bg1,  "NONE")
  call s:hi("TelescopePreviewBorder", s:teal0,  s:bg1,  "NONE")
  call s:hi("TelescopeSelection",     s:fg0,    s:bg3,  "bold")
  call s:hi("TelescopeMatching",      s:amber1, "NONE", "bold")
  call s:hi("TelescopePromptPrefix",  s:amber0, "NONE", "bold")

  " ── NERDTree / Netrw ────────────────────────────────────────
  call s:hi("NERDTreeDir",      s:teal0,  "NONE", "NONE")
  call s:hi("NERDTreeDirSlash", s:fg3,    "NONE", "NONE")
  call s:hi("NERDTreeFile",     s:fg1,    "NONE", "NONE")
  call s:hi("NERDTreeExecFile", s:jade0,  "NONE", "bold")
  call s:hi("NERDTreeOpenable", s:amber0, "NONE", "NONE")
  call s:hi("NERDTreeClosable", s:amber0, "NONE", "NONE")
  call s:hi("netrwDir",         s:teal0,  "NONE", "bold")
  call s:hi("netrwExe",         s:jade0,  "NONE", "bold")
  call s:hi("netrwSymLink",     s:teal1,  "NONE", "NONE")
  call s:hi("netrwLink",        s:jade0,  "NONE", "underline")

  " ── C ───────────────────────────────────────────────────────
  call s:hi("cStatement",        s:amber1,  "NONE", "bold")
  call s:hi("cLabel",            s:amber0,  "NONE", "bold")
  call s:hi("cConditional",      s:amber1,  "NONE", "bold")
  call s:hi("cRepeat",           s:amber1,  "NONE", "bold")
  call s:hi("cTodo",             s:amber1,  s:bg2,  "bold,italic")
  call s:hi("cSpecial",          s:sienna1, "NONE", "NONE")
  call s:hi("cFormat",           s:sienna1, "NONE", "NONE")
  call s:hi("cString",           s:jade0,   "NONE", "NONE")
  call s:hi("cCppString",        s:jade0,   "NONE", "NONE")
  call s:hi("cCharacter",        s:jade0,   "NONE", "NONE")
  call s:hi("cSpecialCharacter", s:sienna1, "NONE", "NONE")
  call s:hi("cNumber",           s:olive0,  "NONE", "NONE")
  call s:hi("cFloat",            s:olive0,  "NONE", "NONE")
  call s:hi("cOctal",            s:olive0,  "NONE", "NONE")
  call s:hi("cOctalZero",        s:olive1,  "NONE", "bold")
  call s:hi("cType",             s:jade1,   "NONE", "NONE")
  call s:hi("cStorageClass",     s:jade1,   "NONE", "bold")
  call s:hi("cStructure",        s:jade1,   "NONE", "NONE")
  call s:hi("cTypedef",          s:jade1,   "NONE", "italic")
  call s:hi("cOperator",         s:sienna0, "NONE", "NONE")
  call s:hi("cInclude",          s:teal0,   "NONE", "NONE")
  call s:hi("cPreCondit",        s:amber0,  "NONE", "NONE")
  call s:hi("cDefine",           s:amber0,  "NONE", "bold")
  call s:hi("cPreProc",          s:sienna1, "NONE", "NONE")
  call s:hi("cComment",          s:fg2,     "NONE", "italic")
  call s:hi("cCommentL",         s:fg2,     "NONE", "italic")
  call s:hi("cPointer",          s:sienna1, "NONE", "NONE")
  call s:hi("cErrInParen",       s:rose1,   "NONE", "bold")
  call s:hi("cErrInBracket",     s:rose1,   "NONE", "bold")

  " ── C++ ─────────────────────────────────────────────────────
  call s:hi("cppStatement",      s:amber1,  "NONE", "bold")
  call s:hi("cppAccess",         s:amber1,  "NONE", "bold")
  call s:hi("cppType",           s:jade1,   "NONE", "NONE")
  call s:hi("cppExceptions",     s:rose0,   "NONE", "bold")
  call s:hi("cppOperator",       s:sienna0, "NONE", "NONE")
  call s:hi("cppCast",           s:teal0,   "NONE", "bold")
  call s:hi("cppStorageClass",   s:jade1,   "NONE", "bold")
  call s:hi("cppStructure",      s:jade1,   "NONE", "NONE")
  call s:hi("cppBoolean",        s:olive1,  "NONE", "bold")
  call s:hi("cppNumber",         s:olive0,  "NONE", "NONE")
  call s:hi("cppString",         s:jade0,   "NONE", "NONE")
  call s:hi("cppRawString",      s:jade0,   "NONE", "NONE")
  call s:hi("cppNamespace",      s:teal1,   "NONE", "bold")
  call s:hi("cppTemplate",       s:teal0,   "NONE", "NONE")
  call s:hi("cppTemplateArg",    s:jade1,   "NONE", "NONE")
  call s:hi("cppModifier",       s:amber0,  "NONE", "NONE")
  call s:hi("cppConstant",       s:olive1,  "NONE", "bold")
  call s:hi("cppSTLnamespace",   s:teal1,   "NONE", "italic")
  call s:hi("cppSTLtype",        s:jade1,   "NONE", "NONE")
  call s:hi("cppSTLfunction",    s:teal1,   "NONE", "NONE")
  call s:hi("cppSTLconstant",    s:olive1,  "NONE", "bold")
  call s:hi("cppSTLexception",   s:rose0,   "NONE", "NONE")
  call s:hi("cppSTLiterator",    s:teal0,   "NONE", "italic")
  call s:hi("cppNullPtr",        s:olive1,  "NONE", "bold")
  call s:hi("cppLambda",         s:sienna1, "NONE", "NONE")

  " ── Java ────────────────────────────────────────────────────
  call s:hi("javaStatement",       s:amber1,  "NONE", "bold")
  call s:hi("javaExternal",        s:amber1,  "NONE", "bold")
  call s:hi("javaAnnotation",      s:sienna1, "NONE", "italic")
  call s:hi("javaClassDecl",       s:amber1,  "NONE", "bold")
  call s:hi("javaScopeDecl",       s:amber1,  "NONE", "bold")
  call s:hi("javaStorageClass",    s:jade1,   "NONE", "bold")
  call s:hi("javaType",            s:jade1,   "NONE", "NONE")
  call s:hi("javaTypedef",         s:jade1,   "NONE", "italic")
  call s:hi("javaOperator",        s:sienna0, "NONE", "NONE")
  call s:hi("javaBoolean",         s:olive1,  "NONE", "bold")
  call s:hi("javaNumber",          s:olive0,  "NONE", "NONE")
  call s:hi("javaFloat",           s:olive0,  "NONE", "NONE")
  call s:hi("javaString",          s:jade0,   "NONE", "NONE")
  call s:hi("javaCharacter",       s:jade0,   "NONE", "NONE")
  call s:hi("javaSpecialChar",     s:sienna1, "NONE", "NONE")
  call s:hi("javaComment",         s:fg2,     "NONE", "italic")
  call s:hi("javaDocComment",      s:fg2,     "NONE", "italic")
  call s:hi("javaDocTags",         s:amber0,  "NONE", "bold,italic")
  call s:hi("javaDocParam",        s:teal0,   "NONE", "italic")
  call s:hi("javaLineComment",     s:fg2,     "NONE", "italic")
  call s:hi("javaException",       s:rose0,   "NONE", "bold")
  call s:hi("javaMethodDecl",      s:teal1,   "NONE", "bold")
  call s:hi("javaFuncDef",         s:teal1,   "NONE", "NONE")
  call s:hi("javaLambdaDef",       s:sienna0, "NONE", "bold")
  call s:hi("javaConstant",        s:olive1,  "NONE", "bold")
  call s:hi("javaNull",            s:olive1,  "NONE", "bold")
  call s:hi("javaAssert",          s:rose0,   "NONE", "bold")
  call s:hi("javaLabel",           s:amber0,  "NONE", "bold")
  call s:hi("javaTodo",            s:amber1,  s:bg2,  "bold,italic")
  call s:hi("javaBraces",          s:fg1,     "NONE", "NONE")

  " ── Rust ────────────────────────────────────────────────────
  call s:hi("rustKeyword",         s:amber1,  "NONE", "bold")
  call s:hi("rustConditional",     s:amber1,  "NONE", "bold")
  call s:hi("rustRepeat",          s:amber1,  "NONE", "bold")
  call s:hi("rustTypedef",         s:jade1,   "NONE", "italic")
  call s:hi("rustStructure",       s:jade1,   "NONE", "NONE")
  call s:hi("rustModPath",         s:teal0,   "NONE", "NONE")
  call s:hi("rustModPathSep",      s:fg2,     "NONE", "NONE")
  call s:hi("rustSelf",            s:sienna1, "NONE", "italic")
  call s:hi("rustSuper",           s:sienna1, "NONE", "italic")
  call s:hi("rustLifetime",        s:gold0,   "NONE", "italic")
  call s:hi("rustLabel",           s:gold0,   "NONE", "italic")
  call s:hi("rustMacro",           s:teal1,   "NONE", "bold")
  call s:hi("rustMacroVariable",   s:sienna1, "NONE", "NONE")
  call s:hi("rustPanic",           s:rose1,   "NONE", "bold")
  call s:hi("rustTrait",           s:teal0,   "NONE", "bold")
  call s:hi("rustDeriveTrait",     s:teal0,   "NONE", "italic")
  call s:hi("rustEnum",            s:jade1,   "NONE", "bold")
  call s:hi("rustEnumVariant",     s:jade0,   "NONE", "NONE")
  call s:hi("rustString",          s:jade0,   "NONE", "NONE")
  call s:hi("rustCharacter",       s:jade0,   "NONE", "NONE")
  call s:hi("rustNumber",          s:olive0,  "NONE", "NONE")
  call s:hi("rustFloat",           s:olive0,  "NONE", "NONE")
  call s:hi("rustBoolean",         s:olive1,  "NONE", "bold")
  call s:hi("rustOperator",        s:sienna0, "NONE", "NONE")
  call s:hi("rustArrowCharacter",  s:sienna0, "NONE", "bold")
  call s:hi("rustFatArrow",        s:sienna0, "NONE", "bold")
  call s:hi("rustQuestionMark",    s:rose0,   "NONE", "bold")
  call s:hi("rustComment",         s:fg2,     "NONE", "italic")
  call s:hi("rustCommentLine",     s:fg2,     "NONE", "italic")
  call s:hi("rustCommentLineDoc",  s:fg2,     "NONE", "italic")
  call s:hi("rustCommentBlock",    s:fg2,     "NONE", "italic")
  call s:hi("rustAttribute",       s:sienna1, "NONE", "italic")
  call s:hi("rustDerive",          s:sienna1, "NONE", "italic")
  call s:hi("rustStorage",         s:jade1,   "NONE", "bold")
  call s:hi("rustType",            s:jade1,   "NONE", "NONE")
  call s:hi("rustSigil",           s:sienna1, "NONE", "bold")
  call s:hi("rustEscape",          s:sienna1, "NONE", "NONE")
  call s:hi("rustTodo",            s:amber1,  s:bg2,  "bold,italic")
  call s:hi("rustFuncName",        s:teal1,   "NONE", "NONE")
  call s:hi("rustFuncCall",        s:teal1,   "NONE", "NONE")
  call s:hi("rustExternCrate",     s:amber1,  "NONE", "bold")
  call s:hi("rustUnsafeKeyword",   s:rose0,   "NONE", "bold,italic")
  call s:hi("rustImplKeyword",     s:amber1,  "NONE", "bold")
  call s:hi("rustWhere",           s:amber0,  "NONE", "NONE")
  call s:hi("rustClosure",         s:sienna0, "NONE", "NONE")
  call s:hi("rustPubScope",        s:amber0,  "NONE", "NONE")

  " ── Go ──────────────────────────────────────────────────────
  call s:hi("goStatement",         s:amber1,  "NONE", "bold")
  call s:hi("goConditional",       s:amber1,  "NONE", "bold")
  call s:hi("goRepeat",            s:amber1,  "NONE", "bold")
  call s:hi("goLabel",             s:amber0,  "NONE", "bold")
  call s:hi("goKeyword",           s:amber1,  "NONE", "bold")
  call s:hi("goPackage",           s:amber1,  "NONE", "bold")
  call s:hi("goImport",            s:teal0,   "NONE", "NONE")
  call s:hi("goVarKeyword",         s:amber0,  "NONE", "bold")
  call s:hi("goConst",             s:amber0,  "NONE", "bold")
  call s:hi("goType",              s:jade1,   "NONE", "NONE")
  call s:hi("goSignedInts",        s:jade1,   "NONE", "NONE")
  call s:hi("goUnsignedInts",      s:jade1,   "NONE", "NONE")
  call s:hi("goFloats",            s:jade1,   "NONE", "NONE")
  call s:hi("goTypeName",          s:jade1,   "NONE", "NONE")
  call s:hi("goTypeDecl",          s:jade1,   "NONE", "bold")
  call s:hi("goReceiverType",      s:jade1,   "NONE", "italic")
  call s:hi("goFunctionCall",      s:teal1,   "NONE", "NONE")
  call s:hi("goMethodCall",        s:teal1,   "NONE", "NONE")
  call s:hi("goBuiltins",          s:teal0,   "NONE", "NONE")
  call s:hi("goString",            s:jade0,   "NONE", "NONE")
  call s:hi("goRawString",         s:jade0,   "NONE", "NONE")
  call s:hi("goCharacter",         s:jade0,   "NONE", "NONE")
  call s:hi("goNumber",            s:olive0,  "NONE", "NONE")
  call s:hi("goFloat",             s:olive0,  "NONE", "NONE")
  call s:hi("goBoolean",           s:olive1,  "NONE", "bold")
  call s:hi("goOperator",          s:sienna0, "NONE", "NONE")
  call s:hi("goPointerOperator",   s:sienna1, "NONE", "bold")
  call s:hi("goInterface",         s:teal0,   "NONE", "bold")
  call s:hi("goStruct",            s:jade1,   "NONE", "bold")
  call s:hi("goDeclaration",       s:amber1,  "NONE", "bold")
  call s:hi("goDeclType",          s:jade1,   "NONE", "NONE")
  call s:hi("goComment",           s:fg2,     "NONE", "italic")
  call s:hi("goTodo",              s:amber1,  s:bg2,  "bold,italic")
  call s:hi("goFormatSpecifier",   s:sienna1, "NONE", "NONE")
  call s:hi("goNil",               s:olive1,  "NONE", "bold")
  call s:hi("goConstants",         s:olive1,  "NONE", "bold")
  call s:hi("goErrorType",         s:rose0,   "NONE", "NONE")
  call s:hi("goSpaceError",        s:rose1,   s:bg2,  "bold")

  " ── YAML ────────────────────────────────────────────────────
  call s:hi("yamlKey",             s:amber1,  "NONE", "bold")
  call s:hi("yamlAnchor",          s:sienna1, "NONE", "bold")
  call s:hi("yamlAlias",           s:sienna0, "NONE", "italic")
  call s:hi("yamlDocumentStart",   s:fg2,     "NONE", "bold")
  call s:hi("yamlDocumentEnd",     s:fg2,     "NONE", "bold")
  call s:hi("yamlDirective",       s:amber0,  "NONE", "NONE")
  call s:hi("yamlNodeTag",         s:teal0,   "NONE", "italic")
  call s:hi("yamlString",          s:jade0,   "NONE", "NONE")
  call s:hi("yamlPlainScalar",     s:fg0,     "NONE", "NONE")
  call s:hi("yamlInteger",         s:olive0,  "NONE", "NONE")
  call s:hi("yamlFloat",           s:olive0,  "NONE", "NONE")
  call s:hi("yamlBool",            s:olive1,  "NONE", "bold")
  call s:hi("yamlNull",            s:olive1,  "NONE", "bold")
  call s:hi("yamlComment",         s:fg2,     "NONE", "italic")
  call s:hi("yamlBlockMappingKey", s:amber1,  "NONE", "bold")
  call s:hi("yamlFlowMappingKey",  s:amber0,  "NONE", "NONE")
  call s:hi("yamlFlowString",      s:jade0,   "NONE", "NONE")
  call s:hi("yamlFlowStringDelim", s:jade1,   "NONE", "NONE")
  call s:hi("yamlBlockScalar",     s:jade0,   "NONE", "NONE")
  call s:hi("yamlBlockScalarHeader", s:sienna1, "NONE", "NONE")
  call s:hi("yamlKeyValueDelimiter", s:sienna0, "NONE", "NONE")
  call s:hi("yamlConstant",        s:olive1,  "NONE", "bold")
  call s:hi("yamlBlockCollectionItemStart", s:sienna0, "NONE", "NONE")

  " ── LISP ────────────────────────────────────────────────────
  call s:hi("lispKey",             s:amber1,  "NONE", "bold")
  call s:hi("lispAtom",            s:jade0,   "NONE", "NONE")
  call s:hi("lispAtomList",        s:jade0,   "NONE", "NONE")
  call s:hi("lispAtomMark",        s:sienna1, "NONE", "bold")
  call s:hi("lispList",            s:fg0,     "NONE", "NONE")
  call s:hi("lispFunc",            s:teal1,   "NONE", "bold")
  call s:hi("lispVar",             s:sienna1, "NONE", "NONE")
  call s:hi("lispString",          s:jade0,   "NONE", "NONE")
  call s:hi("lispNumber",          s:olive0,  "NONE", "NONE")
  call s:hi("lispFloat",           s:olive0,  "NONE", "NONE")
  call s:hi("lispSpecial",         s:sienna1, "NONE", "NONE")
  call s:hi("lispSpecialForm",     s:amber1,  "NONE", "bold")
  call s:hi("lispBarSymbol",       s:sienna0, "NONE", "NONE")
  call s:hi("lispComment",         s:fg2,     "NONE", "italic")
  call s:hi("lispParen",           s:fg2,     "NONE", "NONE")
  call s:hi("lispSexp",            s:fg1,     "NONE", "NONE")
  call s:hi("lispTodo",            s:amber1,  s:bg2,  "bold,italic")
  call s:hi("lispDecl",            s:amber0,  "NONE", "bold")
  call s:hi("lispSymbol",          s:teal0,   "NONE", "NONE")
  call s:hi("lispNil",             s:olive1,  "NONE", "bold")
  call s:hi("lispBooleanSymbol",   s:olive1,  "NONE", "bold")

  " ── Scheme ──────────────────────────────────────────────────
  call s:hi("schemeKeyword",       s:amber1,  "NONE", "bold")
  call s:hi("schemeSyntax",        s:amber1,  "NONE", "bold")
  call s:hi("schemeFunc",          s:teal1,   "NONE", "bold")
  call s:hi("schemeDefine",        s:amber0,  "NONE", "bold")
  call s:hi("schemeLet",           s:amber0,  "NONE", "bold")
  call s:hi("schemeIf",            s:amber1,  "NONE", "bold")
  call s:hi("schemeCond",          s:amber1,  "NONE", "bold")
  call s:hi("schemeAnd",           s:amber1,  "NONE", "bold")
  call s:hi("schemeOr",            s:amber1,  "NONE", "bold")
  call s:hi("schemeIdentifier",    s:var0,     "NONE", "NONE")
  call s:hi("schemeVariable",      s:sienna1, "NONE", "NONE")
  call s:hi("schemeString",        s:jade0,   "NONE", "NONE")
  call s:hi("schemeCharacter",     s:jade0,   "NONE", "NONE")
  call s:hi("schemeNumber",        s:olive0,  "NONE", "NONE")
  call s:hi("schemeFloat",         s:olive0,  "NONE", "NONE")
  call s:hi("schemeBoolean",       s:olive1,  "NONE", "bold")
  call s:hi("schemeSymbol",        s:teal0,   "NONE", "NONE")
  call s:hi("schemeParen",         s:fg2,     "NONE", "NONE")
  call s:hi("schemeVector",        s:sienna1, "NONE", "NONE")
  call s:hi("schemePair",          s:fg1,     "NONE", "NONE")
  call s:hi("schemeComment",       s:fg2,     "NONE", "italic")
  call s:hi("schemeMultilineComment", s:fg2,  "NONE", "italic")
  call s:hi("schemeTodo",          s:amber1,  s:bg2,  "bold,italic")
  call s:hi("schemeError",         s:rose1,   "NONE", "bold")
  call s:hi("schemeQuote",         s:sienna0, "NONE", "NONE")
  call s:hi("schemeQuoted",        s:sienna1, "NONE", "NONE")
  call s:hi("schemeLambda",        s:teal0,   "NONE", "bold")
  call s:hi("schemeSpecialSyntax", s:amber0,  "NONE", "italic")

  " ── Popular Plugins ─────────────────────────────────────────
  " vim-fugitive
  call s:hi("fugitiveHash",          s:teal1,  "NONE", "NONE")
  call s:hi("fugitiveStagedSection", s:jade0,  "NONE", "bold")
  call s:hi("fugitiveUnstagedSection",s:gold0, "NONE", "bold")
  call s:hi("fugitiveUntrackedSection",s:fg2,  "NONE", "italic")
  call s:hi("fugitiveHeader",        s:amber1, "NONE", "bold")
  call s:hi("fugitiveSymbolicRef",   s:teal0,  "NONE", "bold")
  call s:hi("fugitiveCount",         s:olive0, "NONE", "NONE")

  " CoC
  call s:hi("CocErrorSign",          s:rose1,  "NONE", "bold")
  call s:hi("CocWarningSign",        s:gold0,  "NONE", "bold")
  call s:hi("CocInfoSign",           s:teal1,  "NONE", "NONE")
  call s:hi("CocHintSign",           s:jade0,  "NONE", "NONE")
  call s:hi("CocErrorHighlight",     s:rose1,  "NONE", "undercurl")
  call s:hi("CocWarningHighlight",   s:gold0,  "NONE", "undercurl")
  call s:hi("CocInfoHighlight",      s:teal1,  "NONE", "undercurl")
  call s:hi("CocHintHighlight",      s:jade0,  "NONE", "undercurl")
  call s:hi("CocSelectedText",       s:amber1, "NONE", "bold")
  call s:hi("CocMenuSel",            s:fg0,    s:bg4,  "bold")
  call s:hi("CocFloating",           s:fg0,    s:bg2,  "NONE")

  " fzf
  call s:hi("fzf1",                  s:amber1, s:bg3,  "bold")
  call s:hi("fzf2",                  s:teal1,  s:bg3,  "NONE")
  call s:hi("fzf3",                  s:fg2,    s:bg3,  "NONE")

  " vim-indent-guides
  call s:hi("IndentGuidesOdd",       "NONE",   s:bg1,  "NONE")
  call s:hi("IndentGuidesEven",      "NONE",   s:bg2,  "NONE")

  " vim-illuminate
  call s:hi("illuminatedWord",       "NONE",   s:bg3,  "NONE")
  call s:hi("illuminatedCurWord",    "NONE",   s:bg4,  "bold")


  " ── TypeScript ──────────────────────────────────────────────
  " (Extends JS — adds type-specific groups)
  call s:hi("typescriptKeyword",          s:amber1,  "NONE", "bold")
  call s:hi("typescriptOperator",         s:sienna0, "NONE", "NONE")
  call s:hi("typescriptIdentifier",       s:var0,    "NONE", "NONE")
  call s:hi("typescriptVariable",         s:var0,    "NONE", "NONE")
  call s:hi("typescriptVariableDeclaration", s:var0, "NONE", "NONE")
  call s:hi("typescriptType",             s:jade1,   "NONE", "NONE")
  call s:hi("typescriptTypeBracket",      s:jade1,   "NONE", "NONE")
  call s:hi("typescriptTypeAnnotation",   s:jade1,   "NONE", "NONE")
  call s:hi("typescriptTypeReference",    s:jade1,   "NONE", "NONE")
  call s:hi("typescriptTypeCast",         s:jade1,   "NONE", "italic")
  call s:hi("typescriptTypeParameter",    s:jade1,   "NONE", "italic")
  call s:hi("typescriptInterfaceName",    s:teal0,   "NONE", "bold")
  call s:hi("typescriptInterface",        s:amber1,  "NONE", "bold")
  call s:hi("typescriptEnum",             s:amber1,  "NONE", "bold")
  call s:hi("typescriptEnumKeyword",      s:amber1,  "NONE", "bold")
  call s:hi("typescriptClassName",        s:jade1,   "NONE", "bold")
  call s:hi("typescriptClassKeyword",     s:amber1,  "NONE", "bold")
  call s:hi("typescriptClassHeritage",    s:jade1,   "NONE", "italic")
  call s:hi("typescriptExport",           s:amber1,  "NONE", "bold")
  call s:hi("typescriptImport",           s:amber1,  "NONE", "bold")
  call s:hi("typescriptFuncName",         s:teal1,   "NONE", "NONE")
  call s:hi("typescriptFuncType",         s:jade1,   "NONE", "NONE")
  call s:hi("typescriptArrowFunc",        s:sienna0, "NONE", "bold")
  call s:hi("typescriptArrowFuncArg",     s:var0,    "NONE", "italic")
  call s:hi("typescriptMember",           s:teal1,   "NONE", "NONE")
  call s:hi("typescriptAccessibilityModifier", s:amber0, "NONE", "bold")
  call s:hi("typescriptReadonlyModifier", s:amber0,  "NONE", "bold")
  call s:hi("typescriptDecorator",        s:sienna1, "NONE", "italic")
  call s:hi("typescriptString",           s:jade0,   "NONE", "NONE")
  call s:hi("typescriptTemplate",         s:jade0,   "NONE", "NONE")
  call s:hi("typescriptStringS",          s:jade0,   "NONE", "NONE")
  call s:hi("typescriptNumber",           s:olive0,  "NONE", "NONE")
  call s:hi("typescriptBoolean",          s:olive1,  "NONE", "bold")
  call s:hi("typescriptNull",             s:olive1,  "NONE", "bold")
  call s:hi("typescriptUndefined",        s:olive1,  "NONE", "bold")
  call s:hi("typescriptComment",          s:fg2,     "NONE", "italic")
  call s:hi("typescriptLineComment",      s:fg2,     "NONE", "italic")
  call s:hi("typescriptException",        s:rose0,   "NONE", "bold")
  call s:hi("typescriptTodo",             s:amber1,  s:bg2,  "bold,italic")

  " ── Bash / Shell ────────────────────────────────────────────
  call s:hi("shStatement",        s:amber1,  "NONE", "bold")
  call s:hi("shConditional",      s:amber1,  "NONE", "bold")
  call s:hi("shRepeat",           s:amber1,  "NONE", "bold")
  call s:hi("shLoop",             s:amber1,  "NONE", "bold")
  call s:hi("shFunction",         s:teal1,   "NONE", "bold")
  call s:hi("shFunctionKey",      s:teal1,   "NONE", "bold")
  call s:hi("shFunctionOne",      s:teal1,   "NONE", "NONE")
  call s:hi("shVariable",         s:var0,    "NONE", "NONE")
  call s:hi("shSetList",          s:var0,    "NONE", "NONE")
  call s:hi("shDerefSimple",      s:var0,    "NONE", "NONE")
  call s:hi("shDerefVar",         s:var0,    "NONE", "bold")
  call s:hi("shDerefSpecial",     s:sienna1, "NONE", "bold")
  call s:hi("shDerefOff",         s:sienna1, "NONE", "NONE")
  call s:hi("shOperator",         s:sienna0, "NONE", "NONE")
  call s:hi("shParen",            s:fg1,     "NONE", "NONE")
  call s:hi("shArithmetic",       s:sienna0, "NONE", "NONE")
  call s:hi("shString",           s:jade0,   "NONE", "NONE")
  call s:hi("shSingleQuote",      s:jade0,   "NONE", "NONE")
  call s:hi("shDoubleQuote",      s:jade0,   "NONE", "NONE")
  call s:hi("shStringSpecial",    s:sienna1, "NONE", "NONE")
  call s:hi("shNumber",           s:olive0,  "NONE", "NONE")
  call s:hi("shComment",          s:fg2,     "NONE", "italic")
  call s:hi("shTodo",             s:amber1,  s:bg2,  "bold,italic")
  call s:hi("shExpr",             s:fg0,     "NONE", "NONE")
  call s:hi("shTestOpr",          s:sienna0, "NONE", "NONE")
  call s:hi("shTestPattern",      s:jade0,   "NONE", "NONE")
  call s:hi("shCmdSubRegion",     s:teal0,   "NONE", "NONE")
  call s:hi("shCommandSub",       s:teal0,   "NONE", "NONE")
  call s:hi("shHereDoc",          s:jade0,   "NONE", "NONE")
  call s:hi("shHereDocDelim",     s:amber0,  "NONE", "bold")
  call s:hi("shPipe",             s:sienna0, "NONE", "bold")
  call s:hi("shRange",            s:sienna0, "NONE", "NONE")
  call s:hi("shOption",           s:teal0,   "NONE", "NONE")
  call s:hi("shSpecial",          s:sienna1, "NONE", "NONE")
  call s:hi("shAlias",            s:teal1,   "NONE", "NONE")
  call s:hi("shCaseIn",           s:amber1,  "NONE", "bold")
  call s:hi("shCaseCommandSub",   s:teal0,   "NONE", "NONE")
  call s:hi("shCaseLabel",        s:jade0,   "NONE", "NONE")
  call s:hi("shCaseSingleQuote",  s:jade0,   "NONE", "NONE")
  call s:hi("shCaseDoubleQuote",  s:jade0,   "NONE", "NONE")
  call s:hi("bashStatement",      s:amber1,  "NONE", "bold")
  call s:hi("bashAdminStatement", s:rose0,   "NONE", "bold")

  " ── PowerShell ──────────────────────────────────────────────
  call s:hi("ps1Keyword",         s:amber1,  "NONE", "bold")
  call s:hi("ps1Statement",       s:amber1,  "NONE", "bold")
  call s:hi("ps1Conditional",     s:amber1,  "NONE", "bold")
  call s:hi("ps1Repeat",          s:amber1,  "NONE", "bold")
  call s:hi("ps1Variable",        s:var0,    "NONE", "NONE")
  call s:hi("ps1Boolean",         s:olive1,  "NONE", "bold")
  call s:hi("ps1Number",          s:olive0,  "NONE", "NONE")
  call s:hi("ps1String",          s:jade0,   "NONE", "NONE")
  call s:hi("ps1StringDelimiter", s:jade1,   "NONE", "NONE")
  call s:hi("ps1HereString",      s:jade0,   "NONE", "NONE")
  call s:hi("ps1Type",            s:jade1,   "NONE", "NONE")
  call s:hi("ps1TypeBracket",     s:jade1,   "NONE", "NONE")
  call s:hi("ps1Function",        s:teal1,   "NONE", "bold")
  call s:hi("ps1FunctionInvocation", s:teal1,"NONE", "NONE")
  call s:hi("ps1CommandName",     s:teal0,   "NONE", "NONE")
  call s:hi("ps1Operator",        s:sienna0, "NONE", "NONE")
  call s:hi("ps1Comment",         s:fg2,     "NONE", "italic")
  call s:hi("ps1CommentDoc",      s:fg2,     "NONE", "italic")
  call s:hi("ps1Escape",          s:sienna1, "NONE", "NONE")
  call s:hi("ps1Parameter",       s:sienna1, "NONE", "italic")
  call s:hi("ps1Attribute",       s:sienna1, "NONE", "italic")
  call s:hi("ps1Exception",       s:rose0,   "NONE", "bold")
  call s:hi("ps1Todo",            s:amber1,  s:bg2,  "bold,italic")

  " ── SCSS ────────────────────────────────────────────────────
  call s:hi("scssVariable",       s:var0,    "NONE", "NONE")
  call s:hi("scssVariableValue",  s:fg0,     "NONE", "NONE")
  call s:hi("scssVariableAssignment", s:sienna0, "NONE", "NONE")
  call s:hi("scssMixinName",      s:teal1,   "NONE", "bold")
  call s:hi("scssMixin",          s:amber1,  "NONE", "bold")
  call s:hi("scssInclude",        s:amber1,  "NONE", "bold")
  call s:hi("scssExtend",         s:amber0,  "NONE", "bold")
  call s:hi("scssReturn",         s:amber1,  "NONE", "bold")
  call s:hi("scssIfWord",         s:amber1,  "NONE", "bold")
  call s:hi("scssElse",           s:amber1,  "NONE", "bold")
  call s:hi("scssEachWord",       s:amber1,  "NONE", "bold")
  call s:hi("scssForWord",        s:amber1,  "NONE", "bold")
  call s:hi("scssWhileWord",      s:amber1,  "NONE", "bold")
  call s:hi("scssFunctionName",   s:teal1,   "NONE", "NONE")
  call s:hi("scssFunction",       s:amber1,  "NONE", "bold")
  call s:hi("scssSelector",       s:amber0,  "NONE", "NONE")
  call s:hi("scssSelectorName",   s:amber0,  "NONE", "NONE")
  call s:hi("scssAttribute",      s:jade0,   "NONE", "NONE")
  call s:hi("scssProperty",       s:jade0,   "NONE", "NONE")
  call s:hi("scssString",         s:jade0,   "NONE", "NONE")
  call s:hi("scssNumber",         s:olive0,  "NONE", "NONE")
  call s:hi("scssBoolean",        s:olive1,  "NONE", "bold")
  call s:hi("scssNull",           s:olive1,  "NONE", "bold")
  call s:hi("scssUnit",           s:sienna1, "NONE", "NONE")
  call s:hi("scssComment",        s:fg2,     "NONE", "italic")
  call s:hi("scssLineComment",    s:fg2,     "NONE", "italic")
  call s:hi("scssImportant",      s:rose0,   "NONE", "bold")
  call s:hi("scssInterpolation",  s:sienna1, "NONE", "bold")
  call s:hi("scssMap",            s:fg1,     "NONE", "NONE")
  call s:hi("scssMapKey",         s:teal0,   "NONE", "NONE")
  call s:hi("scssOperator",       s:sienna0, "NONE", "NONE")
  call s:hi("scssPlaceholder",    s:sienna1, "NONE", "italic")
  call s:hi("scssTodo",           s:amber1,  s:bg2,  "bold,italic")

  " ── SASS (indented syntax) ───────────────────────────────────
  hi link sassVariable          scssVariable
  hi link sassVariableValue     scssVariableValue
  hi link sassMixin             scssMixin
  hi link sassMixinName         scssMixinName
  hi link sassInclude           scssInclude
  hi link sassExtend            scssExtend
  hi link sassFunction          scssFunction
  hi link sassFunctionName      scssFunctionName
  hi link sassProperty          scssProperty
  hi link sassString            scssString
  hi link sassNumber            scssNumber
  hi link sassBoolean           scssBoolean
  hi link sassNull              scssNull
  hi link sassUnit              scssUnit
  hi link sassComment           scssComment
  hi link sassInterpolation     scssInterpolation
  hi link sassOperator          scssOperator

  " ── Racket (extends Scheme) ──────────────────────────────────
  call s:hi("racketKeyword",      s:amber1,  "NONE", "bold")
  call s:hi("racketSyntax",       s:amber1,  "NONE", "bold")
  call s:hi("racketFunc",         s:teal1,   "NONE", "bold")
  call s:hi("racketDefine",       s:amber0,  "NONE", "bold")
  call s:hi("racketLet",          s:amber0,  "NONE", "bold")
  call s:hi("racketLambda",       s:teal0,   "NONE", "bold")
  call s:hi("racketIdentifier",   s:var0,    "NONE", "NONE")
  call s:hi("racketString",       s:jade0,   "NONE", "NONE")
  call s:hi("racketCharacter",    s:jade0,   "NONE", "NONE")
  call s:hi("racketNumber",       s:olive0,  "NONE", "NONE")
  call s:hi("racketFloat",        s:olive0,  "NONE", "NONE")
  call s:hi("racketBoolean",      s:olive1,  "NONE", "bold")
  call s:hi("racketSymbol",       s:teal0,   "NONE", "NONE")
  call s:hi("racketParen",        s:fg2,     "NONE", "NONE")
  call s:hi("racketComment",      s:fg2,     "NONE", "italic")
  call s:hi("racketBlockComment", s:fg2,     "NONE", "italic")
  call s:hi("racketTodo",         s:amber1,  s:bg2,  "bold,italic")
  call s:hi("racketRequire",      s:amber1,  "NONE", "bold")
  call s:hi("racketProvide",      s:amber1,  "NONE", "bold")
  call s:hi("racketContract",     s:jade1,   "NONE", "NONE")
  call s:hi("racketStruct",       s:jade1,   "NONE", "bold")
  call s:hi("racketTypeAnnot",    s:jade1,   "NONE", "italic")
  hi link racketQuote             schemeQuote
  hi link racketQuoted            schemeQuoted

  " ── SQL dialect specifics (DB2, MySQL, PostgreSQL) ──────────
  " These extend the base sqlKeyword groups already defined
  " DB2
  call s:hi("sqlDb2Statement",    s:amber1,  "NONE", "bold")
  call s:hi("sqlDb2Type",         s:jade1,   "NONE", "NONE")
  call s:hi("sqlDb2Special",      s:sienna1, "NONE", "NONE")
  call s:hi("sqlDb2Keyword",      s:amber1,  "NONE", "bold")
  call s:hi("sqlDb2Register",     s:var0,    "NONE", "italic")
  " MySQL
  call s:hi("mysqlKeyword",       s:amber1,  "NONE", "bold")
  call s:hi("mysqlStatement",     s:amber1,  "NONE", "bold")
  call s:hi("mysqlType",          s:jade1,   "NONE", "NONE")
  call s:hi("mysqlVariable",      s:var0,    "NONE", "NONE")
  call s:hi("mysqlString",        s:jade0,   "NONE", "NONE")
  call s:hi("mysqlNumber",        s:olive0,  "NONE", "NONE")
  call s:hi("mysqlComment",       s:fg2,     "NONE", "italic")
  call s:hi("mysqlOperator",      s:sienna0, "NONE", "NONE")
  call s:hi("mysqlSpecial",       s:sienna1, "NONE", "NONE")
  call s:hi("mysqlFunction",      s:teal1,   "NONE", "NONE")
  " PostgreSQL
  call s:hi("plpgsqlKeyword",     s:amber1,  "NONE", "bold")
  call s:hi("plpgsqlType",        s:jade1,   "NONE", "NONE")
  call s:hi("plpgsqlVariable",    s:var0,    "NONE", "NONE")
  call s:hi("plpgsqlString",      s:jade0,   "NONE", "NONE")
  call s:hi("plpgsqlNumber",      s:olive0,  "NONE", "NONE")
  call s:hi("plpgsqlComment",     s:fg2,     "NONE", "italic")
  call s:hi("plpgsqlOperator",    s:sienna0, "NONE", "NONE")
  call s:hi("plpgsqlFunction",    s:teal1,   "NONE", "NONE")
  call s:hi("plpgsqlException",   s:rose0,   "NONE", "bold")

  " ── Delphi / Pascal extended ─────────────────────────────────
  call s:hi("delphiKeyword",      s:amber1,  "NONE", "bold")
  call s:hi("delphiType",         s:jade1,   "NONE", "NONE")
  call s:hi("delphiClass",        s:jade1,   "NONE", "bold")
  call s:hi("delphiInterface",    s:teal0,   "NONE", "bold")
  call s:hi("delphiVariable",     s:var0,    "NONE", "NONE")
  call s:hi("delphiProperty",     s:teal1,   "NONE", "NONE")
  call s:hi("delphiDirective",    s:sienna1, "NONE", "italic")
  call s:hi("delphiString",       s:jade0,   "NONE", "NONE")
  call s:hi("delphiNumber",       s:olive0,  "NONE", "NONE")
  call s:hi("delphiFloat",        s:olive0,  "NONE", "NONE")
  call s:hi("delphiOperator",     s:sienna0, "NONE", "NONE")
  call s:hi("delphiComment",      s:fg2,     "NONE", "italic")
  call s:hi("delphiDocComment",   s:fg2,     "NONE", "italic")
  call s:hi("delphiException",    s:rose0,   "NONE", "bold")
  call s:hi("delphiFunction",     s:teal1,   "NONE", "NONE")
  hi link delphiProcedure         delphiFunction

  " ── Update variable roles in typed languages ─────────────────
  " C / C++ — variables distinct from types
  call s:hi("cVarDecl",           s:var0,    "NONE", "NONE")
  call s:hi("cppVarDecl",         s:var0,    "NONE", "NONE")
  call s:hi("cppAttribute",       s:sienna1, "NONE", "italic")

  " Java — variables distinct from types
  call s:hi("javaVariableDef",    s:var0,    "NONE", "NONE")
  call s:hi("javaParam",          s:var0,    "NONE", "italic")
  call s:hi("javaField",          s:var0,    "NONE", "NONE")

  " Rust — variables distinct from types
  call s:hi("rustLetBinding",     s:var0,    "NONE", "NONE")
  call s:hi("rustPatBinding",     s:var0,    "NONE", "NONE")
  call s:hi("rustFuncArg",        s:var0,    "NONE", "italic")

  " Go — variables distinct from types
  call s:hi("goVar",              s:var0,    "NONE", "NONE")
  call s:hi("goParamName",        s:var0,    "NONE", "italic")

  " Python — variables distinct from types
  call s:hi("pythonParam",        s:var0,    "NONE", "italic")

  " PHP — variables distinct from types
  call s:hi("phpMemberVar",       s:var0,    "NONE", "NONE")

  " TypeScript — explicit param and variable distinction
  call s:hi("typescriptParam",    s:var0,    "NONE", "italic")
  call s:hi("typescriptObjectLabel", s:teal0,"NONE", "NONE")

" ============================================================
"  TERMINAL COLOURS (dark only)
" ============================================================

if has("nvim")
  let g:terminal_color_0  = "#0c1a1e"
  let g:terminal_color_1  = "#c86858"
  let g:terminal_color_2  = "#5aaa88"
  let g:terminal_color_3  = "#d48820"
  let g:terminal_color_4  = "#4898a8"
  let g:terminal_color_5  = "#b86030"
  let g:terminal_color_6  = "#6ab8c8"
  let g:terminal_color_7  = "#eedcb8"
  let g:terminal_color_8  = "#244048"
  let g:terminal_color_9  = "#e07868"
  let g:terminal_color_10 = "#3e8870"
  let g:terminal_color_11 = "#e8a838"
  let g:terminal_color_12 = "#a8c8e0"
  let g:terminal_color_13 = "#d07848"
  let g:terminal_color_14 = "#4ec4a8"
  let g:terminal_color_15 = "#f2e8d0"
endif