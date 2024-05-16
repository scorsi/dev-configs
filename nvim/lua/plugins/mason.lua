return {
    "williamboman/mason.nvim",
    lazy = false,
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "pyright",
                "terraformls",
                "yamlls",
                "taplo",
                "dockerls",
                "docker_compose_language_service",
            },
        })

        require("mason-tool-installer").setup({
            ensure_installed = {
                "stylua",
                "isort",
                "black",
                "pylint",
                "hclfmt",
                "tflint",
                "yamlfmt",
                "yamllint",
            },
        })
    end,
}
