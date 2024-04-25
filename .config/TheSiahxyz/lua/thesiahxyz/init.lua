require("thesiahxyz.core.autocmds")
require("thesiahxyz.core.keymaps")
require("thesiahxyz.core.options")
require("thesiahxyz.core.lazy")

vim.cmd("let g:netrw_liststyle = 0")
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Plenary
function R(name)
    require("plenary.reload").reload_module(name)
end

-- Word Definition
function WordDefinition(input)
    -- Use visual selection if input is empty
    if input == "" then
        input = vim.fn.getreg(vim.fn.visualmode(), 1, 1)
    end

    local escaped_input = vim.fn.shellescape({input})

    -- Run dict command and store output
    local output = vim.fn.system("dict " .. escaped_input)

    -- Open a new buffer for output or use an existing buffer
    local bufnr = vim.api.nvim_create_buf(false, true)  -- create a new buffer
    vim.api.nvim_set_current_buf(bufnr)  -- switch to the new buffer
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(output, "\n"))  -- set buffer lines

    -- Set buffer to be non-editable and mark it as unmodified
    vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
    vim.api.nvim_buf_set_option(bufnr, 'modified', false)
end

-- Source shortcuts from bm-files and bm-folders
local shortcuts_file = vim.fn.expand("~/.config/nvim/shortcuts.lua")
local file = io.open(shortcuts_file, "r")
if file then
    file:close() -- It's important to close the file after opening it.
    vim.cmd("silent! source " .. shortcuts_file)
end
