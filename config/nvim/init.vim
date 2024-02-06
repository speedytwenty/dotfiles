lua <<EOF
--local _nvim_p=os.getenv('NVIM_PROFILE')
local _nvim_p='lazy'

if _nvim_p == 'lazy' then
  -- https://stackoverflow.com/a/74832206/293279
  -- bootstrap lazy.nvim, LazyVim and your plugins
  vim.api.nvim_command('set runtimepath^=~/.config/nvim/profiles/lazy')
  vim.api.nvim_command('let &packpath = &runtimepath')
  require("config.lazy")
elseif _nvim_p == 'craftzdog' then
  if vim.loader then
    vim.loader.enable()
  end
  vim.api.nvim_command('set runtimepath^=~/.config/nvim/profiles/craftzdog')
  vim.api.nvim_command('let &packpath = &runtimepath')
  require("config.lazy")
end
EOF

source ~/.config/nvim/ide.vim
