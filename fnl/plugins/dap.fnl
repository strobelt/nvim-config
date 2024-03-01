(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local notify (autoload :nfnl.notify))

[{1 :nvim-telescope/telescope-dap.nvim
  :dependencies [:theHamsta/nvim-dap-virtual-text
                 :mfussenegger/nvim-dap
                 :nvim-telescope/telescope.nvim
                 :nvim-treesitter/nvim-treesitter]
  :init (fn [] 
          (let [dap (require :dap)
                dap-virtual-text (require :nvim-dap-virtual-text)
                widgets (require :dap.ui.widgets)]
            (dap-virtual-text.setup {:virt_text_pos "eol"})
            (set dap.defaults.fallback.terminal_win_cmd "belowright 10sp new")
            (nvim.set_keymap :n :<localleader>c "" {:callback (fn [] (dap.continue)) :noremap true})
            (nvim.set_keymap :n :<localleader>st "" {:callback (fn [] (dap.step_over)) :noremap true})
            (nvim.set_keymap :n :<localleader>si "" {:callback (fn [] (dap.step_into)) :noremap true})
            (nvim.set_keymap :n :<localleader>so "" {:callback (fn [] (dap.step_out)) :noremap true})
            (nvim.set_keymap :n :<localleader>b "" {:callback (fn [] (dap.toggle_breakpoint)) :noremap true})
            (nvim.set_keymap :n :<localleader>dr "" {:callback (fn [] (dap.repl.open)) :noremap true})
            (nvim.set_keymap :n :<localleader>dh "" {:callback (fn [] (widgets.hover)) :noremap true})
            (nvim.set_keymap :n :<localleader>dp "" {:callback (fn [] (widgets.preview)) :noremap true})
            (nvim.set_keymap :n :<localleader>df "" {:callback (fn [] (widgets.centered_float widgets.frames)) :noremap true})
            (nvim.set_keymap :n :<localleader>ds "" {:callback (fn [] (widgets.centered_float widgets.scopes)) :noremap true})
            (nvim.set_keymap :n :<localleader>T "" {:callback (fn [] (dap.terminate)) :noremap true})))}]
