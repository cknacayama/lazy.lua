local lspconfig = require("lspconfig")
local lspconfig_defaults = lspconfig.util.default_config

lspconfig_defaults.capabilities =
    vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("blink.cmp").get_lsp_capabilities())

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
                require("conform").format({ bufnr = args.buf, id = client.id })
            end,
        })
    end,
})

lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({
    cmd = { "clangd-21", "--header-insertion=never" },
})

lspconfig.lua_ls.setup({
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
