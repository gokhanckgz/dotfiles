require("dapui").setup()


local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


-- Start debugging session
vim.keymap.set("n", "<localleader>ds", function()
  dap.continue()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false) -- Spaces buffers evenly
end, { desc = "Start Debugger" })

-- Set breakpoints, get variable values, step into/out of functions, etc.
vim.keymap.set("n", "<localleader>dl", require("dap.ui.widgets").hover, { desc = "Widget Hover" })
vim.keymap.set("n", "<localleader>dc", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<localleader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<localleader>dn", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<localleader>di", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<localleader>do", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<localleader>dC", function()
  dap.clear_breakpoints()
  require("notify")("Breakpoints cleared", "warn")
end, { desc = "Clear Breakpoints" })

-- Close debugger and clear breakpoints
vim.keymap.set("n", "<localleader>de", function()
  dap.clear_breakpoints()
  dap.terminate()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
  require("notify")("Debugger session ended", "warn")
end, { desc = "Close Debugger" })

vim.keymap.set("n", "<localleader>df", function()
  dapui.float_element(nil, { width = 130, height = 30, position = 'center' })
end, { desc = "Float Window" })

vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })
