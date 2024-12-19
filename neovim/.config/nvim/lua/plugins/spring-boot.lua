return {
    "JavaHello/spring-boot.nvim",
    ft = "java",
    dependencies = {
        "mfussenegger/nvim-jdtls",
        "ibhagwan/fzf-lua",
    },
    config = function()
        require('spring_boot').setup({})
    end
}
