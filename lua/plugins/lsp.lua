return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        dependencies = {
            -- "saghen/blink.cmp",
        },
        config = function()
            vim.lsp.config("*", {
                capabilities = {
                    textDocument = {
                        completion = {
                            completionItem = {
                                snippetSupport = true,
                                commitCharactersSupport = false, -- todo:
                                documentationFormat = { "markdown", "plaintext" },
                                deprecatedSupport = true,
                                preselectSupport = false, -- todo:
                                tagSupport = { valueSet = { 1 } }, -- deprecated
                                insertReplaceSupport = true, -- todo:
                                resolveSupport = {
                                    properties = {
                                        "documentation",
                                        "detail",
                                        "additionalTextEdits",
                                        "command",
                                        "data",
                                        -- todo: support more properties? should test if it improves latency
                                    },
                                },
                                insertTextModeSupport = {
                                    -- todo: support adjustIndentation
                                    valueSet = { 1 }, -- asIs
                                },
                                labelDetailsSupport = true,
                            },
                            completionList = {
                                itemDefaults = {
                                    "commitCharacters",
                                    "editRange",
                                    "insertTextFormat",
                                    "insertTextMode",
                                    "data",
                                },
                            },

                            contextSupport = true,
                            insertTextMode = 1, -- asIs
                        },
                    },
                },
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = { buffer = args.buf, remap = false }

                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gf", vim.diagnostic.open_float, opts)
                    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
                end,
            })

            vim.lsp.enable({
                "ts_ls",
                "bashls",
                "nushell",
                "pyright",
                "rust_analyzer",
                "clangd",
                "lua_ls",
                "mlir_lsp_server",
            })

            vim.lsp.config("clangd", {
                cmd = { "clangd-21", "--header-insertion=never" },
                filetypes = { "c", "cpp" },
            })
            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        cargo = {
                            targetDir = true,
                        },
                    },
                },
            })
            vim.lsp.config("lua_ls", {
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if
                            path ~= vim.fn.stdpath("config")
                            and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                        then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                        runtime = {
                            version = "LuaJIT",
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                "${3rd}/luv/library",
                            },
                        },
                    })
                end,
                settings = {
                    Lua = {},
                },
            })

            vim.diagnostic.config({
                virtual_text = true,
                severity_sort = true,
            })
            vim.lsp.set_log_level("ERROR")
        end,
    },
}
