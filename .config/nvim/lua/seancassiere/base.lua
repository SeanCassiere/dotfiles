vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.showcmd = true
vim.opt.expandtab = true
vim.opt.inccommand = 'split'

vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false

vim.opt.shell = 'fish'
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

-- Font
vim.opt.guifont = { "MesloLGMRegularNerdFontComplete", "h12" }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
