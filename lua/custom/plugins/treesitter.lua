return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                sync_install = false,
                auto_install = true,
                highlight = { enable = true },
            })
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.isa = {
                install_info = {
                    url = "~/tree-sitter/tree-sitter-isa",
                    files = { "src/parser.c" },
                    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
                },
            }
        end,
    },
}
