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
                    "pyright",
                    "jdtls",
                    "jsonls"
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require('spring_boot').init_lsp_commands()
            require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(_, bufnr)
                local opts = { buffer = bufnr, noremap = true, silent = true }

                opts.desc = "Show line diagnostics"
                vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Show documentation for what is under cursor"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Go to definition"
                vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions trim_text=true<cr>", opts)

                opts.desc = "Go to references"
                vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Go to implementation"
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

                opts.desc = "Rename symbol"
                vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename, opts)

                opts.desc = "Code actions"
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
            end

            -- Configure LSP servers
            vim.lsp.config('jdtls', {
                capabilities = capabilities,
                init_options = {
                    bundles = require("spring_boot").java_extensions(),
                }
            })

            vim.lsp.config('lua_ls', {
                capabilities = capabilities,
            })

            vim.lsp.config('pyright', {
                capabilities = capabilities,
            })

            vim.lsp.config('jsonls', {
                capabilities = capabilities,
            })

            vim.lsp.config('sourcekit', {
                capabilities = capabilities,
                on_attach = on_attach,
                root_dir = function(_, callback)
                    callback(
                        require("lspconfig.util").root_pattern("Package.swift")(vim.fn.getcwd())
                        or require("lspconfig.util").find_git_ancestor(vim.fn.getcwd())
                    )
                end,
                cmd = { vim.trim(vim.fn.system("xcrun -f sourcekit-lsp")) }
            })

            -- Enable LSP servers
            vim.lsp.enable('jdtls')
            vim.lsp.enable('lua_ls')
            vim.lsp.enable('pyright')
            vim.lsp.enable('jsonls')
            vim.lsp.enable('sourcekit')
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
