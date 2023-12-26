-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

vim.o.cindent = true
-- vim.o.smartindent = true
-- vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.linebreak = true
vim.o.scrolloff = 15
vim.wo.rnu = true

-- Neovide config
if vim.g.neovide then
  vim.o.guifont="CaskaydiaCove Nerd Font:h11"
  vim.g.neovide_refresh_rate = 165
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end

return {
  {
    "windwp/nvim-autopairs",
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require("nvim-autopairs").setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 900,
    config = function()
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'catppuccin-mocha',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            newfile_status = true,
            path = 4,
          }
        }
      },
    },
  },
}
