return {
    'Wansmer/symbol-usage.nvim',
    event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
        local SymbolKind = vim.lsp.protocol.SymbolKind

        require('symbol-usage').setup({
            hl = { link = 'Comment' },
            kinds = { SymbolKind.Class, SymbolKind.Interface, SymbolKind.Function, SymbolKind.Method, SymbolKind.Field, SymbolKind.Property, SymbolKind.Enum, SymbolKind.EnumMember },
            kinds_filter = {},
            vt_position = 'above',
            vt_priority = nil,
            request_pending_text = 'loading...',
            references = { enabled = true, include_declaration = false },
            definition = { enabled = false },
            implementation = { enabled = false },
            disable = { lsp = {}, filetypes = {}, cond = {} },
            symbol_request_pos = 'end',
            symbol_filter = nil,
            log = { enabled = false },
        })
    end
}
