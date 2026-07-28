-- return {
--     cmd = { "FSharpLanguageServer" }
-- }

local util = require 'lspconfig.util'

---@type vim.lsp.Config
return {
  cmd = { 'fsharp-language-server' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    on_dir(util.root_pattern('*.sln', '*.fsproj', '.git')(fname))
  end,
  filetypes = { 'fsharp' },
  init_options = {
    AutomaticWorkspaceInit = true,
  },
  settings = {},
}
