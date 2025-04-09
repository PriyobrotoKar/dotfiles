return {
  'numToStr/Comment.nvim',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  opts = function()
    local commentstring = require 'ts_context_commentstring.integrations.comment_nvim'
    return {
      pre_hook = commentstring.create_pre_hook(),
    }
  end,
}
