local skeleton = require 'nvim_lsp/skeleton'
local util = require 'nvim_lsp/util'
local lsp = vim.lsp

local server_name = "swiprolog"
local bin_name = "swipl"

skeleton[server_name] = {
  default_config = util.utf8_config {
    cmd = {bin_name,
           "-g", "use_module(library(lsp_server)).",
           "-g", "lsp_server:main",
           "-t", "halt",
           "--", "stdio"};
    filetypes = {"prolog"};
    root_dir = util.root_pattern(".git", vim.fn.getcwd());
    log_level = lsp.protocol.MessageType.Warning;
    settings = {};
  };
  docs = {
    description = [[
https://github.com/jamesnvc/lsp_server/blob/master/README.org
]];
    default_config = {
      root_dir = [[root_pattern(".git", vim.fn.getcwd())]];
    };
  };
}
-- vim:et ts=2 sw=2
