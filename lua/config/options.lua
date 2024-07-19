-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h17"
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end

-- 打开换行显示
vim.opt.wrap = true
-- 打开断行检测
vim.opt.linebreak = true
vim.opt.showbreak = "↪ "
vim.opt.expandtab = true -- 用空格替代 Tab
vim.opt.scrolloff = 15

vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = '#ffcc99', bold = true })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = '#ffcc99', bold = true })

-- Function to set the current working directory to the parent directory of the opened file
local function set_cwd_to_parent_dir()
  local bufname = vim.fn.expand('%:p')
  if bufname == '' then return end
  if bufname:find('term') then return end -- toggle term
  local parent_dir = vim.fn.fnamemodify(bufname, ':h')
  if parent_dir ~= '' then
    vim.cmd('cd ' .. parent_dir)
  end
end

-- Create an autocommand group to avoid duplication
vim.api.nvim_create_augroup('AutoCwd', { clear = true })

-- Set the working directory when opening a file or switching buffers
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  group = 'AutoCwd',
  pattern = '*',
  callback = set_cwd_to_parent_dir,
})
