-- [nfnl] Compiled from fnl/plugins/dap.fnl by https://github.com/Olical/nfnl, do not edit.
local _local_1_ = require("nfnl.module")
local autoload = _local_1_["autoload"]
local nvim = autoload("nvim")
local notify = autoload("nfnl.notify")
local function _2_()
  local dap = require("dap")
  local dap_virtual_text = require("nvim-dap-virtual-text")
  local widgets = require("dap.ui.widgets")
  dap_virtual_text.setup({virt_text_pos = "eol"})
  dap.defaults.fallback.terminal_win_cmd = "belowright 10sp new"
  local function _3_()
    return dap.continue()
  end
  nvim.set_keymap("n", "<localleader>c", "", {callback = _3_, noremap = true})
  local function _4_()
    return dap.step_over()
  end
  nvim.set_keymap("n", "<localleader>st", "", {callback = _4_, noremap = true})
  local function _5_()
    return dap.step_into()
  end
  nvim.set_keymap("n", "<localleader>si", "", {callback = _5_, noremap = true})
  local function _6_()
    return dap.step_out()
  end
  nvim.set_keymap("n", "<localleader>so", "", {callback = _6_, noremap = true})
  local function _7_()
    return dap.toggle_breakpoint()
  end
  nvim.set_keymap("n", "<localleader>b", "", {callback = _7_, noremap = true})
  local function _8_()
    return dap.repl.open()
  end
  nvim.set_keymap("n", "<localleader>dr", "", {callback = _8_, noremap = true})
  local function _9_()
    return widgets.hover()
  end
  nvim.set_keymap("n", "<localleader>dh", "", {callback = _9_, noremap = true})
  local function _10_()
    return widgets.preview()
  end
  nvim.set_keymap("n", "<localleader>dp", "", {callback = _10_, noremap = true})
  local function _11_()
    return widgets.centered_float(widgets.frames)
  end
  nvim.set_keymap("n", "<localleader>df", "", {callback = _11_, noremap = true})
  local function _12_()
    return widgets.centered_float(widgets.scopes)
  end
  nvim.set_keymap("n", "<localleader>ds", "", {callback = _12_, noremap = true})
  local function _13_()
    return dap.terminate()
  end
  return nvim.set_keymap("n", "<localleader>T", "", {callback = _13_, noremap = true})
end
return {{"nvim-telescope/telescope-dap.nvim", dependencies = {"theHamsta/nvim-dap-virtual-text", "mfussenegger/nvim-dap", "nvim-telescope/telescope.nvim", "nvim-treesitter/nvim-treesitter"}, init = _2_}}
