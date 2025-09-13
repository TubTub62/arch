
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()


lspconfig.lua_ls.setup({
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = {'vim'} }
        }
    }
        
})





--[[ return {
	cmd = {'lua-language-server'},
	filetypes = {'lua'},
	root_markers = {'.luarc.json', '.luarc.jsonc'},
    settings = {
        Lua = {
            diagnostics = { globals = {'vim'} }
        }
    }
}
]]
