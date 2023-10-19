-- These are the general custom Vim keybinds.
-- The plugin level keybinds are setup in .config/nvim/after/plugin/*.lua
local keymap = vim.keymap

vim.g.mapleader = " "

-- Delete single character without copying into register
keymap.set('n', 'x', '"_x')

-- Netdir/Open default explorer
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Window management
keymap.set("n", "sv", ":vsplit<Return><C-w>w") -- Split vertically
keymap.set("n", "sh", ":split<Return><C-w>w")  -- Split horizontally
keymap.set("n", "<leader>se", "<C-w>=")        -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>")    -- close current split window
