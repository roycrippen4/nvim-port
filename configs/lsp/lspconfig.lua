local utils = require('core.utils')
local M = {}

M.on_attach = function(_, bufnr)
  utils.load_mappings('lspconfig', { buffer = bufnr })
end

-- require('which-key').register({
--   ['<leader>a'] = { name = 'Autosave', _ = 'which_key_ignore' },
--   ['<leader>d'] = { name = 'Debug', _ = 'which_key_ignore' },
--   ['<leader>ds'] = { name = 'Step', _ = 'which_key_ignore' },
--   ['<leader>f'] = { name = 'Find', _ = 'which_key_ignore' },
--   ['<leader>l'] = { name = 'LSP', _ = 'which_key_ignore' },
--   -- markdown preview
--   ['<leader>m'] = { name = 'Markdown Preview', _ = 'which_key_ignore' },
--   ['<leader>mt'] = { name = 'Toggle Markdown Preview', _ = 'which_key_ignore' },
--   ['<leader>mp'] = { name = 'Start Markdown Preview', _ = 'which_key_ignore' },
--   ['<leader>ms'] = { name = 'Stop Markdown Preview', _ = 'which_key_ignore' },
--
--   ['<leader>t'] = { name = 'Trouble', _ = 'which_key_ignore' },
--   ['<leader>w'] = { name = 'Lookup Keymaps', _ = 'which_key_ignore' },
--   ['<leader>z'] = { name = 'Zen', _ = 'which_key_ignore' },
--   ['<Leader>dc'] = { name = 'Continue', _ = 'which_key_ignore' },
--   ['<Leader>dsv'] = { name = 'Step over', _ = 'which_key_ignore' },
--   ['<Leader>dsi'] = { name = 'Step into', _ = 'which_key_ignore' },
--   ['<Leader>dso'] = { name = 'Step out', _ = 'which_key_ignore' },
--   ['<Leader>db'] = { name = 'Toggle breakpoint', _ = 'which_key_ignore' },
--   ['<Leader>dB'] = { name = 'Set breakpoint', _ = 'which_key_ignore' },
--   ['<Leader>dr'] = { name = 'Repl Open', _ = 'which_key_ignore' },
--   ['<Leader>dl'] = { name = 'Run Last', _ = 'which_key_ignore' },
--   ['<Leader>dh'] = { name = 'Hover', _ = 'which_key_ignore' },
--   ['<Leader>dv'] = { name = 'Preview', _ = 'which_key_ignore' },
--   ['<Leader>df'] = { name = 'Show frames', _ = 'which_key_ignore' },
--   ['<Leader>ds'] = { name = 'Show scopes', _ = 'which_key_ignore' },
--   ['<Leader>dt'] = { name = 'Toggle Debug UI', _ = 'which_key_ignore' },
--   ['<Leader>dp'] = { name = 'Toggle Log Point', _ = 'which_key_ignore' },
-- })

local cwd = vim.fn.getcwd(-1, -1)
if cwd ~= nil then
  if string.sub(cwd, -4) then
    require('neodev').setup({})
  end
end

vim.lsp.protocol.CompletionItemKind = {
  '   (Text) ',
  '   (Method)',
  '   (Function)',
  '   (Constructor)',
  ' ﴲ  (Field)',
  '[] (Variable)',
  '   (Class)',
  ' ﰮ  (Interface)',
  '   (Module)',
  ' 襁 (Property)',
  '   (Unit)',
  '   (Value)',
  ' 練 (Enum)',
  '   (Keyword)',
  '   (Snippet)',
  '   (Color)',
  '   (File)',
  '   (Reference)',
  '   (Folder)',
  '   (EnumMember)',
  ' ﲀ  (Constant)',
  ' ﳤ  (Struct)',
  '   (Event)',
  '   (Operator)',
  '   (TypeParameter)',
}

return M
