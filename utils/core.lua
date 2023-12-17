local tab_modules = require "custom.configs.tabufline"

local M = {}

M.lazy = {
  change_detection = {
    enabled = true,
    notify = false,
  },
  concurrency = 15,
}

M.tabufline = {
  overriden_modules = function(modules)
    modules[1] = vim.g.NvimTreeOverlayTitle
    modules[2] = tab_modules.bufferlist()
    modules[4] = ""
  end,
  enabled = true,
  lazyload = false,
}

-- M.statusline = {
--   enabled = true,
--   lazyload = false,
--   overriden_modules = function(modules)
--     modules[1] = "HELLO"
--   end,
-- }

return M
