(local {: autoload} (require :nfnl.module))
(local str (autoload :nfnl.string))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))

(nvim.set_keymap :n :<space> :<nop> {:noremap true})

(nvim.ex.autocmd "FocusGained,BufEnter" "*" ":checktime")

;clear highlighting on enter in normal mode
(nvim.set_keymap :n :<CR> ":noh<CR><CR>" {:noremap true})

(let [options
      {:encoding "utf-8"
       :spelllang "en_us"
       :backspace "2"
       :errorbells true
       :backup false
       :swapfile false
       :showmode false
       :number true
       :ruler true
       :wildmenu true
       :completeopt "menuone,noselect"
       :wildignore "*/tmp/*,*.so,*.swp,*.zip"
       :ignorecase true
       :smartcase true
       :clipboard "unnamedplus"
       :expandtab true
       :tabstop 2
       :shiftwidth 2
       :softtabstop 2
       :undofile true
       :hlsearch true
       :splitbelow true
       :splitright true
       :signcolumn "number"}]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

{}
