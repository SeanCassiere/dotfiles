local status, autopairs = pcall(require, 'nivm-autopairs')
if (not status) then return end

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})
