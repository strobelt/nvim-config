-- [nfnl] fnl/plugins/easyalign.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local nvim = autoload("nvim")
local function _2_()
  nvim.set_keymap("x", "ga", "<Plug>(EasyAlign)", {noremap = true})
  return nvim.set_keymap("n", "ga", "<Plug>(EasyAlign)", {noremap = true})
end
return {{"junegunn/vim-easy-align", init = _2_}}
