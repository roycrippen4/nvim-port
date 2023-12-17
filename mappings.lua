local M = {}

M.disabled = {
  n = {
    ["<leader>/"] = "",
    ["<leader>D"] = "",
    ["<leader>b"] = "",
    ["<leader>ca"] = "",
    ["<leader>cc"] = "",
    ["<leader>ch"] = "",
    ["<leader>cm"] = "",
    ["<leader>e"] = "",
    ["<leader>gb"] = "",
    ["<leader>gt"] = "",
    ["<leader>h"] = "",
    ["<leader>ma"] = "",
    ["<leader>n"] = "",
    ["<leader>ph"] = "",
    ["<leader>pt"] = "",
    ["<leader>q"] = "",
    ["<leader>ra"] = "",
    ["<leader>rh"] = "",
    ["<leader>td"] = "",
    ["<leader>th"] = "",
    ["<leader>v"] = "",
    ["<leader>wa"] = "",
    ["<leader>wl"] = "",
    ["<leader>wr"] = "",
    ["[d"] = "",
    ["]d"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["yil"] = { "^y$", "yank in line", opts = { noremap = true } },
    ["<Leader>z"] = { ":ZenMode<CR>", "Zen", opts = { nowait = true } },
    ["<Leader>v"] = { "<C-w>v", "Vertical split", opts = { nowait = true } },
    ["<Leader>h"] = { "<C-w>s", "Horizontal split", opts = { nowait = true } },
    ["<Leader>lh"] = {
      function()
        vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0))
        print("inlay hints: " .. tostring(vim.lsp.inlay_hint.is_enabled()))
      end,
      "Toggle lsp inlay hints",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.tabufline = {
  plugin = true,
  --
  n = {
    -- cycle through buffers
    ["L"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["H"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        if #vim.api.nvim_list_wins() == 1 and string.sub(vim.api.nvim_buf_get_name(0), -10) == "NvimTree_1" then
          vim.cmd [[ q ]]
        else
          require("nvchad.tabufline").close_buffer()
        end
      end,
      "Close buffer",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Find word (cwd)" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Find help" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fc"] = { "<cmd> Telescope git_commits <CR>", "Find commits" },
    ["<leader>fg"] = { "<cmd> Telescope git_status <CR>", "Find Git status" },
    ["<leader>fs"] = { "<cmd> Telescope themes <CR>", "Find scheme" },
    ["<leader>fm"] = { "<cmd> Telescope marks <CR>", "Find bookmarks" },
    ["<leader>fl"] = { "<cmd> Telescope highlights <CR>", "Find highlight groups" },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<C-a>"] = {
      function()
        require("harpoon"):list():append()
      end,
    },
    ["<C-e>"] = {
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
    },
    ["<C-1>"] = {
      function()
        require("harpoon"):list():select(1)
      end,
    },
    ["<C-2>"] = {
      function()
        require("harpoon"):list():select(2)
      end,
    },
    ["<C-3>"] = {
      function()
        require("harpoon"):list():select(3)
      end,
    },
    ["<C-4>"] = {
      function()
        require("harpoon"):list():select(4)
      end,
    },
    ["<C-5>"] = {
      function()
        require("harpoon"):list():select(5)
      end,
    },
    ["<C-6>"] = {
      function()
        require("harpoon"):list():select(6)
      end,
    },
    ["<C-7>"] = {
      function()
        require("harpoon"):list():select(7)
      end,
    },
    ["<C-8>"] = {
      function()
        require("harpoon"):list():select(8)
      end,
    },
    ["<C-9>"] = {
      function()
        require("harpoon"):list():select(9)
      end,
    },
    ["<C-0>"] = {
      function()
        require("harpoon"):list():select(0)
      end,
    },
  },
}

local diagnostic_status = true
local toggle_diagnostics = function()
  diagnostic_status = not diagnostic_status
  if diagnostic_status then
    vim.api.nvim_echo({ { "Show diagnostics" } }, false, {})
    vim.diagnostic.enable()
  else
    vim.api.nvim_echo({ { "Hide diagnostics" } }, false, {})
    vim.diagnostic.disable()
  end
end

M.lspconfig = {
  plugin = true,
  n = {
    ["gr"] = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "Goto References",
    },

    ["gi"] = {
      function()
        require("telescope.builtin").lsp_implementations()
      end,
      "Goto Implementation",
    },

    ["gd"] = {
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      "Goto Definition",
    },

    ["T"] = {
      function()
        require("telescope.builtin").lsp_type_definitions()
      end,
      "Goto Type Definition",
    },

    ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "LSP Hover" },

    ["<C-S-K>"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "Signature Documentation",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "Go to previous diagnostic message",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "Go to next diagnostic message",
    },

    ["<leader>ld"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "Open diagnostic message",
    },

    ["<leader>lD"] = { toggle_diagnostics, "Toggle Diagnostics" },

    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "Open floating diagnostic message",
    },

    ["<leader>rn"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP Rename",
    },

    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code Action",
    },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["."] = {
      function()
        require("nvim-tree.api").tree.change_root_to_node()
      end,
      "Set Tree CWD",
    },
    ["?"] = {
      function()
        require("nvim-tree.api").tree.toggle_help()
      end,
      "Toggle Help",
    },
  },
}

return M
