return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- basic telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end
    local harpoon = require 'harpoon'
    harpoon:setup()
    vim.keymap.set("n", "<leader>A", function()
      harpoon:list():remove()
    end, { desc = 'Remove current buffer from harpoon list'})
    vim.keymap.set('n', '<leader>I', function()
      toggle_telescope(harpoon:list())
    end, { desc = 'Open harpoon window' })
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'add file to harpoon' })
    vim.keymap.set('n', '<leader>H', function()
      harpoon:list():select(1)
    end, { desc = 'harpoon select 1' })
    vim.keymap.set('n', '<leader>J', function()
      harpoon:list():select(2)
    end, { desc = 'harpoon select 2' })
    vim.keymap.set('n', '<leader>K', function()
      harpoon:list():select(3)
    end, { desc = 'harpoon select 3' })
    vim.keymap.set('n', '<leader>L', function()
      harpoon:list():select(4)
    end, { desc = 'harpoon select 4' })
    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<leader>P', function()
      harpoon:list():prev()
    end, { desc = 'harpoon previous list' })
    vim.keymap.set('n', '<leader>N', function()
      harpoon:list():next()
    end, { desc = 'harpoon next list' })
  end,
}
