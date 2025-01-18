-- Set indentation to 2 spaces
vim.opt.expandtab = true    -- Convert tabs to spaces
vim.opt.shiftwidth = 2      -- Number of spaces for auto-indent
vim.opt.autoindent = true   -- Copy indent from current line when starting a new line
vim.opt.smartindent = true  -- Smart autoindenting when starting a new line

-- Wrap on whole words
vim.opt.linebreak = true

-- Enable spell checking
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "tex" }, -- Spell-checked file types
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})

-- Enable built-in filetype detection and syntax highlighting
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- Basic editor settings
vim.opt.number = true          -- Show line numbers
vim.opt.syntax = 'on'          -- Enable syntax highlighting
vim.opt.termguicolors = true   -- Enable true color support

-- Add hotkey to clear search highlight
vim.keymap.set('n', '<ESC><ESC>', ':nohlsearch<CR>')

-- Allow arrow keys to move across line boundaries in insert mode
vim.opt.whichwrap:append("<,>,[,]")

-- Set up Treesitter for syntax highlighting
require('nvim-treesitter.configs').setup({
  ensure_installed = { "lua", "vim", "javascript", "ruby", "python", "html", "css" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- Disable old syntax highlighting
  },
  indent = {
    enable = true,
  },
})

-- Theme setup
require('gruvbox').setup({
  contrast = "hard",
})
vim.cmd("colorscheme gruvbox")
