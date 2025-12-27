-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- "jk" save for iPad keyboard
vim.keymap.set("i", "jk", "<Esc>")

-- Windows Keys :)
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-q>", "<Esc>:q<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-z>", "<Esc>u", { silent = true })
vim.keymap.set("v", "<C-c>", '"+y', { silent = true })
vim.keymap.set({ "n", "i" }, "<C-v>", '"+p', { silent = true })
