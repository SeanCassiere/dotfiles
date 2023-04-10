local status, onedark = pcall(require, 'onedark')
if (not status) then return end

vim.cmd [[colorscheme onedark]]

onedark.setup({
  style = 'darker',
  -- transparent = true,
  show_term_colors = true,
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'italic',
    strings = 'none',
    variables = 'none'
  },
  diagnostics = {
    darker = true,     -- darker colors for diagnostic
    undercurl = true,  -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
})
onedark.load()
