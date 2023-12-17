local present, conform = pcall(require, 'conform')

if not present then
  return
end

 conform.setup({
  quiet = true,
  formatters_by_ft = {
    lua = { 'stylua' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    json = { 'pretter' },
    html = { 'prettier' },
    css = { 'prettier' },
    markdown = { 'prettier' },
    sh = { 'shfmt' },
    yaml = { 'prettier' },
  },
  format_on_save = {
    timeout_ms = 500,
    async = false,
    lsp_fallback = true,
  },
  formatters = {
    shfmt = {
      prepend_args = { '-i', '2' },
    },
  },
})

