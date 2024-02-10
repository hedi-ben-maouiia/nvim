local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap


--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Function to compile and run C++ And C code in a split terminal
function CompileAndRunCpp()
  local filename = vim.fn.expand('%')
  local basename = vim.fn.expand('%:r')
  local cmd = 'g++ -std=c++17 -o ' .. basename .. ' ' .. filename .. ' && ./' .. basename
  vim.cmd('vnew')
  vim.fn.termopen(cmd)
  vim.cmd('startinsert') -- To automatically switch to terminal mode after running
end

function CompileAndRunC()
    local filename = vim.fn.expand('%')
    local basename = vim.fn.expand('%:r')
    local cmd = 'gcc -Wall -o ' .. basename .. ' ' ..  filename .. ' && ./' .. basename
    
    vim.cmd('vnew')
    vim.fn.termopen(cmd)
    vim.cmd('startinsert') -- To automatically switch to terminal mode after running
end

-- Function to run any file that you work on either c or c++
function Run()
    local basename = vim.fn.expand('%:r')
    local cmd = './' .. basename
    
    vim.cmd('vnew')
    vim.fn.termopen(cmd)
    vim.cmd('startinsert') -- To automatically switch to terminal mode after running
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- automatically build and run c++ or c file 
keymap('n', '<leader>r', ':lua CompileAndRunCpp()<CR>', opts)
keymap('n', '<F5>', ':lua CompileAndRunC()<CR>',  opts)
keymap('n', 'R', ':lua Run()<CR>', opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Taba Navigate
keymap("n", "<leader>t", ":tabnew<cr>", opts)
keymap("n", "<leader>c", ":tabclose<cr>", opts)
-- Insert --
-- Press jh fast to exit insert mode 
keymap("i", "jh", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

keymap('n', "<C-a>", 'gg<S-v>G',opts)
--nnoremap <esc><esc> :silent! nohls<cr>
keymap("n", "<esc><esc>", ":nohlsearch<CR>", { silent = true })
keymap('n', '<F8>', ":TagbarToggle<CR>", { noremap = true, silent = true })
