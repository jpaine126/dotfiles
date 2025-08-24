
return {
    "neovim/nvim-lspconfig",
    event = "BufReadPre", -- or ft = { "lua", "python" } for specific filetypes
    config = function()
        require("lspconfig").lua_ls.setup({}) -- Example for Lua LSP
        require("lspconfig").ruff.setup({
            init_options = {
                settings = {
                    lint = { select = {"ALL"} }
                }
            }
        })
        vim.lsp.enable("ruff")
        -- ... other LSP server setups
    end,
}
