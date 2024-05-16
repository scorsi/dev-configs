return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local path = require("mason-core.path")
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                yaml = { "yamlfmt" },
                hcl = { "hclfmt" },
                terraform = { "hclfmt" },
                bash = { "shfmt" },
            },
            formatters = {
                hclfmt = {
                    command = path.concat({ vim.fn.stdpath("data"), "mason", "bin", "hclfmt" }),
                },
                -- INFO: black and isort are loaded from venv thanks to venv-selector,
                -- normally no need to extra stuff but here's a draft on how to load from venv in case of issue
                --
                -- isort = function(_)
                --     local venv_selector = require("venv-selector")
                --     local venv = venv_selector.get_active_venv()
                --     if venv ~= "" then
                --         local command = vim.fn.findfile("isort", venv .. ";")
                --         if command ~= "" then
                --             return {
                --                 command = command,
                --             }
                --         end
                --     end
                --
                --     return {
                --         command = "isort",
                --     }
                -- end,
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
