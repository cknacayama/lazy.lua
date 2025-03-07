-- most of these were taken from ThePrimeagen

local set = vim.keymap.set

set('n', '<leader>pv', vim.cmd.Ex)

set('n', 'J', [[mzJ`z]])
set('n', '<C-d>', [[<C-d>zz]])
set('n', '<C-u>', [[<C-u>zz]])
set('t', '<ESC>', [[<C-\><C-n>]])
set('n', '<leader>t', [[<cmd>split | term<CR>]])

set('n', 'n', [[nzzzv]])
set('n', 'N', [[Nzzzv]])

set('v', 'J', [[:m '>+1<CR>gv=gv]])
set('v', 'K', [[:m '<-2<CR>gv=gv]])

set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

set('n', '<leader><leader>', vim.cmd.so)

-- greatest remap ever
set('x', '<leader>p', [['_dP]])

-- next greatest remap ever : asbjornHaland
set({ 'n', 'v' }, '<leader>y', [["+y]])
set('n', '<leader>Y', [["+Y]])
set('n', '<leader>v', [["+p]])

set('n', '<leader>a', [[ggVG]])

-- copy whole file to clipboard
set('n', '<leader>ca', [[ggVG"+y]])

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = [[powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
        ['*'] = [[powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))]],
    },
    cache_enabled = 0,
}
