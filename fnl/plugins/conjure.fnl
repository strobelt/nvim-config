[{1 :Olical/conjure
  :init (fn []
          (set vim.g.conjure#mapping#doc_word "K")
          (set vim.g.conjure#client#clojure#nrepl#eval#auto_require false)
          (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)
          (set vim.g.conjure#filetypes ["clojure" "fennel" "janet" "hy" "julia" "racket" "scheme" "lua" "lisp" "python"])
          (set vim.g.conjure#client#clojure#nrepl#test#current_form_names ["deftest" "defflow" "defspec" "describe"]))}]
