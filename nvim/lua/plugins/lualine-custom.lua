return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Customzie my options.
    opts.options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {
          "alpha",
          "checkhealth",
          "dashboard",
          "snacks_dashboard",
          "fzf",
          "lazy",
          "mason",
          "TelescopePrompt",
        },
      },
      always_divide_middle = true,
      globalstatus = 1,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    }

    -- Set desired sections.
    opts.sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {},
      lualine_x = { { "filename", path = 1 } },
      lualine_y = { { "filetype", icon_only = true } },
      lualine_z = {
        { "location", separator = " ", padding = { left = 1, right = 0 } },
        { "progress", padding = { left = 0, right = 1 } },
      },
    }

    -- Set inactive sections.
    opts.inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    }

    -- Initialize everything else.
    opts.tabline = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "tabs" },
    }

    opts.winbar = {}
    opts.inactive_winbar = {}
    opts.extensions = { "neo-tree", "lazy" }
  end,
}
