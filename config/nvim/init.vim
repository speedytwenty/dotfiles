lua <<EOF
--local _nvim_p=os.getenv('NVIM_PROFILE')
local _nvim_p='legacy'
 
if _nvim_p == 'lazy' then
  -- https://stackoverflow.com/a/74832206/293279
  -- bootstrap lazy.nvim, LazyVim and your plugins
  vim.api.nvim_command('set runtimepath^=~/.LazyVim')
  vim.api.nvim_command('let &packpath = &runtimepath')
  require("config.lazy")
  local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
  end
  
  vim.api.nvim_create_autocmd("VimEnter", {
    group = augroup("autoupdate"),
    callback = function()
      if require("lazy.status").has_updates then
        require("lazy").update({ show = false, })
      end
    end,
  })
elseif _nvim_p == 'craftzdog' then
  if vim.loader then
    vim.loader.enable()
  end
  vim.api.nvim_command('set runtimepath^=~/.config/nvim/profiles/craftzdog')
  vim.api.nvim_command('let &packpath = &runtimepath')
  require("config.lazy")
elseif _nvim_p == 'twenty' then
  if vim.loader then
    vim.loader.enable()
  end
  vim.api.nvim_command('let my_active_profile="twenty"')
  vim.api.nvim_command('set runtimepath^=~/.config/nvim/profiles/twenty')
  vim.api.nvim_command('let &packpath = &runtimepath')
  vim.lsp.disable("denols")
  require("config.lazy")
elseif _nvim_p == 'legacy' then
  vim.api.nvim_command('source ~/.config/nvim/profiles/legacy/config.legacy')
end
--Disable autoformat https://github.com/LazyVim/LazyVim/discussions/141
vim.g.autoformat = false -- globally
EOF

source ~/.config/nvim/ide.vim
