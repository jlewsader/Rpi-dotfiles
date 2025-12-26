-- ==============================
-- Core settings
-- ==============================

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.o.showmode = false

vim.o.undofile = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- =============================
-- Keymaps
-- =============================

local keymap = vim.keymap.set

-- "jk" save for iPad keyboard
vim.keymap.set("i", "jk", "<Esc>")

-- Windows Keys :)
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-q>", "<Esc>:q<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-z>", "<Esc>u", { silent = true })
vim.keymap.set("v", "<C-c>", '"+y', { silent = true })
vim.keymap.set({ "n", "i" }, "<C-v>", '"+p', { silent = true })

-- Half-page scroll with Ctrl-J / Ctrl-K (tmux-safe)
vim.keymap.set("n", "<M-j>", "<C-d>zz", { desc = "Scroll down half page" })
vim.keymap.set("n", "<M-k>", "<C-u>zz", { desc = "Scroll up half page" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Neotree
-- vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>")

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- LSP
keymap("n", "gd", vim.lsp.buf.definition)
keymap("n", "K", vim.lsp.buf.hover)
keymap("n", "<leader>rn", vim.lsp.buf.rename)
keymap("n", "<leader>ca", vim.lsp.buf.code_action)

-- Quick save
keymap("n", "<leader>w", ":w<cr>")

-- ==============================
-- lazy.nvim bootstrap
-- ==============================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ==============================
-- Plugins
-- ==============================

require("lazy").setup({

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- LSP core
  {
    "neovim/nvim-lspconfig",
  },

  -- Mason (LSP installer)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "pyright" },
      })
    end,
  },

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        },
      })
    end,
  },

  -- Git signs
{
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },

      current_line_blame = false,

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        -- Navigation
        map("n", "]h", gs.next_hunk, "Next Git hunk")
        map("n", "[h", gs.prev_hunk, "Prev Git hunk")

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", gs.toggle_current_line_blame, "Toggle line blame")

        -- Visual mode
        map("v", "<leader>hs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage selected hunk")

        map("v", "<leader>hr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset selected hunk")
      end,
    })
  end,
},

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },
})

-- ==============================
-- Neovim 0.11+ LSP configuration
-- ==============================

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

-- Python
vim.lsp.config("pyright", {
  capabilities = capabilities,
})

-- Enable the servers
vim.lsp.enable({ "ts_ls", "pyright" })
