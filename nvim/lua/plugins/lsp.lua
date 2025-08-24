return {
    -- Mason and Mason-LSPConfig
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"},
        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = {"pyright", "lua_ls"},
            })
        end,
    },

    -- completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-nvim-lsp'},
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                },
                mapping = cmp.mapping.preset.insert({
                    -- Navigate between completion items
                    ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                    ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

                    -- `Enter` key to confirm completion
                    ['<CR>'] = cmp.mapping.confirm({select = false}),

                    -- Ctrl+Space to trigger completion menu
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                snippet = {
                    expand = function(args)
                      vim.snippet.expand(args.body)
                    end,
                }
            })
        end,
        event = "InsertEnter",
        cmd = "CmpStatus",
    },

    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre", -- or ft = { "lua", "python" } for specific filetypes
        config = function()
            -- lua
            require("lspconfig").lua_ls.setup({})
            vim.lsp.enable("lua_ls")

            -- python
            require('lspconfig').pyright.setup {
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { '*' },
                        },
                    },
                },
            }
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end
                    if client.name == 'ruff' then
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end
                end,
                desc = 'LSP: Disable hover capability from Ruff',
            })
            require("lspconfig").ruff.setup({
                init_options = {
                    settings = {
                        lint = { select = {"ALL"} }
                    }
                }
            })
            vim.lsp.enable("ruff")
        end,
    }
}
