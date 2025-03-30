syn keyword lxKeyword clase publicos privados mensajes el es un una son copie entre entra en muestre mientras no_crear derivada_de
syn keyword lxConditional es
syn keyword lxLabel si no
syn keyword lxType objeto caracter Cantidad Cantidades

syn match lxIdentifier "\(\a\)\+\w*"
syn match lxOperator display "[=+-<>&?]"
syn match lxNumber display "\d\+"
syn match lxString display "\".*\"" 
syn match lxFunctionIdentifier "^\s*\(\a\)\+\w*" contained

syn region lxFunction transparent start="^\s*\(\a\)\+\w*(" end=")" contains=lxFunctionIdentifier,lxType,lxIdentifier,lxKeyword
syn region lxComment start="\/\*" end="\*\/"


hi def link lxIdentifier Identifier
hi def link lxKeyword Keyword
hi def link lxNumber Number
hi def link lxComment Comment
hi def link lxType Type
hi def link lxFunction Function
hi def link lxFunctionIdentifier Function
hi def link lxConditional Conditional
hi def link lxLabel Label
hi def link lxOperator Operator
hi def link lxString String
