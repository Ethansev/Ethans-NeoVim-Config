return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "thenbe/neotest-playwright",
        "marilari88/neotest-vitest",
        "nvim-neotest/neotest-jest",
        "nvim-telescope/telescope.nvim",
    },
    opts = {
        adapters = {
            ["neotest-playwright"] = {
                options = {
                    persist_project_selection = true,
                    enable_dynamic_test_discovery = true,
                },
            },
            ["neotest-vitest"] = {},
            ["neotest-jest"] = {
                jestCommand = "npm run test --",
                -- jestConfigFile = "jest.config.mjs",
                jestConfigFile = function(file)
                    -- Check if the test file is in the directory
                    if string.find(file, "packages/") then
                        local package_root = string.match(file, "(.-/packages/[^/]+/)")
                        local config_file = package_root .. "jest.config.mjs"
                        if vim.fn.filereadable(config_file) == 1 then
                            return config_file
                        end
                    end
                    -- Default to using the Jest config in the current working directory
                    return "/jest.config.ts"
                end,
                env = { ci = true },
                cwd = function(file)
                    if string.find(file, "/packages/") then
                        return string.match(file, "(.-/packages/[^/]+/)")
                    end
                    return vim.fn.getcwd()
                end,
            },
        },
    },
}
