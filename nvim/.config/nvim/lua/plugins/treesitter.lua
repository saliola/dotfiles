return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")

            treesitter.setup({})

            treesitter.install({
                "c",
                "html",
                "javascript",
                "latex",
                "lua",
                "markdown",
                "python",
                "vim",
                "vimdoc",
                "yaml",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function(args)
                    -- pcall prevents crash for filetypes with no treesitter parser
                    pcall(vim.treesitter.start, args.buf)
                    -- Don't override indentexpr for filetypes with poor treesitter indent support
                    local ts_indent_disabled = {
                        tex = true,
                        latex = true
                    }
                    if not ts_indent_disabled[vim.bo[args.buf].filetype] then
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                    vim.wo[0][0].foldmethod = "expr"
                    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
                    vim.wo[0][0].foldenable = false
                end,
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "latex", "tex", "markdown" },
                callback = function()
                    vim.bo.syntax = "ON"
                end,
            })
        end,
    },
}
