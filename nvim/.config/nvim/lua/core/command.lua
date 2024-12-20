local M = {}

M.setup = function()
    local my_cmd = vim.api.nvim_create_user_command

    local function complete_colorscheme(arg_lead, cmd_line, cursor_pos)
        local all_schemes = vim.fn.getcompletion(arg_lead, 'color')
        local filtered_schemes = {}
        for _, scheme in ipairs(all_schemes) do
            if scheme:match("^catppuccin%-") then
                table.insert(filtered_schemes, scheme)
            end
        end
        return filtered_schemes
    end

    my_cmd("ChangeTheme", function(opts)
        local colorscheme = opts.args ~= "" and opts.args or vim.g.colors_name
        vim.cmd("colorscheme " .. colorscheme)
        -- vim.cmd("source $MYVIMRC")
    end, { nargs = "?", complete = complete_colorscheme })
end

return M
