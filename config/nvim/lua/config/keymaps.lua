-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- For easing switching between Windows (i.e. moving between the active buffer and neo-tree)
map("n", "<C-[>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-]>", "<C-w>l", { desc = "Go to right window", remap = true })
