

local jdtls = require("jdtls")

local root_markers = {
    "mvnw",
    "gradlew",
    "pom.xml",
    "build.gradle",
    "build.gradle.kts",
    ".git",
}

local root_dir = vim.fs.root(0, root_markers)

if not root_dir then
    return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data")
    .. "/jdtls-workspace/"
    .. project_name

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
    capabilities = cmp_lsp.default_capabilities(capabilities)
end

local config = {
    cmd = { "jdtls" },
    root_dir = root_dir,
    capabilities = capabilities,

    settings = {
        java = {
            configuration = {
                updateBuildConfiguration = "interactive",
            },
            contentProvider = {
                preferred = "fernflower",
            },
        },
    },

    init_options = {
        bundles = {},
    },
}

vim.fn.mkdir(workspace_dir, "p")
config.cmd = vim.list_extend(config.cmd, {
    "-data",
    workspace_dir,
})

jdtls.start_or_attach(config)

-- Java-specific keymaps
local map = vim.keymap.set
local opts = { buffer = true, silent = true }

map("n", "<leader>jo", function()
    jdtls.organize_imports()
end, vim.tbl_extend("force", opts, {
    desc = "Organize Java imports",
}))

map("n", "<leader>jc", "<cmd>JdtCompile<CR>",
    vim.tbl_extend("force", opts, {
        desc = "Compile Java project",
    }))
