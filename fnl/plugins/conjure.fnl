(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

[{1 :Olical/conjure
  :lazy true
  :init (fn []
          (set nvim.g.conjure#mapping#doc_word "K")
          (set nvim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set nvim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
          (set nvim.g.conjure#filetypes ["clojure" "fennel" "janet" "hy" "julia" "racket" "scheme" "lua" "lisp" "python"])
          (set nvim.g.conjure#client#clojure#nrepl#test#current_form_names ["deftest" "defflow" "defspec" "describe"])
          (nvim.set_keymap :n :<leader>H "<Cmd>!open https:\\/\\/github.com\\/Olical\\/conjure\\/blob\\/master\\/doc\\/conjure-client-clojure-nrepl.txt\\#L30<CR>" {:noremap true})
          )}]
