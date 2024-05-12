-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local function _2_()
  local telescope = require("telescope")
  local builtin = require("telescope.builtin")
  local function _3_()
    return builtin.find_files()
  end
  nvim.set_keymap("n", "<leader>ff", "", {callback = _3_, noremap = true})
  local function _4_()
    return builtin.live_grep()
  end
  nvim.set_keymap("n", "<leader>fg", "", {callback = _4_, noremap = true})
  local function _5_()
    return builtin.buffers()
  end
  nvim.set_keymap("n", "<leader>fb", "", {callback = _5_, noremap = true})
  local function _6_()
    return builtin.help_tags()
  end
  nvim.set_keymap("n", "<leader>fh", "", {callback = _6_, noremap = true})
  local function _7_()
    return telescope.extensions.file_browser.file_browser()
  end
  return nvim.set_keymap("n", "<leader>fB", "", {callback = _7_, noremap = true})
end
local function _8_()
  local telescope = require("telescope")
  local themes = require("telescope.themes")
  telescope.setup({defaults = {vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--iglob", "!.git", "--iglob", "!node_modules", "--iglob", "!.clj-kondo", "--iglob", "!.lsp", "--hidden"}}, extensions = {["ui-select"] = {themes.get_dropdown({})}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git", "--iglob", "!node_modules", "--iglob", "!.clj-kondo", "--iglob", "!.lsp", "--hidden"}}}})
  return telescope.load_extension("ui-select")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {"nvim-telescope/telescope-ui-select.nvim", "nvim-telescope/telescope-file-browser.nvim", "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}, init = _2_, config = _8_}}
