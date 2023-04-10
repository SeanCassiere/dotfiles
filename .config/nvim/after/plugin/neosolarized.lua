local ok_status, n = pcall(require, "NeoSolarized")

if not ok_status then
  return
end

vim.cmd [[colorscheme NeoSolarized]]

n.setup({
  style = 'dark',
  transparent = true,
  enable_italics = true,
  -- Add specific hightlight groups
  on_highlights = function(highlights, colors)
    -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
  end,
})
