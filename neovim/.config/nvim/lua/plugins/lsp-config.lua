return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('spring_boot').init_lsp_commands()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig = require("lspconfig")
            lspconfig.jdtls.setup({
                init_options = {
                    bundles = require("spring_boot").java_extensions(),
                }
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            -- lspconfig.rust_analyzer.setup({
            --   capabilities = capabilities,
            -- })
            lspconfig.jedi_language_server.setup({
                capabilities = capabilities,
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                    virtual_text = false,
                    signs = true,
                    update_in_insert = false,
                    underline = true,
                }
            )

            vim.keymap.set("n", "D", vim.diagnostic.open_float, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<CR>", {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
