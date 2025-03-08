local opt = vim.opt

opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

opt.inccommand = "split"

opt.smartcase = true
opt.ignorecase = true

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.isfname:append('@-@')

opt.showmode = false
opt.showcmd = false

opt.splitright = true
opt.splitbelow = true
opt.signcolumn = "no"

opt.cmdheight = 1

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

vim.g.netrw_banner = false

vim.filetype.add({
    extension = {
        i = "c",
        mips = "mips",
        ll = "llvm",
        cl = "cool",
        vert = "glsl",
        geom = "glsl",
        frag = "glsl"
    }
})
