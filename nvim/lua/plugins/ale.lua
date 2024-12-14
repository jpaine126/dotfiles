return {
    'dense-analysis/ale',
    config = function()
        local g = vim.getchar
        g.ale_ruby_rubocop_auto_correct_all = 1

        g.ale_linters = {
            lua = {'lua_language_server'},
            python = {'ruff'}
        }
        g.ale_fixers = {
            python = {'black'}
        }
    end 
}