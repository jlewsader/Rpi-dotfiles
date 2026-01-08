return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        transparent_bg = true,
        italic_comment = true,
      })
      vim.cmd([[colorscheme dracula]])
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "dracula",
        callback = function()
          -- Main background
          vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
          vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

          -- Glass effect
          vim.api.nvim_set_hl(0, "NormalFloat", {
            bg = "#1a1a1a11",
            blend = 25,
          })

          vim.api.nvim_set_hl(0, "FloatBorder", {
            bg = "#22222233",
            blend = 30,
          })

          -- Popup menu
          vim.api.nvim_set_hl(0, "Pmenu", { bg = "#00000055" })
          vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#44475A" })

          -- Cursor glow
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#ffffff0A" })

          -- Line Numbers
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#666666", bg = "NONE" })
          vim.api.nvim_set_hl(0, "CursorLineNr", {
            fg = "#ffffff",
            bold = true,
            bg = "NONE",
          })

          -- Telescope
          vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#1a1a1a44", blend = 20 })
          vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#1a1a1a44", blend = 20 })

          -- Search & Visual
          vim.api.nvim_set_hl(0, "Search", { bg = "#ff79c660", fg = "#000000" })
          vim.api.nvim_set_hl(0, "Visual", { bg = "#bd93f960" })
        end,
      })
    end,
  },
}
