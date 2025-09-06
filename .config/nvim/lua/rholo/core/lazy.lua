local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- última versión estable
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'christoomey/vim-tmux-navigator' },
  { 'ibhagwan/fzf-lua', requires = { 'nvim-tree/nvim-web-devicons' } },
  { 'ellisonleao/gruvbox.nvim' },
  { 'shinchu/lightline-gruvbox.vim' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'onsails/lspkind.nvim' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-cmdline' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rafamadriz/friendly-snippets' },
  { 'neovim/nvim-lspconfig' },
  { "williamboman/mason.nvim" },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'lewis6991/gitsigns.nvim' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    'folke/flash.nvim',
    config = function()
      require("flash").setup({
        modes = {
          search = {
            enabled = true,
          },
        },
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })()
    end,
  },
  { 'ibhagwan/fzf-lua', requires = { 'nvim-tree/nvim-web-devicons' } },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "gruvbox",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
      opt = true,
      cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
      config = function()
        require("nvim-tree").setup {
          update_focused_file = {
            enable = true,
            update_cwd = true
          },
          view = {
            adaptive_size = true
          },
          actions = {
            open_file = {
              quit_on_open = true
            }
          },
          git = {
            enable = false,
            ignore = true
          },
          filters = {
            dotfiles = false,
            custom = {'.git/', 'node_modules', 'dist'}
          }
        }
    end
  },
  --{
   -- 'nvimdev/lspsaga.nvim',
   -- config = function()
   --   require('lspsaga').setup({
   --     lightbulb = { enable = false },
   --   })
  -- end,
  --}
})
