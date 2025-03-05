return {
  "danymat/neogen",
  config = function()
    require('neogen').setup {
      snippet_engine = "luasnip",
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings"
          }
        }
      }
    }
    vim.api.nvim_set_keymap("n", "<Leader>gd", ":lua require('neogen').generate()<CR>", { desc = 'Generate Docstrings'})
  end,
}
