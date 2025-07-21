" Vim syntax file for Context-Free Grammar
" Language: GIC Grammar
" Maintainer: Grok
" Latest Revision: 03 June 2025

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword gicKeyword TERM ALC ANUL UNIT

" Variables (uppercase letters)
syn match gicVariable "[A-Z]"

" Terminals (lowercase letters and lambda)
syn match gicTerminal "[a-zλ$0-9]"

" Symbols
syn match gicSymbol ":=\|->\|=\||"

" Sets (curly braces and their content)
syn match gicSet "{[^}]*}" contains=gicVariable

" Comments (starting with dash, but not matching ->)
syn match gicComment "-[^>].*$"

syn match  gicLabel "^.*:"
syn region gicCommentBlock start="---" end="---"

" Parentheses
syn match gicParen "[()]"

" Highlighting
hi def link gicKeyword Keyword
hi def link gicVariable Identifier
hi def link gicTerminal String
hi def link gicSymbol Operator
hi def link gicLabel Tag
hi def link gicSet Constant
hi def link gicComment Comment
hi def link gicCommentBlock Comment
hi def link gicParen Delimiter

let b:current_syntax = "gic"
