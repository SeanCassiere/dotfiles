vim.cmd[[colorscheme NeoSolarized]]

local ok_status, n = pcall(require, "NeoSolarized")

if not ok_status then
  return
end

n.setup({
  style = 'dark',
  transparent = true,
  enable_italics = true,

  -- Add specific hightlight groups
  on_highlights = function(highlights, colors) 
    -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
  end,
})

