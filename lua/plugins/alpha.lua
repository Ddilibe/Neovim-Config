local alpha = require("alpha")
local plenary = require("plenary.job")
local dashboard = require("alpha.themes.dashboard")

-- Current frame index
local frame = 1

-- Dashboard layout

dashboard.section.header.val =
    {"███╗   ███╗ █████╗ ███╗   ██╗ ██████╗ ██╗███╗   ██╗ ██████╗ ",
     "████╗ ████║██╔══██╗████╗  ██║██╔════╝ ██║████╗  ██║██╔═══██║",
     "██╔████╔██║███████║██╔██╗ ██║██║  ███╗██║██╔██╗ ██║██║   ██║",
     "██║╚██╔╝██║██╔══██║██║╚██╗██║██║   ██║██║██║╚██╗██║██║   ██║",
     "██║ ╚═╝ ██║██║  ██║██║ ╚████║╚██████╔╝██║██║ ╚████║╚██████╔╝",
     "╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ "}
local python_frames = {"🐍───", "─🐍──", "──🐍─", "───🐍", "──🐍─",
                       "─🐍──"}

local function center(text, width)
    width = width or 80
    local pad = math.floor((width - #text) / 2)
    if pad < 0 then
        pad = 0
    end
    return string.rep(" ", pad) .. text
end
local function update_snake()
    frame = frame + 1
    if frame > #python_frames then
        frame = 1
    end
    dashboard.section.footer.val = center(python_frames[frame] .. "\nHappy Coding with Mangino 🚀", 65)

    pcall(vim.cmd.AlphaRedraw)
end

local timer = vim.loop.new_timer()
timer:start(1000, 1000, vim.schedule_wrap(update_snake))

-- Buttons (quick actions)
dashboard.section.buttons.val = {dashboard.button("e", "⮩  New File", ":ene <BAR> startinsert<CR>"),
                                 dashboard.button("f", "⮩  Find File", ":Telescope find_files<CR>"),
                                 dashboard.button("r", "⮩  Recent Files", ":Telescope oldfiles<CR>"),
                                 dashboard.button("p", "⮩  Projects", ":Telescope projects<CR>"),
                                 dashboard.button("q", "⮩  Quit", ":qa<CR>")}

for _, section in ipairs({dashboard.section.header, dashboard.section.buttons, dashboard.section.footer}) do
    section.opts.hl = "Type"
end

alpha.setup(dashboard.opts)
