-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'ThePrimeagen/vim-be-good'
  use 'sainnhe/everforest'
  use 'pineapplegiant/spaceduck'
  use 'dracula/vim'
  use 'rafi/awesome-vim-colorschemes'
  use ({
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
  })
end)
