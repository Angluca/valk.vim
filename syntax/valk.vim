if exists("b:current_syntax")
    finish
endif

syn keyword valkKeyword static dynamic shared public global
syn keyword valkKeyword fn let mut const
syn keyword valkKeyword co
syn keyword valkKeyword link header use alias macro
syn keyword valkKeyword value pointer mode trait extend

syn keyword valkType bool char byte void string cstring
syn keyword valkType int uint isize usize
syn keyword valkType i8 i16 i32 i64 u8 u16 u32 u64
syn keyword valkType float f32 f64

syn keyword valkSelf self this ptr default
syn keyword valkConstant true false null
syn keyword valkSMacro assert println print
syn match   valkNew  '\v<(new|[m]?alloc|create)>'
syn match   valkFree '\v<(free)>'

syn keyword valkRepeat while each for
syn keyword valkStatement break continue return defer await as
syn keyword valkConditional if else elif match case
syn keyword valkLabel default

syn keyword valkException throw cothrow try catch cast
syn keyword valkPanic panic

syn match valkTitle      '[@!?$]'
syn match valkSymbol     '[,;:\.]'
syn match valkOperator   '[\+\-\%=\/\^\&\*><\|~]'
syn match valkOperator   '\v(\&\&|\|\||\!\=)'
syn match valkConstant   '[{}\[\]()]'

syn match valkType       '\v[?]@<=\s*<(\w+)>' " ?type
syn match valkType       '\v\(@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\)' " (type*)
syn match valkType       '\v\[@<=\s*\w+\ze(\[.*\])*\s*\*+\s*\]' " [type*]
syn match valkType       '\v<\w+_[tscemui]>'
syn match valkMacro      '\v<[_]*\u[A-Z0-9_]*>'
syn match valkType       '\v<[_]*\u[A-Z0-9_]*[a-z]+\w*>'
"syn match valkType       '\v\.?\zs<([iu][0-9]{1,3})?>'
syn match valkRepeat     '\v([^\.](\.|\.{3}|:|-\>))@<=\w\w*'
"syn match valkType       '\v<\w+>\ze(\<(\w+\s*(\<.*\>|\[.*\])?\s*[,]?\s*)*\>)' "foo<T>()
syn match valkType       '\v<\w+>\ze(:\w)'
syn match valkFunc       '\v[_]*\l\w*\ze((\[.*\])|((::)?\<.*\>))*\s*\('

syn match valkException  '\v(\s@<=[&*~]+\ze[\(\[\{\<]*[-]?\w)|(\w@<=[*]+\ze(\W|\s))'
syn match valkStruct     '\v((type|typedef|struct|class|object|enum|union|mode|trait)(\[.*\])?\s*)@<=[_]*\w+\ze(\[.*\])?\s*(\(|\{)'

syn match valkAdded      '\v^\s*<(test)\ze\s.*\{'
syn match valkLabel      '\v<\@(\w+)*>'

" -- shader
"syn match valkKeyword    '\v<(uniform|instance|varying|var|vertex|fragment|in|out)>\s'
"syn match valkType       '\v<(texture|texture2D)>\s'
syn match valkType       '\v<bool[234]?>'
syn match valkType       '\v<int[234]?>'
syn match valkType       '\v<uint[234]?>'
syn match valkType       '\v<half[234]?>'
syn match valkType       '\v<float([234](x[234])?)?>'
syn match valkType       '\v<[dbui]?vec[234]>'
syn match valkType       '\v<vec[234][dbfhui]?>'
syn match valkType       '\v<mat[234](x[234]f)?>'


"hi def valkSymbol ctermfg=DarkGray guifg=DarkGray
hi def link valkSMacro   SpecialComment
hi def link valkNew      Added
hi def link valkFree     Exception
hi def link valkTitle    Title
hi def link valkAdded    Added
hi def link valkStruct   Changed
hi def link valkConstant Constant
hi def link valkSymbol   Changed
hi def link valkMacro    Macro
hi def link valkSComment SpecialComment
hi def link valkFunc     Function
hi def link valkTypedef  Changed
"hi def valkType ctermfg=DarkCyan guifg=DarkCyan
hi def link valkType     MoreMsg
"hi def link valkType SpecialComment
"hi def valkSelf ctermfg=DarkMagenta guifg=DarkMagenta
hi def link valkSelf     Label
hi def link valkModeMsg  ModeMsg

syn match  valkSpecialCharError display contained +\\\([^0-7nrt\\'"]\|[xX]\x\{2}\)+
syn match  valkSpecialChar      contained "\\\([\"\\'ntr]\|[xX]\x\{2}\)"
syn match  valkCharacter        "'[^']*'" contains=valkSpecialChar,valkSpecialCharError
syn match  valkCharacter        "'\\''" contains=valkSpecialChar
syn match  valkCharacter        "'[^\\]'"

"syn region    valkString      matchgroup=valkString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=valkEscape,@Spell
syn region    valkString      matchgroup=valkString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
"syn region    valkString      matchgroup=valkString start=+`+ skip=+\\\\\|\\`+ end=+`+ contains=@Spell

syn match valkNumber "\v<0[xX][0-9a-fA-F_]+([iuIU]?[lL]?[0-9]{-,3})?>"
syn match valkNumber "\v<0[bB][01_]+([iuIU]?[lL]?[0-9]{-,3})?>"

syn match valkFloat  '\v<\.\d+([eE][+-]?\d+)?[fFdD]?>' display
syn match valkFloat  '\v<([0][1-9]*)([eE][+-]?\d+)?[fFdD]?>' display
syn match valkFloat  '\v<0x\x+(\.\x+)?[pP][+-]?\d+[fFdD]?>' display

" Integer literals
syn match valkInteger '\v(\.@1<!|\.\.)\zs<(0|[1-9]\d*)([eE][+-]?\d+)?([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match valkInteger '\v(\.@1<!|\.\.)\zs<0b[01]+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match valkInteger '\v(\.@1<!|\.\.)\zs<0o\o+([iuIU]?[lL]?[0-9]{-,3})?>' display
syn match valkInteger '\v(\.@1<!|\.\.)\zs<0x\x+([iuIU]?[lL]?[0-9]{-,3})?>' display

syn match valkFloat   display "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match valkFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match valkFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match valkFloat   display "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Escape sequences
syn match valkEscape '\\[\\'"0abfnrtv]' contained display
syn match valkEscape '\v\\(x\x{2}|u\x{4}|U\x{8})' contained display
" Format sequences
syn match valkFormat '\v\{\d*(\%\d*|:([- +=befgoxX]|F[.2sESU]|\.?\d+|_(.|\\([\\'"0abfnrtv]|x\x{2}|u\x{4}|\x{8})))*)?}' contained contains=valkEscape display
syn match valkFormat '{{\|}}' contained display


hi def link valkPreProc               PreProc
hi def link valkSuper                 Title
hi def link valkFloat                 Constant
hi def link valkInteger               Number
hi def link valkEscape                SpecialComment
hi def link valkFormat                SpecialChar

hi def link valkKeyword               Keyword
hi def link valkInclude               Include
hi def link valkLabel                 Label
hi def link valkConditional           Conditional
hi def link valkRepeat                Repeat
hi def link valkStatement             Statement
"hi def link valkType                  Type
hi def link valkNumber                Number
hi def link valkComment               Comment
hi def link valkOperator              Operator
hi def link valkCharacter             Character
hi def link valkString                String
hi def link valkTodo                  Todo
hi def link valkSpecial               Special
hi def link valkSpecialError          Error
hi def link valkSpecialCharError      Error
hi def link valkString                String
hi def link valkCharacter             Character
hi def link valkSpecialChar           SpecialChar
hi def link valkException             Exception
hi def link valkPanic                 Exception

syn match   valkTypedef  contains=valkTypedef "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn match   valkFunc     "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn keyword valkKeyword union enum type typedef namespace object class struct mode trait nextgroup=valkTypedef skipwhite skipempty
syn keyword valkKeyword union nextgroup=valkType skipwhite skipempty contained
"syn keyword valkMacro platform macro nextgroup=valkTypedef skipwhite skipempty
" adapted from neovim runtime/syntax
syn keyword valkTodo contained TODO FIXME XXX NOTE
syn region  valkComment  start="/\*" end="\*/" contains=valkTodo,@Spell
syn match   valkComment  "//.*$" contains=valkTodo,@Spell
syn match   valkMacro    '\v#.*$'

let b:current_syntax = "valk"
