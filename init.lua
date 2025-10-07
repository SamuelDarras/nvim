vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.signcolumn = 'yes'
vim.o.winborder = 'single'
vim.o.scrolloff = 5
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:•'
vim.o.virtualedit = 'block'

require('plugins').setup({
    'https://github.com/EdenEast/nightfox.nvim', -- Colorscheme
    'https://github.com/stevearc/oil.nvim',
    'https://github.com/echasnovski/mini.pick',
    'https://github.com/echasnovski/mini.surround',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/saghen/blink.cmp',  -- Completion
    'https://github.com/j-hui/fidget.nvim', -- Notifications
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/jiaoshijie/undotree',
    'https://github.com/ggandor/leap.nvim',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/chomosuke/typst-preview.nvim',
})
require('autocmds').setup()

local win_config = function()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local col = math.floor((vim.o.columns - width) / 2)

    return {
        anchor = 'NW',
        border = vim.o.winborder,
        height = height,
        width = width,
        row = vim.o.lines,
        col = col,
    }
end
require('mini.pick').setup({
    window = {
        config = win_config
    }
})
require('mini.surround').setup()
require('oil').setup()
require('fidget').setup({})
require('undotree').setup()
require('blink.cmp').setup({
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono',
    },
    fuzzy = { implementation = 'lua' }
})
require('mason').setup()
require('typst-preview').setup()

require('keymaps').setup({
    { 'n', '<leader>f', '<cmd>Pick files<CR>' },
    { 'n', '<leader>b', '<cmd>Pick buffers<CR>' },
    { 'n', '<leader>h', '<cmd>Pick help<CR>' },
    { 'n', '<leader>t', '<cmd>Oil<CR>',             { desc = 'File explorer', noremap = true } },
    { 'n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true } },
    { 'n', '<leader>s', '<Plug>(leap)',             { desc = 'Leap', noremap = true } },
    { 'n', '<leader>S', '<Plug>(leap-anywhere)',    { desc = 'Leap anywhere', noremap = true } },
})

vim.lsp.config['lua_ls'] = {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        }
    }
}

vim.lsp.enable({
    'lua_ls',
    'rust_analyzer',
    'zls',
    'clangd',
})

vim.cmd.colorscheme('duskfox')
vim.cmd('hi statusline guibg=NONE')
