return {
    {
        dir = "~/work/plugins/present.nvim",
        cmd = "Present",
        config = function()
            require("present").setup()
        end,
    },
}
