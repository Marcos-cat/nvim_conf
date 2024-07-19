setlocal commentstring=#%s

hi link @lsp.type.noadic_function.uiua @variable.builtin
hi link @lsp.type.monadic_function.uiua String
hi link @lsp.type.dyadic_function.uiua Function
hi link @lsp.type.triadic_function.uiua @field
hi link @lsp.type.tetradic_function.uiua @preproc
hi link @lsp.type.uiua_number.uiua Number
hi link @lsp.type.dyadic_modifier.uiua Keyword
hi link @lsp.type.monadic_modifier.uiua Type
hi link @lsp.type.uiua_string.uiua @constructor
hi link @lsp.type.uiua_module.uiua @symbol

syn match uiuaBracket '[←()\[\]{}|^]'
hi link uiuaBracket @punctuation
