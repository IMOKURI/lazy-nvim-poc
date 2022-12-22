return {

    {
        "catppuccin/nvim",
        name = "catppuccin",
        build = function()
            require('catppuccin').compile()
        end,
        config = function()
            local catppuccin = require("catppuccin")
            local colors = require("catppuccin.palettes").get_palette()

            vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

            catppuccin.setup({
                integrations = {
                    indent_blankline = {
                        enabled = true,
                        colored_indent_levels = false,
                    },
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = {},
                            hints = {},
                            warnings = {},
                            information = {},
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                        },
                    },
                    ts_rainbow = true,
                },
                custom_highlights = {
                    WinBar = { fg = colors.yellow },
                    WinBarNC = { fg = colors.subtext0 },
                },
            })

            vim.api.nvim_cmd({
                cmd = "colorscheme",
                args = { "catppuccin" },
            }, {})

        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                    globalstatus = true,
                },
                sections = {
                    lualine_a = { { "mode", fmt = string.upper } },
                    lualine_b = { "filetype" },
                    lualine_c = { { "diagnostics", sources = { "nvim_lsp" } } },
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {},
                },
            })

        end,
    },



}
