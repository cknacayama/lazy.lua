local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local lspconfig = require("lspconfig")
local lspconfig_defaults = lspconfig.util.default_config

lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "snippets" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf, remap = false }
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "gf", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end,
        })
    end
})

mason.setup({})
mason_lspconfig.setup({
    ensure_installed = { "lua_ls" },
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({})
        end,
        lua_ls = function()
            lspconfig.lua_ls.setup {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                            }
                        }
                    })
                end,
                settings = {
                    Lua = {}
                }
            }
        end
    },
})

lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({
    cmd = { "clangd-21", "--header-insertion=never" }
})

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
})
