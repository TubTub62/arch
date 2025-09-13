--local nvim_lsp = require('lspconfig')
--local util = require('lspconfig.util')

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.hls.setup({
  capabilities = lsp_capabilities,
})




--[[
return {
        cmd = { "haskell-language-server-wrapper", "--lsp" },
        filetypes = { "haskell", "lhaskell", "cabal" },
        root_markers = { "*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml" },
        settings = {
            haskell = {
                formattingProvider = "ormolu",
            },
        },
        on_attach = function(client, bufnr)

            vim.lsp.completion.enable(true, client.id, bufnr, {
                autotrigger = true,
                convert = function(item)
                    return { abbr = item.label:gsub("%b()", "") }
                end,
            })


            -- Basic keymaps
            local bufmap = function(mode, lhs, rhs)
                vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
            end
            bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
            bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
            bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
            bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
        end,
}
]]
