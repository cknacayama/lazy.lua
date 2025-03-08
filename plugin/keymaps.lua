-- most of these were taken from ThePrimeagen

local set = vim.keymap.set

set("n", "<leader>pv", vim.cmd.Ex)

set("n", "<C-d>", [[<C-d>zz]])
set("n", "<C-u>", [[<C-u>zz]])

set("n", "n", [[nzzzv]])
set("n", "N", [[Nzzzv]])

set("v", "J", [[:m '>+1<CR>gv=gv]])
set("v", "K", [[:m '<-2<CR>gv=gv]])

set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

set("n", "<leader><leader>", vim.cmd.so)

set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])
set("n", "<leader>v", [["+p]])

set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")
