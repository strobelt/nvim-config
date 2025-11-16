(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :junegunn/vim-easy-align
  :init (fn []
          (nvim.set_keymap :x :ga "<Plug>(EasyAlign)" {:noremap true})
          (nvim.set_keymap :n :ga "<Plug>(EasyAlign)" {:noremap true}))}]
