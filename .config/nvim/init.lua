require("seancassiere.base")
require("seancassiere.remap")
require("seancassiere.plugins")
require("seancassiere.highlights")

local has = vim.fn.has

local is_macos = has "macunix"
local is_windows = has "win32"
local is_wsl = has "wsl"

if is_macos then
  require("seancassiere.macos")
end
if is_windows then
  require("seancassiere.windows")
end
