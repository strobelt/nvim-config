-- [nfnl] Compiled from fnl/config/init.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local str = autoload("nfnl.string")
local nvim = autoload("nvim")
local core = autoload("nfnl.core")
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
nvim.ex.autocmd("FocusGained,BufEnter", "*", ":checktime")
nvim.set_keymap("n", "<CR>", ":noh<CR><CR>", {noremap = true})
do
  local options = {encoding = "utf-8", spelllang = "en_us", backspace = "2", errorbells = true, number = true, ruler = true, wildmenu = true, completeopt = "menuone,noselect", wildignore = "*/tmp/*,*.so,*.swp,*.zip", ignorecase = true, smartcase = true, clipboard = "unnamedplus", expandtab = true, tabstop = 2, shiftwidth = 2, softtabstop = 2, undofile = true, hlsearch = true, splitbelow = true, splitright = true, signcolumn = "number", showmode = false, backup = false, swapfile = false}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
return {}
