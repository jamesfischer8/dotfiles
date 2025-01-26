return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "vim",
        "javascript",
        "ruby",
        "python",
        "html",
        "css",
        "terraform",
        "hcl"
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- Disable old syntax highlighting
      },
      indent = {
        enable = true
      },
    })
  end
}
