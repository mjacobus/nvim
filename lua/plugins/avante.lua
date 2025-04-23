return {
  "yetone/avante.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    provider = "ollama",
    ollama = {
      model = "mistral", -- you can also try "llama3:8b-q4_0" or "gemma"
    },
  },
  build = "make",
  cmd = { "AvantePrompt", "AvanteToggle" },
  keys = {
    { "<leader>aa", "<cmd>AvantePrompt<cr>", desc = "Avante Prompt" },
    { "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante Window" },
  },
}
