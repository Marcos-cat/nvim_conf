setlocal commentstring=#%s

syn match uiuaComment '#.*$'
hi link uiuaComment @comment

hi link @lsp.type.noadic_function.uiua @variable.builtin
hi link @lsp.type.monadic_function.uiua @string
hi link @lsp.type.dyadic_function.uiua @function
hi link @lsp.type.uiua_number.uiua @number
hi link @lsp.type.dyadic_modifier.uiua @keyword
hi link @lsp.type.monadic_modifier.uiua @type
hi link @lsp.type.uiua_string.uiua @constructor

syn match uiuaBracket '[←()\[\]{}|⟨⟩]'
hi link uiuaBracket @punctuation
