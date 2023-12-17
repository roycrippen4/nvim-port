-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local sep_color = '#454951'
local M = {}

M.override = {
  Comment = {
    italic = true,
  },
  WinSeparator = {
    fg = sep_color,
    bg = 'black',
  },
}

M.add = {
  WinBar = {
    fg = 'red',
    bg = 'black',
  },
  WinBarNC = {
    bg = 'black',
  },
  NvimTreeOpenedFolderName = { fg = 'green', bold = true },
}

return M
