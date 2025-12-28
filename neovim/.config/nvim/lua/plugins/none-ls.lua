return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Formatting
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.swiftformat.with({
                    extra_args = { "--config", vim.fn.expand("~/.swiftformat") },
                }),

                -- Linting
                null_ls.builtins.diagnostics.swiftlint.with({
                    extra_args = { "--config", vim.fn.expand("~/.swiftlint.yml") },
                }),
            },
        })
        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
    end,
}
