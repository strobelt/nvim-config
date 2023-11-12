(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

(nvim.set_keymap :n :<space> :<nop> {:noremap true})

(let [options
      {:expandtab true
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       :completeopt "menuone,noselect"
       :ignorecase true
       :smartcase true
       :clipboard "unnamedplus"
       :number true
       :ruler true
       :signcolumn "number"}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

{}
