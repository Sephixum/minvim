local function clean_transparency()
    local groups = {
        "Normal", "NormalFloat", "LineNr", "Folded", "NonText",
        "Pmenu", "FloatBorder", "BlinkCmpMenu", "BlinkCmpDoc",
        "BlinkCmpMenuBorder", "BlinkCmpDocBorder"
    }

    for _, group in ipairs(groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end

    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#313244", bold = true })
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = clean_transparency })
clean_transparency()
