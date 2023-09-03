-- Basic core keymaps

vim.g.mapleader = " " -- map leader to space key...

local keymap = vim.keymap

---------------------
-- general keymaps --

-- reload the init file
keymap.set("n", "<leader>so", ":luafile %<CR>")

-- set jk or kj to go back to normal mode
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")

-- remove search highlighting
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete character but do not copy to register
keymap.set("n", "x", '"_x')

-- increment and decrement numbers in normal mode
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- split window management
keymap.set("n", "<leader>|", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>_", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>=", "<C-w>=") -- make split window equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window pane

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>]", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>[", ":tabp<CR>") -- go to previour tab
-- trying out this, just being cute, might delete later.
keymap.set("n", "<leader><Tab>o", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader><Tab>p", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader><Tab>]", "tabn<CR>") -- go to next tab
keymap.set("n", "<leader><Tab>[", "tabp<CR>") -- go to previous tab

-- quick save and exit
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>wq", ":wq<CR>")
