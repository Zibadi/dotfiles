return {
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
        })
        vim.lsp.config('gopls', {
            capabilities = capabilities,
        })
        vim.lsp.config('pyright', {
            capabilities = capabilities,
        })
        vim.lsp.config('clangd', {
            capabilities = capabilities,
        })
        vim.lsp.config('roslyn', {
            capabilities = capabilities,
        })
        vim.lsp.config('vtsls', {
            capabilities = capabilities,
        })
        -- vim.lsp.config('omnisharp', {
        --     capabilities = capabilities,
        -- })

        -- vim.diagnostic.config({
        --     update_in_insert = true,
        --     -- virtual_text = true,
        --     underline = true,
        --     signs = true,
        --     -- severity_sort = true,
        -- })

        -- Show line diagnostics automatically in hover window
        -- vim.o.updatetime = 250
        -- vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gr", function() require("telescope.builtin").lsp_references() end, {})
        vim.keymap.set("n", "gD", vim.lsp.buf.implementation, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
        vim.keymap.set("n", "<leader>q", function() require("telescope.builtin").diagnostics() end, {})

        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            update_in_insert = false,
            virtual_text = { spacing = 4, prefix = "●" },
            severity_sort = true,
        })
    end,
}
