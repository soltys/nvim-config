vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true


vim.filetype.add({
    extension = {
        xaml = "xml",
        props = "xml",
        targets = "xml",
        sj = "js",
    },
})

-- Check if 'pwsh' is executable and set the shell accordingly
if vim.fn.executable("pwsh") == 1 then
    vim.o.shell = "pwsh"
else
    vim.o.shell = "powershell"
end

vim.opt.swapfile = false

---vim.lsp.set_log_level("ERROR")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

