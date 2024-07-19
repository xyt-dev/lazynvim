return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = function ()
      require("gruvbox").setup({
        -- overrides = {
        --   ["GruvboxGreenBold"] = { fg = '#ffcc99', bold = true }
        -- }
      })
      vim.cmd("colorscheme gruvbox")
      vim.api.nvim_set_hl(0, 'GruvboxGreen', { fg = '#ffcc99' })
      vim.api.nvim_set_hl(0, 'GruvboxGreenBold', { fg = '#ffcc99', bold = true })
      vim.api.nvim_set_hl(0, 'String', { fg = '#8ec07c', italic = true })
    end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      popup_border_style = "rounded",
      window = {
        position = "float",
        mappings = {
          ["h"] = "navigate_up",  -- 设置 'h' 键为返回上级目录
        }
      },
    },
  },

  {
    'akinsho/toggleterm.nvim',
    config = function ()
      require('toggleterm').setup()
      -- silent
      vim.keymap.set('n', '<C-t>', ':ToggleTerm direction=float<CR>', { desc = "Toggle terminal", silent = true })
      vim.keymap.set('t', '<C-t>', function()
        vim.api.nvim_input('<C-\\><C-n>')
        vim.api.nvim_command('ToggleTerm')
      end, { desc = "Toggle terminal" })
    end
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
    config = function ()
      require('rainbow-delimiters.setup').setup {
        strategy = {
            -- ...
        },
        query = {
            -- ...
        },
        highlight = {
            -- ...
        },
      }
    end
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      vim.o.completeopt = '' -- Do not show the native completion menu
	    local cmp = require 'cmp'
	    cmp.setup {
        completion = { completeopt = 'menu,menuone,noinsert' },
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = {
          {name = 'nvim_lsp'},
          {name = 'path'},
          {name = 'buffer'},
        }
      }
      -- Completion with command
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {name = 'buffer'}
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          {name = 'path'},
          {name = 'cmdline'},
        }
      })
    end
  },

  {
    'nvimdev/dashboard-nvim',
    opts = {
      config = {
        header = {
          "",
          "",
          "",
          " ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ ",
          " ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ ",
          " ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ ",
          " ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ ",
          " ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ ",
          " ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ ",
          " ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ ",
          " ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ ",
          " ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ ",
          " ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
          " ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ ",
          " ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ ",
          " ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ ",
          " ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ ",
          '',
          '                      Welcome to DiligentVim!                      ',
          '',
        }
      }
    }
  }
}
