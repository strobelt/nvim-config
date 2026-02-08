-- [nfnl] fnl/plugins/beancount.fnl
local function _1_()
  local beancount = require("beancount")
  return beancount.setup({})
end
return {{"hxueh/beancount.nvim", lazy = true, ft = {"beancount"}, config = _1_}}
