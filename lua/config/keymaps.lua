vim.keymap.set('n', '<leader>bd', ':bd!<cr>', {desc = "Close current buffer" })
vim.keymap.set('v', '>', '>gv', { desc = "after tab in re-select the same"})
vim.keymap.set('v', '<', '<gv', { desc = "after tab out re-select the same"})

vim.keymap.set('n', 'n', 'nzzzv', { desc = "goes to the next result on the seach and put the cursor in the middle"})
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Goes to the prev result on the seach and put the cursor in the middle"})

-- Navigate vim panes better
vim.keymap.set('n', '<m-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<m-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<m-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<m-l>', ':wincmd l<CR>')

-- Navigate tabs
vim.keymap.set('n', '<m-]>', ':bnext<CR>')
vim.keymap.set('n', '<m-[>', ':bprevious<CR>')
