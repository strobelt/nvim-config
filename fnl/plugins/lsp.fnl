(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))

(fn define-signs
  [prefix]
  (let [error (.. prefix "SignError")
        warn  (.. prefix "SignWarn")
        info  (.. prefix "SignInfo")
        hint  (.. prefix "SignHint")]
    (vim.fn.sign_define error {:text "" :texthl error})
    (vim.fn.sign_define warn  {:text "" :texthl warn})
    (vim.fn.sign_define info  {:text "" :texthl info})
    (vim.fn.sign_define hint  {:text "" :texthl hint})))

(define-signs "Diagnostic")

(fn on_attach [client bufnr]
  (do
    (nvim.buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>ld "<Cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lt "<cmd>lua vim.lsp.buf.type_definition()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lh "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>ln "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>le "<cmd>lua vim.diagnostic.open_float()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lq "<cmd>lua vim.diagnostic.setloclist()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lf "<cmd>lua vim.lsp.buf.format()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lj "<cmd>lua vim.diagnostic.goto_next()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lk "<cmd>lua vim.diagnostic.goto_prev()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>la "<cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
    (nvim.buf_set_keymap bufnr :v :<leader>la "<cmd>lua vim.lsp.buf.range_code_action()<CR> " {:noremap true})
    ;telescope
    (nvim.buf_set_keymap bufnr :n :<leader>lw ":lua require('telescope.builtin').diagnostics()<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>lr ":lua require('telescope.builtin').lsp_references()<cr>" {:noremap true})
    (nvim.buf_set_keymap bufnr :n :<leader>li ":lua require('telescope.builtin').lsp_implementations()<cr>" {:noremap true})))

[{1 :neovim/nvim-lspconfig
  :dependencies [:williamboman/mason.nvim :williamboman/mason-lspconfig.nvim]
  :config (fn []
            (let [mason (require :mason)
                  mason-lspconfig (require :mason-lspconfig)
                  cmplsp (require :cmp_nvim_lsp)
                  handlers {"textDocument/publishDiagnostics"
                            (vim.lsp.with
                              vim.lsp.diagnostic.on_publish_diagnostics
                              {:severity_sort true
                               :update_in_insert true
                               :underline true
                               :virtual_text false})
                            "textDocument/hover"
                            (vim.lsp.with
                              vim.lsp.handlers.hover
                              {:border "single"})
                            "textDocument/signatureHelp"
                            (vim.lsp.with
                              vim.lsp.handlers.signature_help
                              {:border "single"})}
                  capabilities (cmplsp.default_capabilities)
                  before_init (fn [params]
                                (set params.workDoneToken :1))]

              (mason.setup {:ui {:icons {:package_installed ""
                                         :package_pending ""
                                         :package_uninstalled ""}}})
              (mason-lspconfig.setup)

              ;; C#
              (vim.lsp.config :csharp {:cmd ["/home/strobelt/.cache/omnisharp/run"]
                                       :organize_imports_on_format true
                                       :enable_import_completion true
                                       :enable_roslyn_analyzers true
                                       :on_attach on_attach
                                       :handlers handlers
                                       :before_init before_init
                                       :capabilities capabilities})

              ;; Clojure
              (vim.lsp.config :clojure {:on_attach on_attach
                                        :handlers handlers
                                        :before_init before_init
                                        :capabilities capabilities})))}

 {1 :mrcjkb/rustaceanvim
  :lazy true
  :ft [:rust]
  :config (fn []
            (let [bufnr (vim.api.nvim_get_current_buf)]
              (tset vim.g "rustaceanvim" {:server {:on_attach (fn [client bufnr]
                                (do 
                                  (on_attach client bufnr)
                                  (nvim.set_keymap :n :<localleader>C ":RustLsp debuggables<CR>" {:noremap true})
                                  (nvim.buf_set_keymap bufnr :n :<leader>la "<cmd>lua vim.cmd.RustLsp('codeAction')<CR>" {:noremap true})
                                  (nvim.buf_set_keymap bufnr :v :<leader>la "<cmd>lua vim.cmd.RustLsp('rangeCodeAction')<CR>" {:noremap true})))}})))}
 

 {1 :scalameta/nvim-metals
  :dependencies [:nvim-lua/plenary.nvim]
  :lazy true
  :ft [:scala :sbt :java]
  :opts (fn []
          (let [metals (require :metals)]
                (var config (metals.bare_config))
            (set config.on_attach on_attach)
            config))
  :config (fn [_ config]
           (let [metals (require :metals)]
            (metals.initialize_or_attach config)))}]
