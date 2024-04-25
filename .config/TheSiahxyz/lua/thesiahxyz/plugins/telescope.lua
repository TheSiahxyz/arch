return {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { 
            "nvim-telescope/telescope-fzf-native.nvim",
            build = vim.fn.executable("make") == 1 and "make"
                or
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            enabled = vim.fn.executable("make") == 1 or vim.fn.executable("cmake") == 1,
            config = function()
                require("telescope").load_extension("fzf")
            end,
        }
    },
    config = function()
        require("telescope").setup({})
        local builtin = require("telescope.builtin")

        -- find
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
        vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
        -- git
        vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
        vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
        -- search
        vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set("n", "<leader>sc", builtin.commands, {})
        vim.keymap.set("n", "<leader>sch", builtin.command_history, {})
        vim.keymap.set("n", "<leader>co", builtin.colorscheme, {})
        vim.keymap.set("n", "<leader>sd", builtin.diagnostics, {})
        vim.keymap.set("n", "<leader>sg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>sG", builtin.grep_string, {})
        vim.keymap.set("n", "<leader>sh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>sk", builtin.keymaps, {})
        vim.keymap.set("n", "<leader>sm", builtin.marks, {})
        vim.keymap.set("n", "<leader>sM", builtin.man_pages, {})
        vim.keymap.set("n", "<leader>so", builtin.vim_options, {})
        vim.keymap.set("n", "<leader>sr", builtin.registers, {})
        -- lsp
        vim.keymap.set("n", "gR", builtin.lsp_references, {})
        vim.keymap.set("n", "gd", builtin.lsp_definitions, {})

        vim.keymap.set("n", "<leader>sw", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set("n", "<leader>sW", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
    end
}
