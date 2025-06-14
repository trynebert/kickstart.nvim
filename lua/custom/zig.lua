-- ~/.config/nvim/lua/custom/init.lua

-- Terminal keymaps
vim.keymap.set('n', '<leader>tt', function()
  vim.cmd 'split term://$SHELL'
  vim.cmd 'resize 15'
  vim.cmd 'startinsert'
end, { desc = '[T]erminal [T]oggle' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>:q<CR>', { desc = 'Exit and Close Terminal' })
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>:q<CR>', { desc = 'Close Terminal' })

-- Zig build/test/run helpers
local zig_term_bufnr = nil
local function run_zig_cmd(cmd)
  if zig_term_bufnr == nil or not vim.api.nvim_buf_is_valid(zig_term_bufnr) then
    vim.cmd 'split | terminal'
    vim.cmd 'resize 15'
    zig_term_bufnr = vim.api.nvim_get_current_buf()
  else
    vim.cmd 'split'
    vim.api.nvim_win_set_buf(0, zig_term_bufnr)
  end
  vim.fn.chansend(vim.b.terminal_job_id, cmd .. '\n')
  vim.cmd 'startinsert'
end

vim.keymap.set('n', '<leader>zr', function()
  run_zig_cmd 'zig build run'
end, { desc = '[Z]ig Build [R]un' })

vim.keymap.set('n', '<leader>zt', function()
  run_zig_cmd 'zig build test'
end, { desc = '[Z]ig Build [T]est' })

vim.keymap.set('n', '<leader>zb', function()
  run_zig_cmd 'zig build'
end, { desc = '[Z]ig [B]uild' })
