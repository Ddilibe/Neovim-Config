local alpha = require("alpha")
local plenary = require("plenary.job")
local dashboard = require("alpha.themes.dashboard")

local snake_frames = {[[
██▒▒
   ██▒▒
      ██▒▒
  ]], [[
   ██▒▒
      ██▒▒
██▒▒
  ]], [[
      ██▒▒
██▒▒
   ██▒▒
  ]], [[
██▒▒██▒▒
   ██▒▒
  ]], [[
   ██▒▒██▒▒
██▒▒
  ]], [[
██▒▒
      ██▒▒██▒▒
  ]], [[
██▒▒
   ██▒▒
      ██▒▒██▒▒
  ]], [[
   ██▒▒
██▒▒██▒▒
      ██▒▒
  ]], [[
██▒▒██▒▒
      ██▒▒
   ██▒▒
  ]], [[
      ██▒▒
   ██▒▒██▒▒
██▒▒
  ]], [[
   ██▒▒
      ██▒▒
██▒▒██▒▒
  ]], [[
██▒▒
   ██▒▒██▒▒
      ██▒▒
  ]]}

-- Current frame index
local frame = 1

-- Function to update snake animation

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

-- Footer
-- dashboard.section.footer.val = "Happy Coding with Mangino 🚀"

-- Highlight groups
for _, section in ipairs({dashboard.section.header, dashboard.section.buttons, dashboard.section.footer}) do
    section.opts.hl = "Type"
end

-- local function fetch_quote(callback)
--     plenary:new({
--         command = "curl",
--         args = {"-s", "-H", "X-Api-Key: YOUR_API_NINJAS_KEY",
--                 "http://api.quotable.io/quotes/random?tags=technology,famous-quotes"},
--         on_exit = function(j, return_val)
--             if return_val == 0 then
--                 local result = j:result()[1] or ""
--                 -- API returns JSON like: [{"quote":"...","author":"..."}]
--                 local ok, data = pcall(vim.fn.json_decode, table.concat(j:result(), ""))
--                 if ok and data and data[1] then
--                     local quote = string.format("“%s” — %s", data[0].content, data[1].authorSlug)
--                     callback(quote)
--                 end
--             end
--         end
--     }):start()
-- end

-- -- Initialize footer
-- -- dashboard.section.footer.val = "Fetching motivational quote..."
-- -- alpha.setup(dashboard.opts)

-- -- Function to update footer every 4 seconds
-- local function update_footer()
--     fetch_quote(function(quote)
--         dashboard.section.footer.val = "Happy Coding with Mangino 🚀"
--         vim.schedule(function()
--             alpha.update()
--         end)
--     end)
-- end

-- update_footer()

-- -- Timer to update quote every 4 seconds
-- local timer = vim.loop.new_timer()
-- timer:start(1000, 4000, vim.schedule_wrap(update_footer))

alpha.setup(dashboard.opts)
