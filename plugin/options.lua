local opt = vim.opt

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
