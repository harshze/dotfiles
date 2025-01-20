return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- Use "macchiato" for a slightly less dark theme (Mocha is the darkest)
      transparent_background = false, -- Set to true if you want a transparent background
      term_colors = true,
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    })

    -- Load the colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
