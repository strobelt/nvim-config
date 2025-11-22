-- [nfnl] fnl/plugins/lsp.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local nvim = autoload("nvim")
local function define_signs(prefix)
  local error = (prefix .. "SignError")
  local warn = (prefix .. "SignWarn")
  local info = (prefix .. "SignInfo")
  local hint = (prefix .. "SignHint")
  vim.fn.sign_define(error, {text = "\239\129\151", texthl = error})
  vim.fn.sign_define(warn, {text = "\239\129\177", texthl = warn})
  vim.fn.sign_define(info, {text = "\239\129\154", texthl = info})
  return vim.fn.sign_define(hint, {text = "\239\129\153", texthl = hint})
end
define_signs("Diagnostic")
local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lw", ":lua require('telescope.builtin').diagnostics()<cr>", {noremap = true})
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
  return vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
end
local function _2_()
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, update_in_insert = true, underline = true, virtual_text = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local before_init
  local function _3_(params)
    params.workDoneToken = "1"
    return nil
  end
  before_init = _3_
  vim.lsp.config("*", {on_attach = on_attach, handlers = handlers, before_init = before_init})
  local function _4_(bufnr, on_dir)
    local pattern = vim.api.nvim_buf_get_name(bufnr)
    local util = require("lspconfig.util")
    local fallback = vim.loop.cwd()
    local patterns = {"project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", ".git", "bb.edn"}
    local root = util.root_pattern(patterns)(pattern)
    return on_dir((root or fallback))
  end
  vim.lsp.config("clojure_lsp", {root_dir = _4_})
  return vim.lsp.enable("clojure_lsp")
end
local function _5_()
  local bufnr = vim.api.nvim_get_current_buf()
  local function _6_(client, bufnr0)
    on_attach(client, bufnr0)
    nvim.set_keymap("n", "<localleader>C", ":RustLsp debuggables<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr0, "n", "<leader>la", "<cmd>lua vim.cmd.RustLsp('codeAction')<CR>", {noremap = true})
    return nvim.buf_set_keymap(bufnr0, "v", "<leader>la", "<cmd>lua vim.cmd.RustLsp('rangeCodeAction')<CR>", {noremap = true})
  end
  vim.g["rustaceanvim"] = {server = {on_attach = _6_}}
  return nil
end
local function _7_()
  local metals = require("metals")
  local config = metals.bare_config()
  config.on_attach = on_attach
  return config
end
local function _8_(_, config)
  local metals = require("metals")
  return metals.initialize_or_attach(config)
end
return {{"neovim/nvim-lspconfig", config = _2_}, {"mrcjkb/rustaceanvim", lazy = true, ft = {"rust"}, config = _5_}, {"scalameta/nvim-metals", dependencies = {"nvim-lua/plenary.nvim"}, lazy = true, ft = {"scala", "sbt", "java"}, opts = _7_, config = _8_}}
