return {
    {
        "saghen/blink.cmp",
        version = "*",
        event = "InsertEnter",
        opts = {
            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = "mono",
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
    },
}
