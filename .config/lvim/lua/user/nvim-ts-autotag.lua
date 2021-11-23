local M = {}

M.config = function()
    local status_ok, autotag = pcall(require, "nvim-ts-autotag")

    autotag.setup({
        filetypes = {
            'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'
          }
    })
end

return M