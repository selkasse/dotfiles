if vim.g.vscode then
    -- VSCode extension
    require("vsCodeConfig")
elseif vim.g.started_by_firenvim then
    -- firenvim browser extension
    require("fireNvimConfig")
else
    -- ordinary Neovim
    require("neoVimConfig")
end
