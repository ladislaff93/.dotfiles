local home = os.getenv('HOME')
local jdtls = require('jdtls')

-- File types that signify a Java project's root directory. This will be
-- used by eclipse to determine what constitutes a workspace
local root_markers = { 'gradlew', 'mvnw', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)

-- eclipse.jdt.ls stores project specific data within a folder. If you are working
-- with multiple different projects, each project must use a dedicated data directory.
-- This variable is used to configure eclipse to use the directory name of the
-- current project found using the root_marker as the folder for project specific data.
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")


-- nnoremap('<space>wa', vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
-- nnoremap('<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
-- nnoremap('<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts, "List workspace folders")
-- nnoremap('<space>rn', vim.lsp.buf.rename, bufopts, "Rename")
-- nnoremap('<space>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format file")

local config = {
    flags = {
        debounce_text_changes = 80,
    },
    cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls') },
    root_dir = root_dir,

    settings = {
        java = {
            format = {
                settings = {
                    -- Use Google Java style guidelines for formatting
                    -- To use, make sure to download the file from https://github.com/google/styleguide/blob/gh-pages/eclipse-java-google-style.xml
                    -- and place it in the ~/.local/share/eclipse directory
                    url = "/.local/share/eclipse/eclipse-java-google-style.xml",
                    profile = "GoogleStyle",
                },
            },
            signatureHelp = { enabled = true },
            -- contentProvider = { preferred = 'fernflower' }, -- Use fernflower to decompile library code
            -- Specify any completion options
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*"
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*", "sun.*",
                },
            },
            -- Specify any options for organizing imports
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            -- How code generation should act
            -- codeGeneration = {
            --     toString = {
            --         template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            --     },
            --     hashCodeEquals = {
            --         useJava7Objects = true,
            --     },
            --     useBlocks = true,
            -- },
            -- If you are developing in projects with different Java versions, you need
            -- to tell eclipse.jdt.ls to use the location of the JDK for your Java version
            -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
            -- And search for `interface RuntimeOption`
            -- The `name` is NOT arbitrary, but must match one of the elements from `enum ExecutionEnvironment` in the link above
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-23",
                        path = home .. "/.sdkman/candidates/java/23.0.1-tem",
                    },
                    -- {
                    --     name = "JavaSE-24",
                    --     path = home .. "/.sdkman/candidates/java/24.ea.20-graal",
                    -- },
                }
            }
        }
    },
    -- cmd is the command that starts the language server. Whatever is placed
    -- here is what is passed to the command line to execute jdtls.
    -- Note that eclipse.jdt.ls must be started with a Java version of 17 or higher
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    -- for the full list of options
    -- cmd = {
    --     home .. "/.asdf/installs/java/corretto-17.0.4.9.1/bin/java",
    --     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    --     '-Dosgi.bundles.defaultStartLevel=4',
    --     '-Declipse.product=org.eclipse.jdt.ls.core.product',
    --     '-Dlog.protocol=true',
    --     '-Dlog.level=ALL',
    --     '-Xmx4g',
    --     '--add-modules=ALL-SYSTEM',
    --     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    --     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    --     -- If you use lombok, download the lombok jar and place it in ~/.local/share/eclipse
    --     '-javaagent:' .. home .. '/.local/share/eclipse/lombok.jar',
    --
    --     -- The jar file is located where jdtls was installed. This will need to be updated
    --     -- to the location where you installed jdtls
    --     '-jar', vim.fn.glob('/opt/homebrew/Cellar/jdtls/1.18.0/libexec/plugins/org.eclipse.equinox.launcher_*.jar'),
    --
    --     -- The configuration for jdtls is also placed where jdtls was installed. This will
    --     -- need to be updated depending on your environment
    --     '-configuration', '/opt/homebrew/Cellar/jdtls/1.18.0/libexec/config_mac',
    --
    --     -- Use the workspace_folder defined above to store data for this project
    --     '-data', workspace_folder,
    -- },
    init_options = {
        bundles = {
            vim.fn.glob(
                "/home/ladislaff/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.52.0/com.microsoft.java.debug.plugin-0.52.0.jar",
                1)
        }
    }
}

jdtls.start_or_attach(config)
