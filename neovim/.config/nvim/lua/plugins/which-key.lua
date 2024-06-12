return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
  },
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        d = {
          name = "Debugger",
          b = { "Toogle Breakpoint" },
          c = { "Continue" },
        },
        l = {
          name = "LazyGit",
          g = { "Toogle Lazy Git" }
        },
        c = {
          name = "Lsp",
          f = { "Format File" },
          a = { "Code Action" },
          n = { "Rename" }
        },
        f = {
          name = "Telescope",
          f = { "Find File" },
          g = { "Live Grep" },
          b = { "Buffers" },
          r = { "Open Recent File" },
          n = { "New File" },
          h = { "Help" },
        },
      },

      [""] = {
        K = { "Hover LSP" },
        g = {
          d = { "Go To Definition" },
          r = { "Go To References" },
          i = { "Go To Implementation" },
        },
      },
    })
  end
}
