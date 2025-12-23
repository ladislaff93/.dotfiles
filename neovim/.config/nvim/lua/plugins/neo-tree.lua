return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>n", ":Neotree<CR>")
        vim.keymap.set("n", "<leader>gs", ":Neotree source=git_status<CR>", {})
        require("neo-tree").setup({
            popup_border_style = "rounded",
            enable_git_status = true,
            enable_diagnostics = true,
            window = {
                position = "float",
                width = 40,
            },

            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                follow_current_file = {
                    enabled = true,
                },
            }
        })
    end
}
