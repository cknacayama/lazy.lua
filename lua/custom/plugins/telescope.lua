return {
    "nvim-lua/plenary.nvim",
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        branch = "0.1.x",
        config = function()
            require("custom.telescope")
        end,
    },
}
