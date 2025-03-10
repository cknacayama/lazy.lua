return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        branch = "0.1.x",
        config = function()
            require("custom.telescope")
        end,
        cmd = "Telescope",
        keys = { "<leader>pf" },
    },
}
