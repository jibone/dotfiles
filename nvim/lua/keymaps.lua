-- Basic core keymaps...

vim.g.mapleader = " " -- map leader to space key...

local keymap = vim.keymap

-- set jk or kj to go to normal mode
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")

-- quick save and exit
keymap.set("n", "<leader>w", ":w<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
keymap.set("n", "<leader>wq", ":wq<CR>")

-- remove search highlighting
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete character but do not copy to register
keymap.set("n", "x", '"_x')

-- split window management
keymap.set("n", "<leader>|", "<C-w>v") -- split window vertically.
keymap.set("n", "<leader>_", "<C-w>s") -- split window horizontally.
keymap.set("n", "<leader>=", "<C-w>-") -- make split window equal width.
keymap.set("n", "<leader>sx", ":close<CR>") -- cloase current split window pane.

-- tab management
keymap.set("n", "<leader><Tab>o", ":tabnew<CR>")
keymap.set("n", "<leader><Tab>x", ":tabclose<CR>")
keymap.set("n", "<leader>]", ":tabn<CR>")
keymap.set("n", "<leader>[", ":tabp<CR>")
