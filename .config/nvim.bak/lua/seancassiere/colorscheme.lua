-- set colorscheme using a protected call
-- therefore, moving it out of the .config/nvim/after/plugin/*theme.lua file

-- Options: NeoSolarized, onedark
local status, _ = pcall(function() vim.cmd [[colorscheme onedark]] end)

if (not status) then
  print("COLORSCHEME: Vim coloscheme not installed")
  print("COLORSCHEME: Check ./config/nvim/lua/{USERNAME}/colorscheme.lua")
  return
end
