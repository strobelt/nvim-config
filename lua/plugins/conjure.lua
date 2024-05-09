-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  nvim.g["conjure#mapping#doc_word"] = "K"
  nvim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
  nvim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  nvim.g["conjure#filetypes"] = {"clojure", "fennel", "janet", "hy", "julia", "racket", "scheme", "lua", "lisp", "python"}
  nvim.g["conjure#client#clojure#nrepl#test#current_form_names"] = {"deftest", "defflow", "defspec", "describe"}
  return nvim.set_keymap("n", "<leader>H", "<Cmd>!open https:\\/\\/github.com\\/Olical\\/conjure\\/blob\\/master\\/doc\\/conjure-client-clojure-nrepl.txt\\#L30<CR>", {noremap = true})
end
return {{"Olical/conjure", lazy = true, init = _2_}}
