return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    opts = {
        indent = {
            char = "│",
            tab_char = "│",
        },
        scope = { enabled = false },
        exclude = {
            filetypes = {
                "help",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
            },
        },
    },
    main = "ibl",
}
