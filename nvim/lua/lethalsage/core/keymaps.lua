-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------
-- switch between buffers
keymap.set("n", "[b", ":bp<CR>", { desc = "Previous buffer" }) -- previous buffer
keymap.set("n", "]b", ":bn<CR>", { desc = "Next buffer" }) -- next buffer

-- move the selected code up or down
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- downward
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- upward

-- place cursor at the same place when a text is pasted
keymap.set("n", "J", "mzJ`z")

-- center cursor after scrolling
keymap.set("n", "<C-u>", "<C-u>zz") -- upward
keymap.set("n", "<C-d>", "<C-d>zz") -- downward

-- center cursor after finding next/previous occurence
keymap.set("n", "n", "nzzzv") -- next
keymap.set("n", "N", "Nzzzv") -- previous

-- greatest remap ever
keymap.set("x", "<leader>p", '"_dP')

-- make the current file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make the current file executable" })

-- use jk or kj to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

---------------------
-- Plugins Keymaps -------------------

-- conform
keymap.set("n", "<leader>fm", ":Format<CR>", { desc = "Format code" })

-- code-runner
keymap.set("n", "<leader><C-r>", ":RunCode<CR>", { noremap = true, silent = false, desc = "Run Code" })

-- nvim-tree
keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- undo tree
keymap.set("n", "<leader><S-u>", vim.cmd.UndotreeToggle)

-- oil
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-------------------------- COMPETITEST ----------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-b>", ":CompetiTest run<CR>")
map("n", "<C-t>", ":CompetiTest receive problem<CR>")
map("n", "<C-m>", ":CompetiTest add_testcase<CR>")

-------------------------------------------------------------------------
