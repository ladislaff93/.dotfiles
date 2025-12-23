return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        -- dashboard = { enabled = true },
        input = { enabled = true },
        notifier = {
            enabled = true,
            width = { min = 40, max = 0.6 },
            height = { min = 1, max = 0.8 },
        },
        quickfile = { enabled = true },
        image = { enabled = true },
    },
}
