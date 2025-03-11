return {
    {
        dir = "~/plugins/present.nvim",
        cmd = "Present",
        config = function()
            require("present").setup()
        end,
    },
}
