-- lua/plugins/rose-pine.lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      variant = "auto", -- auto, main, moon, or dawn
      dark_variant = "moon", -- main, moon, or dawn
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
      },

      styles = {
        bold = true,
        italic = true,
        transparency = true,
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "base",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },

      palette = {
        -- Override the builtin palette per variant
        moon = {
          base = "#000000",
          love = "#ee5396",
          rose = "#FF7EB6",
          pine = "#3ddbd9",
          overlay = "#191724",
          surface = "#191724",
        },
        dawn = {
          base = "#F7F9F9",
          love = "#ee5396",
          rose = "#FF7EB6",
          pine = "#3ddbd9",
        },
      },

      -- NOTE: Highlight groups are extended (merged) by default. Disable this
      -- per group via `inherit = false`
      highlight_groups = {
        CursorColumn = { fg = "NONE", bg = "base" },
        CursorLine = { fg = "NONE", bg = "overlay" },
        --thx naz
        Pmenu = { fg = "iris", bg = "NONE" },
        PmenuSbar = { fg = "none", bg = "base" },
        PmenuThumb = { fg = "none", bg = "iris" },
        PmenuSel = { fg = "base", bg = "NONE" },
        NormalFloat = { link = "Pmenu" },
        FloatBorder = { link = "Pmenu" },
        --thx naz
        StatusLine = { fg = "foam", bg = "base" },
        Visual = { fg = "base", bg = "text", inherit = false },
        -- Comment = { fg = "foam" },
        -- StatusLineTerm = { fg = "cyan", bg = "overlay" },
        -- StatusLineNC = { fg = "cyan", bg = "overlay" },
        -- StatusLineTermNC = { fg = "cyan", bg = "overlay" },
        -- VertSplit = { fg = "muted", bg = "muted" },
      },

      before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
      end,
    })
    vim.cmd("colorscheme rose-pine-moon")
  end,
}
