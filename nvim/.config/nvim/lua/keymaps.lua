-- Set leader key (must be before mappings)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlighting
vim.keymap.set(
    "n",
    "<Esc>",
    "<cmd>nohlsearch<CR>",
    { desc = "Clear highlights on search when pressing <Esc> in normal mode" }
)

-- Terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Disable arrow keys
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Jump backward (instead of Ctrl-o)
vim.keymap.set("n", "<C-j>", "<C-o>", { noremap = true, silent = true })

-- Jump forward (instead of Ctrl-i)
vim.keymap.set("n", "<C-k>", "<C-i>", { noremap = true, silent = true })

-- Paste without losing the saved data in the register
vim.keymap.set("x", "p", function()
    local old_reg = vim.fn.getreg('"') -- Save the current yank register
    local old_regtype = vim.fn.getregtype('"')
    vim.cmd('normal! "_dP') -- Delete into black hole, then paste
    vim.fn.setreg('"', old_reg, old_regtype) -- Restore the yank register
end, { noremap = true, silent = true })
