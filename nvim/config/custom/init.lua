vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Speed things up
vim.opt.updatetime = 250
vim.wo.signcolumn = 'yes'

--------------------------------------------
--               KEY MAPS 
--------------------------------------------


function map(mode, shortcut, command) 
    vim.api.nvim_set_keymap(
        mode,
        shortcut,
        command,
        {noremap = true}
    )
end
function nmap(shortcut, command)
    map('n', shortcut, command)
end
function imap(shortcut, command)
    map('i', shortcut, command)
end
function vmap(shortcut, command)
    map('v', shortcut, command)
end

nmap("jk", "<Esc>")
imap("jk", "<Esc>")
vmap("jk", "<Esc>")


-- Set the clipboard and clear unwanted characters
vim.opt.clipboard = "unnamedplus"
nmap("x", "\"_x")
nmap("c", "\"_c")
nmap("X", "\"_X")
nmap("d", "\"_d")
nmap("D", "\"_D")
vmap("d", "\"_d")


map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- Proper keyboard navigation. Treat line wrap well.
vim.api.nvim_set_keymap('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
