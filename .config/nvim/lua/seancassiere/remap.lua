local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Open the explorer

keymap.set("n", "ss", ":split<Return><C-w>w") -- Split horizontally
keymap.set("n", "sv", ":vsplit<Return><C-w>w") -- Split vertically
