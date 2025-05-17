-- Set leader key (must be before mappings)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- This cycles between two most recent buffers
vim.keymap.set("n", "<C-Tab>", "<C-^>", { desc = "Toggle between last two buffers" })

-- Paste without losing the saved data in the register
vim.keymap.set("x", "p", function()
    local old_reg = vim.fn.getreg('"') -- Save the current yank register
    local old_regtype = vim.fn.getregtype('"')
    vim.cmd('normal! "_dP') -- Delete into black hole, then paste
    vim.fn.setreg('"', old_reg, old_regtype) -- Restore the yank register
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "x" }, "x", '"_x', { noremap = true, silent = true })
vim.keymap.set("n", "c", '"_c', { noremap = true, silent = true })
vim.keymap.set("n", "C", '"_C', { noremap = true, silent = true })
