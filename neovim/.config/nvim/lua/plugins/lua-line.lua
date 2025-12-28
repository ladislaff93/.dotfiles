return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local function xcodebuild_device()
      if vim.g.xcodebuild_platform == "macOS" then
        return " macOS"
      end

      local deviceIcon = ""
      if vim.g.xcodebuild_platform:match("watch") then
        deviceIcon = "􀟤"
      elseif vim.g.xcodebuild_platform:match("tv") then
        deviceIcon = "􀡴 "
      elseif vim.g.xcodebuild_platform:match("vision") then
        deviceIcon = "􁎖 "
      end

      if vim.g.xcodebuild_os then
        return deviceIcon .. " " .. vim.g.xcodebuild_device_name .. " (" .. vim.g.xcodebuild_os .. ")"
      end

      return deviceIcon .. " " .. vim.g.xcodebuild_device_name
    end

    require("lualine").setup({
      options = {
        theme = 'auto',
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { { 'branch', separator = { right = "" } } },
        lualine_x = {
          { "' ' .. vim.g.xcodebuild_last_status", color = { fg = "Gray" } },
          { "'󰙨 ' .. vim.g.xcodebuild_test_plan", color = { fg = "#a6e3a1", bg = "#161622" } },
          { xcodebuild_device, color = { fg = "#f9e2af", bg = "#161622" } },
        },
        lualine_y = { 'filetype' },
        lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
      }
    })
  end
}
