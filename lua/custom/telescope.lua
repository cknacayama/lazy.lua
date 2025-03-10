local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
    extensions = {
        fzf = {}
    }
})

telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>pf", builtin.find_files)
vim.keymap.set("n", "<leader>ps", builtin.live_grep)
vim.keymap.set("n", "<leader>vh", builtin.help_tags)
