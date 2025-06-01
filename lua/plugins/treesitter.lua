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
                    url = "https://github.com/cknacayama/tree-sitter-isa.git",
                    files = { "src/parser.c" },
                    branch = "main",
                    generate_requires_npm = false,
                    requires_generate_from_grammar = false,
                },
            }
        end,
    },
}
