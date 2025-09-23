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
        vim.lsp.config('csharp_ls', {
            capabilities = capabilities,
        })

        vim.diagnostic.config({
            update_in_insert = true,
            -- virtual_text = true,
            underline = true,
            signs = true,
            -- severity_sort = true,
        })

        -- Show line diagnostics automatically in hover window
        vim.o.updatetime = 250
        vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]])

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "gD", vim.lsp.buf.implementation, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
}
