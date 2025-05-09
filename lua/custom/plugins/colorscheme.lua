return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "main",
                extend_background_behind_borders = false,

                styles = {
                    italic = false,
                    transparency = true,
                },

                groups = {
                    border = "overlay",
                },

                highlight_groups = {
                    Directory = { fg = "foam" },
                    SnippetTabstop = { inherit = false },
                    ["@punctuation"] = { fg = "muted" },
                    ["@constant.macro"] = { fg = "iris" },
                    ["@punctuation.delimiter"] = { fg = "muted" },
                    ["@punctuation.bracket"] = { fg = "muted" },
                },
            })

            vim.cmd.colorscheme("rose-pine")
        end,
    },
}
