local api         = vim.api
local diagnostics = vim.diagnostic
local get_mode    = api.nvim_get_mode

-- CONSTANTS: Define static data outside the render function to save memory
local MODES       = {
  ['n']   = 'NORMAL',
  ['i']   = 'INSERT',
  ['v']   = 'VISUAL',
  ['V']   = 'V-LINE',
  ['\22'] = 'V-BLOCK',
  ['c']   = 'COMMAND',
  ['R']   = 'REPLACE',
  ['t']   = 'TERM',
}


-- @return string: The current editor mode name
local function mode_component()
  local m     = get_mode().mode
  local label = MODES[m] or m
  return string.format("[%s]", label)
end

-- @return string: Diagnostics string like "E:1 W:2"
local function diagnostic_component()
  local counts = {
    e = #diagnostics.get(0, { severity = diagnostics.severity.ERROR }),
    w = #diagnostics.get(0, { severity = diagnostics.severity.WARN }),
  }

  local parts = {}
  if counts.e > 0 then table.insert(parts, "E:" .. counts.e) end
  if counts.w > 0 then table.insert(parts, "W:" .. counts.w) end

  if #parts == 0 then return "All Good :)" end

  return " " .. table.concat(parts, " ")
end

local cached_branch = ""
local last_check    = 0

-- @return string: Git status
local function git_component()
  local now = vim.loop.now()
  if now - last_check > 10000 then
    cached_branch = vim.fn.system("git branch --show-current 2> /dev/null"):gsub("\n", "")
    last_check    = now
  end

  if cached_branch == "" then
    return cached_branch
  end

  return " GIT " .. cached_branch -- Using the standard git icon
end

local M = {}
function M.render()
  local sep = " | "
  return table.concat({
    mode_component(),
    sep,
    git_component(),
    sep,
    " %f %m%r",
    sep,
    diagnostic_component(),
    sep,
    "%=",
    sep,
    " %y ",
    sep,
    " %l:%c ",
    sep,
    " %P "
  })
end

function M.setup()
  vim.opt.statusline = "%!v:lua.require('sstl').render()"
end

return M
