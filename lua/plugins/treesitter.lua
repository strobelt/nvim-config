-- [nfnl] fnl/plugins/treesitter.fnl
local function _1_()
  local treesitter = require("nvim-treesitter.configs")
  return treesitter.setup({highlight = {enable = true}, indent = {enable = true}, ensure_installed = {"bash", "beancount", "c_sharp", "clojure", "commonlisp", "dockerfile", "fennel", "html", "java", "javascript", "json", "rust", "toml", "lua", "markdown", "yaml"}})
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = _1_}}
