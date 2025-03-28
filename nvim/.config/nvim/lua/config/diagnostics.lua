vim.diagnostic.config({
    virtual_text = false,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
    },
})

-- configure the underline style
local hl_groups = { 'DiagnosticUnderlineError' }
for _, hl in ipairs(hl_groups) do
    vim.cmd.highlight(hl .. ' gui=undercurl')
end

-- change symbols for DiagnosticSign
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅙",
            [vim.diagnostic.severity.INFO]  = "󰋼",
            [vim.diagnostic.severity.HINT]  = "󰌵",
            [vim.diagnostic.severity.WARN]  = "",
        },
        linehl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.INFO]  = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT]  = "DiagnosticSignHint",
            [vim.diagnostic.severity.WARN]  = "DiagnosticSignWarn",
        },
    },
})
