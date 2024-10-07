local config = {
  cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls') },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  init_options = {
    bundles = {
      vim.fn.glob(
      "/home/ladislaff/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.52.0/com.microsoft.java.debug.plugin-0.52.0.jar",
        1)

    }
  }
}
require('jdtls').start_or_attach(config)
