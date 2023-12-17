local M = {}

---@return integer width returns the width of the nvimtree buffer
function M.get_nvim_tree_width()
  for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].ft == "NvimTree" then
      return vim.api.nvim_win_get_width(win) + 1
    end
  end
  return 0
end

--- Sets the title in the overlay section above nvimtree
function M.set_nvim_tree_overlay_title()
  local title = "File Tree"
  local tree_width = M.get_nvim_tree_width()

  -- early return if tree is not shown
  if tree_width == 0 then
    vim.g.NvimTreeOverlayTitle = ""
    return
  end

  -- Set the title if the tree is shown, but no buffers are open
  if #vim.t.bufs == 0 then
    local start_title = vim.loop.cwd()
    vim.g.NvimTreeOverlayTitle = "%#NvimTreeTitle#" .. start_title
    return
  end

  -- Set the title if the tree is shown and buffers are open
  local width = tree_width - #title
  local padding = string.rep(" ", math.floor(width / 2))
  local title_with_pad = padding .. title .. padding
  if tree_width % 2 == 0 then
    vim.g.NvimTreeOverlayTitle = "%#NvimTreeTitle#" .. title_with_pad .. "%#NvimTreeTitleSep#" .. "▏"
  else
    vim.g.NvimTreeOverlayTitle = "%#NvimTreeTitle#"
      .. string.sub(title_with_pad, 0, -2)
      .. "%#NvimTreeTitleSep#"
      .. "▏"
  end
end
