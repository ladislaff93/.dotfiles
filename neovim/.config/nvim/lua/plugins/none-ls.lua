return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatting
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.rustfmt, -- Handled by rustaceanvim
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.swiftformat,

        -- Linting
        null_ls.builtins.diagnostics.swiftlint,
      },
    })
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
  end,
}
