return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          -- Optional: Only override or extend keymaps here if needed
          on_attach = function(_, bufnr)
            -- Example: Rust-specific shortcut
            vim.keymap.set('n', '<leader>rm', function()
              vim.cmd.RustExpandMacro()
            end, { buffer = bufnr, desc = '[R]ust: Expand [M]acro' })

            vim.keymap.set('n', '<leader>rr', function()
              vim.cmd.RustRun()
            end, { buffer = bufnr, desc = '[R]ust: [R]un' })
          end,
        },
      }
    end,
  },
}
