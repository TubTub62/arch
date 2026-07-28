local ts = require('nvim-treesitter')

-- Wait at most 30 seconds to finish installation.
ts.install(
  {
      'elixir', 'haskell',
    'lua', 'vim', 
    'markdown', 'markdown_inline',
    'json', 'yaml',
  },
  -- Do not print summary, as this will run at startup always, all the time.
  { summary = false }
):wait(30000)


---@type fun(args: vim.api.keyset.create_autocmd.callback_args): boolean?
local install_parser_and_enable_features = function(event)
  local lang = event.match
  
  -- Check if a parser is available for this language
  local has_parser = pcall(vim.treesitter.language.get_lang, lang)
  if not has_parser then
    -- No parser configuration available, skip silently
    return
  end
  
  -- Check if parser is already installed by trying to load it
  local parser_installed = pcall(vim.treesitter.get_parser, event.buf, lang)
  
  if not parser_installed then
    -- Try to install the parser
    local ok, task = pcall(ts.install, { lang }, { summary = false })
    if not ok then return end
    -- Wait for the installation to finish (up to 10 seconds).
    task:wait(10000)
  end
  
  -- Try to start treesitter for this buffer
  local ok = pcall(vim.treesitter.start, event.buf, lang)
  if ok then
    -- Enable indentation based on treesitter for the buffer.
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    -- Enable folding based on treesitter for the buffer.
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  end
end

--Install missing parsers on file open.
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('ui.treesitter', { clear = true }),
  pattern = { '*' },
  callback = install_parser_and_enable_features
})
