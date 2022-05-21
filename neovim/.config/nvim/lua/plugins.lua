-- require plugin manager
require "paq" {
    -- Let Paq manage itself
    "savq/paq-nvim";
    "nvim-lua/plenary.nvim";

    -- LSP and Completion
    "neovim/nvim-lspconfig";
    "ms-jpq/coq_nvim";
    "ms-jpq/coq.artifacts";
    "nvim-treesitter/nvim-treesitter";
    "jiangmiao/auto-pairs";
    "simrat39/rust-tools.nvim";

    -- Filetype specific plugins
    "cespare/vim-toml";

    -- Version Control
    "mhinz/vim-signify";

    -- Usability
    "kyazdani42/nvim-tree.lua";
    "ahmedkhalf/project.nvim";
    "nvim-telescope/telescope.nvim";
    --"glepnir/lspsaga.nvim";
    "jose-elias-alvarez/buftabline.nvim";
    "folke/which-key.nvim";
    "akinsho/toggleterm.nvim";

    -- Color Schemes and Aesthetics
    "tomasiser/vim-code-dark";
    "kyazdani42/nvim-web-devicons";
    "goolord/alpha-nvim";
    "karb94/neoscroll.nvim";
}

-- require plugin configurations in plugin.conf subdirectory
require("pluginconf/nvim-lspconfig")
require("pluginconf/coq")
--require("pluginconf/nvim-treesitter")
require("pluginconf/project-nvim")
require("pluginconf/rust-tools")
require("pluginconf/which-key")
require("pluginconf/neoscroll")

-- setup plugins with default configuration
require("nvim-tree").setup({})
--require("lspsaga").init_lsp_saga()
require("buftabline").setup({})
require'alpha'.setup(require'alpha.themes.startify'.config)
