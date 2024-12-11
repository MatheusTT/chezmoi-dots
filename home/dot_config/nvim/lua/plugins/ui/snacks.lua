return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
	=================     ===============     ===============   ========  ========
	\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
	||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
	|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
	||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
	|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
	||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
	|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
	||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
	||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
	||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
	||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
	||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
	||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
	||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
	||.=='    _-'                                                     `' |  /==.||
	=='    _-'                        N E O V I M                         \/   `==
	\   _-'                                                                `-_   /
	 `''                                                                      ``' 
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
        },
      },
    },
  },
}