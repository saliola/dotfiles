return {
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install && git restore .",
        init = function()
            -- Standard plugin settings
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_page_title = '${name}'

            -- define paths to CSS files
            local config_path = vim.fn.stdpath('config')
            local css_style_msword = config_path .. '/assets/markdown-preview-msword.css'
            local css_style_github = config_path .. '/assets/markdown-preview-github.css'

            -- set a default startup style
            vim.g.mkdp_markdown_css = css_style_msword

            -- Command to toggle between styles
            vim.api.nvim_create_user_command('MarkdownPreviewStyleToggle', function()
                -- Stop the server first
                vim.cmd('MarkdownPreviewStop')

                -- Swap the CSS variables
                if vim.g.mkdp_markdown_css == css_style_msword then
                    vim.g.mkdp_markdown_css = css_style_github
                    print("Markdown Preview: Switched to GitHub Style")
                else
                    vim.g.mkdp_markdown_css = css_style_msword
                    print("Markdown Preview: Switched to MS Word Style")
                end

                -- Wait, then restart
                vim.defer_fn(function()
                    vim.cmd('MarkdownPreview')
                end, 250)
            end, {})
        end,
        ft = { "markdown" },
    }
}
