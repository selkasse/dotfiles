vim.opt.ignorecase = true

vim.opt.clipboard:append("unnamedplus")


vim.g.clipboard = {

    name = 'WslClipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',

    },
    cache_enabled = true
}


vim.cmd "autocmd FileType * set formatoptions-=cro"
