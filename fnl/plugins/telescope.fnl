(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-telescope/telescope-file-browser.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :init (fn []
          (let [telescope (require :telescope)
                builtin (require :telescope.builtin)]
          (nvim.set_keymap :n :<leader>ff "" {:callback (fn [] (builtin.find_files)) :noremap true})
          (nvim.set_keymap :n :<leader>fg "" {:callback (fn [] (builtin.live_grep)) :noremap true})
          (nvim.set_keymap :n :<leader>fb "" {:callback (fn [] (builtin.buffers)) :noremap true})
          (nvim.set_keymap :n :<leader>fh "" {:callback (fn [] (builtin.help_tags)) :noremap true})
          (nvim.set_keymap :n :<leader>fB "" {:callback (fn [] (telescope.extensions.file_browser.file_browser)) :noremap true})))
  :config (fn []
            (let [telescope (require :telescope)
                  themes (require :telescope.themes)]
              (telescope.setup {:defaults {:vimgrep_arguments ["rg"
                                                               "--color=never"
                                                               "--no-heading"
                                                               "--with-filename"
                                                               "--line-number"
                                                               "--column"
                                                               "--smart-case"
                                                               "--iglob"
                                                               "!.git"
                                                               "--iglob"
                                                               "!node_modules"
                                                               "--hidden"]}
                                :extensions {:ui-select {1 (themes.get_dropdown {})}}
                                :pickers {:find_files {:find_command ["rg"
                                                                      "--files"
                                                                      "--iglob"
                                                                      "!.git"
                                                                      "--iglob"
                                                                      "!node_modules"
                                                                      "--hidden"]}}})
              (telescope.load_extension "ui-select")))}]
