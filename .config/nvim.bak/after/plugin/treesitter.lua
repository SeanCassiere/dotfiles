local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "tsx",
    "toml",
    "fish",
    "json",
    "yaml",
    "swift",
    "css",
    "html",
    "lua",
    "typescript",
    "graphql",
    "bash",
    "dockerfile",
    "scss",
    "prisma",
    "gitignore",
    "vim"
  },
  autotag = {
    enable = true,
  },
  sync_installed = true,
  auto_install = true,
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }