
--levels
local script_table_level1 = {
    {"fill_box", 3, -10, 3, "Y", "air", "default:mese_post_light", "T", -5},
    {"move", "x", -1},
    {"fill_box", 6, 4, 3, "X", "air", nil, nil, nil},
	{"fill_box", 1, 4, 3, "X", "default:cobble", nil, nil, nil},
	{"fill_box", 10, 4, 3, "X", "air", "default:mese_post_light", "T", 5},
	{"move", "x", -9},
	{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
	--screen 2
	{"move", "x", 10},
	{"fill_box", -10, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
	{"fill_box", -12, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
	{"fill_box", -1, 4, 3, "X", "air", "default:chest", "B", 0},
}

minetest.register_node("hero_mines:level_1", {
    description = "Script Runner Level 1",
    tiles = {"script_runner.png"},
    groups = {cracky = 3, oddly_breakable_by_hand = 1},
    on_punch = function(pos, node, puncher)
		run_script(pos, script_table_level1)
    end,
})


local script_table_level2 = {
    {"fill_box", 3, -10, 3, "Y", "air", "default:mese_post_light", "T", -5},
    {"move", "x", -1},
    {"fill_box", 6, 4, 3, "X", "air", nil, nil, nil},
	{"fill_box", 1, 4, 3, "X", "default:cobble", nil, nil, nil},
	{"fill_box", 10, 4, 3, "X", "air", "default:mese_post_light", "T", 5},
	{"move", "x", -9},
	{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
	--screen 2
	{"move", "x", 10},
	{"fill_box", -14, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
	{"fill_box", -1, 4, 3, "X", "default:cobble"},
	{"fill_box", -6, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
	{"move", "x", 17},
	{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
	{"move", "y", 12},
	{"move", "x", -11},
	{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
	--screen 3
	{"move", "x", -1},
	{"fill_box", 4, 4, 3, "X", "air", "default:mese_post_light", "T", 0},
	{"fill_box", 7, 4, 3, "X", "default:stone"},
	{"fill_box", 5, 4, 3, "X", "air",  "default:mese_post_light", "T", 4},
	{"move", "x", -13},
	{"move", "y", -1},
	{"fill_box", 8, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
	--screen 4
	{"move", "x", -4},
	{"fill_box", 16, 4, 3, "X", "air", "default:mese_post_light", "T", 14},
	{"fill_box", 1, 4, 3, "X", "air", "default:chest", "B", 0},
}


minetest.register_node("hero_mines:level_2", {
    description = "Script Runner Level 2",
    tiles = {"script_runner.png"},
    groups = {cracky = 3, oddly_breakable_by_hand = 1},
    on_punch = function(pos, node, puncher)
		run_script(pos, script_table_level2)
    end,
})

local script_table_levelmagma = {
    {"fill_box", 3, -10, 3, "Y", "air", "default:mese_post_light", "T", -5},
    {"move", "x", -1},
    {"fill_box", 6, 4, 3, "X", "air", nil, nil, nil},
	{"fill_box", 1, 4, 3, "X", "hero_mine_items:magma", nil, nil, nil},
	{"fill_box", 10, 4, 3, "X", "air", "default:mese_post_light", "T", 5},
	{"move", "x", -9},
	{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
	--screen 2
	{"move", "x", 10},
	{"fill_box", -10, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
	{"fill_box", -12, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
	{"fill_box", -1, 4, 3, "X", "air", "default:chest", "B", 0},
}

minetest.register_node("hero_mines:level_magma", {
    description = "Script Runner Level Magma",
    tiles = {"script_runner.png"},
    groups = {cracky = 3, oddly_breakable_by_hand = 1},
    on_punch = function(pos, node, puncher)
		run_script(pos, script_table_levelmagma)
    end,
})
