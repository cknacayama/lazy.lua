vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

vim.filetype.add({
    extension = {
        i = "c",
        h = "c",
        mips = "mips",
        ll = "llvm",
        cl = "cool",
        vert = "glsl",
        geom = "glsl",
        frag = "glsl"
    }
})
