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
        wk.add({
            -- Debugger
            { "<leader>d", group = "Debugger" },
            { "<leader>db", desc = "Toggle Breakpoint" },
            { "<leader>dc", desc = "Continue" },

            -- LazyGit
            { "<leader>l", group = "LazyGit" },
            { "<leader>lg", desc = "Toggle Lazy Git" },

            -- NeoTree
            { "<leader>g", group = "NeoTree" },
            { "<leader>gs", desc = "Git Status Tree" },

            -- LSP
            { "<leader>c", group = "Lsp" },
            { "<leader>cf", desc = "Format File" },
            { "<leader>ca", desc = "Code Action" },
            { "<leader>cn", desc = "Rename" },

            -- Telescope
            { "<leader>f", group = "Telescope" },
            { "<leader>ff", desc = "Find File" },
            { "<leader>fg", desc = "Live Grep" },
            { "<leader>fb", desc = "Buffers" },
            { "<leader>fr", desc = "Open Recent File" },
            { "<leader>fn", desc = "New File" },
            { "<leader>fh", desc = "Help" },

            -- Xcodebuild
            { "<leader>x", group = "Xcodebuild" },

            -- LSP Navigation
            { "K", desc = "Hover LSP" },
            { "gd", desc = "Go To Definition" },
            { "gr", desc = "Go To References" },
            { "gi", desc = "Go To Implementation" },
        })
    end
}
