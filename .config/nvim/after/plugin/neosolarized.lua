local ok_status, n = pcall(require, "NeoSolarized")

if not ok_status then
  return
end

n.setup({
  style = 'dark',
  transparent = true,
  enable_italics = true,
})
