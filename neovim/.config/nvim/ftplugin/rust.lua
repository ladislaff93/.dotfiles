local bufnr = vim.api.nvim_get_current_buf()
local wk = require("which-key")
vim.keymap.set(
  "n",
  "<leader>ca",
  function()
    vim.lsp.buf.code_action()
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({ 'hover', 'actions' })
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "<leader>rb",
  function()
    vim.cmd.RustLsp('testables')
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "<leader>rr",
  function()
    vim.cmd.RustLsp('runnables')
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "<leader>re",
  function()
    vim.cmd.RustLsp('expandMacro')
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "<leader>rd",
  function()
    vim.cmd.RustLsp({ 'explainError', 'current' })
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "<leader>rf",
  function()
    vim.cmd.RustLsp('flyCheck') -- defaults to 'run'
  end,
  { silent = true, buffer = bufnr }
)

wk.register({
  ["<leader>"] = {
    r = {
      name = "Rust",
      b = { "Testables" },
      r = { "Runnables" },
      e = { "Expand Macro" },
      d = { "Explain Error" },
      f = { "Fly Check" }
    },
  },
})
