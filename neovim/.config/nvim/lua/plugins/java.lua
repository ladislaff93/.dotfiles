return {
    'mfussenegger/nvim-jdtls',
    config = function()
        local jdtls_config = {
            bundles = {}
        }
        -- Add spring-boot jdtls extension jar files
        vim.list_extend(jdtls_config.bundles, require("spring_boot").java_extensions())
    end
}
