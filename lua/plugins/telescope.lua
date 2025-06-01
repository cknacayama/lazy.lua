return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        cmd = "Telescope",
        keys = {
            "<leader>pf",
            "<leader>ps",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                extensions = {
                    fzf = {},
                },
            })

            telescope.load_extension("fzf")

            vim.keymap.set("n", "<leader>pf", builtin.find_files)
            vim.keymap.set("n", "<leader>ps", builtin.live_grep)
            vim.keymap.set("n", "<leader>pb", builtin.buffers)
            vim.keymap.set("n", "<leader>pn", function()
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end)
            vim.keymap.set("n", "<space>pa", function()
                ---@diagnostic disable-next-line: param-type-mismatch
                builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
            end)
            vim.keymap.set("n", "<leader>vh", builtin.help_tags)
        end,
    },
}
