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
opt.isfname:append("@-@")

opt.showmode = false

opt.splitright = true
opt.splitbelow = true
opt.signcolumn = "no"

opt.cmdheight = 1
