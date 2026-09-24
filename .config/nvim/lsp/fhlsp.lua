



---@type vim.lsp.Config
return {
  cmd = { 'futhark', 'lsp' },
  filetypes = { 'futhark', 'fut' },
  root_markers = { '.git' },
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}

