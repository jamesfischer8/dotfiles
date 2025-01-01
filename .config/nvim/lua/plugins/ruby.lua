-- lua/plugins/ruby.lua
return {
  -- Ruby/Rails support
  { "vim-ruby/vim-ruby" },
  { "tpope/vim-rails" },
  { "tpope/vim-endwise" },

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
	ensure_installed = { "ruby" },
	highlight = { enable = true },
      })
    end
  },

  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").solargraph.setup({})
    end
  }
}
