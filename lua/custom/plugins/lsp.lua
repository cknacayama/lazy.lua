return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        dependencies = {
            -- "saghen/blink.cmp",
        },
        config = function()
            require("custom.lsp")
        end,
    },
}
