return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")

            treesitter.setup({})

            treesitter.install({
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
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
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
