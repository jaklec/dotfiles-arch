local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
  rainbow = {enable = true, extended_mode = true, max_file_lines = 300},
  -- ensure_installed = "maintained",
  ensure_installed = {
    "javascript", "html", "css", "bash", "lua", "json", "python", "rust", "c",
    "cmake", "cpp", "dockerfile", "go", "graphql", "java", "regex", "scss",
    "svelte", "toml", "typescript", "vue", "yaml"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {"typescript", "cpp"},
    additional_vim_regex_highlighting = false
  },
  indent = {enable = false}
}
