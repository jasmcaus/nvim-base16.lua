local util = require("github-theme.util")
local configModule = require("github-theme.config")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or configModule.config

  local themes = function(options)
    return options[config.themeStyle]
  end

  -- Color Palette
  ---@class ColorScheme
  local colors = {
    none = "NONE",

    -- Core Colors
    fg_dark = themes({dimmed = "#636e7b"}),
    term_fg = themes({dimmed = "#768390"}),

    orange = "#d18616",
    black = themes({dimmed = "#22272e"}),
    brightBlack = themes({dimmed = "#636e7b"}),
    white = themes({dimmed = "#909dab"}),
    brightWhite = themes({dimmed = "#cdd9e5"}),
    red = themes({dimmed = "#ff938a"}),
    brightRed = themes({dimmed = "#ff938a"}),
    green = themes({dimmed = "#6bc46d"}),
    brightGreen = themes({dimmed = "#6bc46d"}),
    yellow = themes({dimmed = "#c69026"}),
    brightYellow = themes({dimmed = "#daaa3f"}),
    blue = themes({dimmed = "#6cb6ff"}),
    brightBlue = themes({dimmed = "#6cb6ff"}),
    magenta = themes({dimmed = "#b083f0"}),
    brightMagenta = themes({dimmed = "#dcbdfb"}),
    cyan = themes({dimmed = "#56d4dd"}),
    brightCyan = themes({dimmed = "#56d4dd"}),

    bg = themes({dimmed = "#22272e"}),
    bg2 = themes({dimmed = "#1e2228"}),
    bg_visual = themes({dimmed = "#444c56"}),
    bg_visual_selection = themes({dimmed = "#264466"}),
    bg_highlight = themes({dimmed = "#2d333b"}),

    fg = themes({dimmed = "#adbac7"}),
    fg_light = themes({dimmed = "#adbac7"}),
    fg_gutter = themes({dimmed = "#768390"}),

    cursor = themes({dimmed = "#6cb6ff"}),

    line_nr = themes({dimmed = "#768390"}),
    cursor_line_nr = themes({dimmed = "#adbac7"}),

    bg_search = themes({dimmed = "#3f3e30"}),

    error = themes({dimmed = "#e5534b"}),
    warning = themes({dimmed = "#cca700"}),
    info = "#75beff",
    hint = themes({dimmed = "#eeeeb3"}),

    lsp = {
      referenceText = themes({dimmed = "#28575d"})
    },

    syntax = {
      comment = themes({dimmed = "#768390"}),
      constant = themes({dimmed = "#6cb6ff"}),
      string = themes({dimmed = "#96d0ff"}),
      variable = themes({dimmed = "#6cb6ff"}),
      keyword = themes({dimmed = "#f47067"}),
      func = themes({dimmed = "#dcbdfb"}),
      func_param = themes({dimmed = "#adbac7"}),
      matchParenBG = themes({dimmed = "#266a70"}),
      tag = themes({dimmed = "#8ddb8c"}),
      htmlArg = themes({dimmed = "#ff938a"}),
      param = themes({dimmed = "#f69d50"}),
      jsonLabel = themes({dimmed = "#6cb6ff"})
    },

    pmenu = {
      select = themes({dimmed = "#373e47"}),
      bg = themes({dimmed = "#323941"}),
      sbar = themes({dimmed = "#363b44"})
    },

    git = {
      change = themes({dimmed = "#daaa3f"}),
      add = themes({dimmed = "#6bc46d"}),
      delete = themes({dimmed = "#b34642"}),
      conflict = themes({dimmed = "#daaa3f"}),
      ignore = themes({dimmed = "#545d68"})
    },

    diff = {
      add = themes({dimmed = "#293d34"}),
      add_fg = themes({dimmed = "#6bc46d"}),
      change = themes({dimmed = "#452700"}),
      change_fg = themes({dimmed = "#daaa3f"}),
      delete = themes({dimmed = "#432b30"}),
      delete_fg = themes({dimmed = "#e5534b"})
    },

    gitSigns = {
      change = themes({dimmed = "#966600"}),
      add = themes({dimmed = "#2b6a30"}),
      delete = themes({dimmed = "#ad2e2c"})
    },

    devIcons = {
      c = "#519aba",
      clojure = "#8dc149",
      coffeescript = "#cbcb41",
      csharp = "#519aba",
      css = "#519aba",
      markdown = "#519aba",
      go = "#519aba",
      html = "#e37933",
      java = "#cc3e44",
      javascript = "#cbcb41",
      json = "#cbcb41",
      less = "#519aba",
      make = "#e37933",
      mustache = "#e37933",
      php = "#a074c4",
      python = "#4e93b3",
      ruby_on_rails = "#cc3e44",
      ruby = "#cc3e44",
      sass = "#f55385",
      scss = "#f55385",
      shellscipt = "#4d5a5e",
      sql = "#f55385",
      typescript = "#519aba",
      xml = "#e37933",
      yml = "#a074c4"

    }

  }

  util.bg = colors.bg
  colors.bg = config.transparent and colors.none or colors.bg

  -- EndOfBuffer colors are configurable
  colors.sidebar_eob = config.darkSidebar and colors.bg2 or colors.bg
  colors.sidebar_eob = config.hideEndOfBuffer and colors.sidebar_eob or colors.fg_light
  colors.sidebar_eob = config.transparent and colors.fg_light or colors.sidebar_eob
  colors.eob = config.hideEndOfBuffer and colors.bg or colors.fg_light
  colors.eob = config.transparent and colors.fg_light or colors.eob

  colors.fg_search = colors.none
  colors.border_highlight = colors.blue
  colors.bg_statusline = colors.blue

  -- Folded colors are configurable
  colors.fg_folded = colors.fg
  colors.bg_folded = colors.bg_visual_selection

  -- Popups always get a dark background
  colors.bg_popup = colors.bg2

  -- Sidebar and Floats are configurable
  colors.bg_sidebar = config.darkSidebar and colors.bg2 or colors.bg
  colors.bg_sidebar = config.transparent and colors.none or colors.bg_sidebar
  colors.bg_float = config.darkFloat and colors.bg2 or colors.bg

  util.color_overrides(colors, config)

  return colors
end

return M