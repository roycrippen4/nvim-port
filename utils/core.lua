local M = {}

M.lazy = {
  change_detection = {
    enabled = true,
    notify = false,
  },
  concurrency = 15,
  git = {
    log = { '-8' },
    timeout = 15,
    url_format = 'https://github.com/%s.git',
    filter = true,
  },
}

return M
