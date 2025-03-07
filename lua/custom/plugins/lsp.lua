return { {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
        -- LSP Support
        "neovim/nvim-lspconfig",             -- Required
        "williamboman/mason.nvim",           -- Optional
        "williamboman/mason-lspconfig.nvim", -- Optional

        -- Autocompletion
        "hrsh7th/nvim-cmp",     -- Required
        "hrsh7th/cmp-nvim-lsp", -- Required
        "L3MON4D3/LuaSnip",     -- Required
    },
    config = function()
        require("custom.lsp")
    end
}, }
