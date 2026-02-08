[{1 :saghen/blink.compat
  :version "*"
  :lazy true}

 {1 :saghen/blink.cmp
  :dependencies [:rafamadriz/friendly-snippets
                 :PaterJason/cmp-conjure
                 :mikavilpas/blink-ripgrep.nvim
                 :L3MON4D3/LuaSnip]
  :build "cargo build --release"

  :opts {:keymap {:preset :enter
                  :<S-Tab> [:select_prev :fallback]
                  :<Tab> [:select_next :fallback]}

         :completion {:ghost_text {:enabled true}
                      :documentation {:auto_show false}
                      :list {:selection {:preselect true}}
                      :menu {:auto_show false
                             :draw {:columns [[:kind_icon]
                                              {1 :label
                                               2 :label_description
                                               :gap 3}
                                              [:source_name]]}}}

         :appearance {:use_nvim_cmp_as_default true
                      :nerd_font_variant :mono}

         :fuzzy {:implementation "prefer_rust"}

         :sources {:default [:lsp :path :snippets :buffer :ripgrep :beancount]
                   :providers {:ripgrep  {:module :blink-ripgrep
                                          :name :Ripgrep
                                          :score_offset -3}
                               :beancount {:name :beancount
                                           :module :beancount.completion.blink
                                           :score_offset -100
                                           :opts {:trigger_characters [":" "#" "^" " "]}}}}}}]
