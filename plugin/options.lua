local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd

opt.guicursor = 'n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20'

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.isfname:append('@-@')

opt.updatetime = 50

opt.showmode = false
opt.showcmd = false

opt.splitright = true
opt.splitbelow = true
opt.signcolumn = 'no'

opt.cmdheight = 1

autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end,
})

vim.g.c_syntax_for_h = true

vim.g.netrw_banner = false

vim.filetype.add({
    extension = {
        ken = 'ken',
        i = 'c',
        mips = 'mips',
        ll = 'llvm',
        cl = 'cool',
        pro = 'prolog',
        vert = 'glsl',
        geom = 'glsl',
        frag = 'glsl'
    }
})
