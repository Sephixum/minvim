return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  opts = ...,
  config = function()
    local options = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {
        Pmenu = { bg = "none" },
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none", fg = "#ebdbb2" },
        BlinkCmpMenu = { bg = "none" },
        BlinkCmpDoc = { bg = "none" },
        BlinkCmpDocBorder = { bg = "none" },
        BlinkCmpMenuBorder = { bg = "none" },

        -- OPTIONAL: Customize the selection bar to look "Gruvbox-y"
        PmenuSel = { bg = "#665c54", fg = "#fbf1c7", bold = true },
      },
      dim_inactive = false,
      transparent_mode = true,
    }
    require("gruvbox").setup(options)
    vim.cmd("colorscheme gruvbox")
  end,

}
