return {
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
    }
    local js_types = vim.tbl_keys(lint.linters_by_ft)

    local lint_autogroup = vim.api.nvim_create_augroup('lint', { clear = true })

    local eslint = lint.linters.eslint_d

    local function find_nearest_eslint_config_dir()
      local current_dir = vim.fn.expand '%:p:h'

      local eslint_configs = {
        '.eslintrc.js',
        '.eslintrc.cjs',
        '.eslintrc.yaml',
        '.eslintrc.yml',
        '.eslintrc.json',
        'eslint.config.mjs',
        'package.json', -- Some projects configure eslint inside package.json
      }

      local function has_eslint_config(dir)
        for _, config in ipairs(eslint_configs) do
          if vim.fn.filereadable(dir .. '/' .. config) == 1 then
            if config == 'package.json' then
              -- Check if package.json actually has eslint config section
              local package_json = vim.fn.readfile(dir .. '/package.json')
              local has_eslint_section = false
              for _, line in ipairs(package_json) do
                if line:match '"eslintConfig"%s*:' then
                  has_eslint_section = true
                  break
                end
              end
              if has_eslint_section then
                return true
              end
            else
              return true
            end
          end
        end
        return false
      end

      while current_dir ~= '/' do
        if has_eslint_config(current_dir) then
          return current_dir
        end
        current_dir = vim.fn.fnamemodify(current_dir, ':h')
      end

      return nil -- No config found
    end

    eslint.args = {
      -- '--no-warn-ignored', -- <-- this is the key argument
      '--format',
      'json',
      '--stdin',
      '--stdin-filename',
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
      group = lint_autogroup,
      callback = function()
        local ft = vim.bo.filetype

        if not vim.tbl_contains(js_types, ft) then
          lint.try_lint()
          return
        end

        local original_cwd = vim.fn.getcwd()
        local eslint_config_dir = find_nearest_eslint_config_dir()

        if not eslint_config_dir then
          -- No ESLint config found, skip linting
          return
        end

        vim.cmd('cd ' .. eslint_config_dir)
        lint.try_lint()
        vim.cmd('cd ' .. original_cwd)
      end,
    })
  end,
}
