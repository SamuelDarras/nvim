local M = {}

local default_mappings = {
    { 'n',               '<Esc>',      '<cmd>nohlsearch<CR>',                   { noremap = true } },
    { 'n',               '<leader>o',  '<cmd>update<CR><cmd>source<CR>',        { noremap = true } },
    { 'i',               'jj',         '<Esc>',                                 { noremap = true } },
    { { 'v', 'n', 'x' }, '<leader>y',  '"+y',                                   { desc = 'Yank to system clipboard', noremap = true } },
    { { 'v', 'n', 'x' }, '<leader>d',  '"+d',                                   { desc = 'Delete to system clipboard', noremap = true } },
    { 'n',               '<leader>lf', vim.lsp.buf.format,                      { desc = 'Format buffer', noremap = true } },
    { 'n',               'gD',         vim.lsp.buf.declaration,                 { desc = 'Goto declaration', noremap = true } },
    { 'n',               'gd',         vim.lsp.buf.definition,                  { desc = 'Goto definition', noremap = true } },
    { 'n',               'gu',         vim.lsp.buf.references,                  { desc = 'Goto definition', noremap = true } },
    { 'n',               '<leader>e',  vim.diagnostic.open_float,               { desc = 'Goto definition', noremap = true } },
    { 'n',               '<leader>x',  '<cmd>write<CR><cmd>mks!<CR><cmd>q<CR>', { desc = 'Save and make session', noremap = true } },
}

function M.setup(additional)
    additional = additional or {}

    vim.g.mapleader = ' '

    vim.list_extend(default_mappings, additional)

    for _, mapping in pairs(default_mappings) do
        vim.keymap.set(unpack(mapping))
    end
end

return M
