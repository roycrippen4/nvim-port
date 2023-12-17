local M = {}

M.treesitter = {
  ensure_installed = {
    'vim',
    'lua',
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'c',
    'markdown',
    'markdown_inline',
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    'lua-language-server',
    'stylua',

    -- web dev stuff
    'css-lsp',
    'html-lsp',
    'typescript-language-server',
    'jsonls',
    'rust-analyzer',
    'prettier',

    -- c/cpp stuff
    'clangd',
    'clang-format',
  },
}

M.lazy = {
  change_detection = {
    enabled = true,
    notify = false,
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
