local M = {}
local core = require "custom.utils.core"

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  tabufline = core.tabufline,

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.lazy_nvim = core.lazy
M.tabufline = core.tabufline
-- M.statusline = core.statusline

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
