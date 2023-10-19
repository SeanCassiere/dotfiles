vim.cmd("autocmd!")

local opt = vim.opt

vim.scriptencoding = 'utf-8'

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

opt.swapfile = false
opt.backup = false

opt.title = true
opt.autoindent = true
opt.smartindent = true

opt.hlsearch = true
opt.showcmd = true
opt.expandtab = true
opt.inccommand = 'split'

opt.ignorecase = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false

opt.shell = 'fish'
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- Font
opt.guifont = { "MesloLGMRegularNerdFontComplete", "h12" }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }
