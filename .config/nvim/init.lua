if vim.g.vscode then
    -- VSCode extension
    require("vsCodeConfig")
else
    -- ordinary Neovim
    require("neoVimConfig")
end
