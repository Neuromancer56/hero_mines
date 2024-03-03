-- Register magma node
minetest.register_node("hero_mines:magma", {
    description = "Magma",
    tiles = {"default_lava.png"},
    light_source = 3,
    groups = {cracky = 3, oddly_breakable_by_hand = 3},
    damage_per_second = 24,
    post_effect_color = {a = 103, r = 255, g = 100, b = 0},
    walkable = false,
    pointable = false,
})


--https://www.youtube.com/watch?v=bpzN0fagzi8&t=42s
--levels

local script_tables = {
	--level 1
	{
		--screen 1
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
	},
	--level 2
	{
		--screen 1
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
	},
	--level 3
	{
		--screen 1
		{"fill_box", 3, -10, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "x", -1},
		{"fill_box", 6, 4, 3, "X", "air", nil, nil, nil},
		{"fill_box", 1, 4, 3, "X", "default:cobble", nil, nil, nil},
		{"fill_box", 10, 4, 3, "X", "air", "default:mese_post_light", "T", 5},
		{"move", "x", -9},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 2
		{"move", "x", -10},
		{"fill_box", 24, 4, 3, "X", "air", "default:mese_post_light", "T", 18},
		{"move", "x", -22},
		{"fill_box", 22, -12, 3, "Y", "air"},
		--screen 3
		{"move", "x", -1},
		{"fill_box", 24, 4, 3, "X", "air", "default:mese_post_light", "T", 0},
		{"move", "x", -7},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", -8},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 4
		{"move", "x", -5},
		{"fill_box", 10, 4, 3, "X", "air", "default:mese_post_light", "T", 3},
		{"fill_box", 1, 4, 3, "X", "default:cobble"},
		{"fill_box", 10, 4, 3, "X", "air", "default:mese_post_light", "T", 3},
		{"move", "x", -5},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", -10},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 5  (:46 lvl done)
		{"move", "x", -5},
		{"fill_box", 13, 4, 3, "X", "air", "default:mese_post_light", "T", 3},
		{"fill_box", 1, 4, 3, "X", "default:cobble"},
		{"fill_box", 8, 4, 3, "X", "air", "default:mese_post_light", "T", 6},
		{"move", "x", -12},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 6
		{"move", "x", -9},
		{"fill_box", 13, 4, 3, "X", "air", "default:chest", "B", 0},
		{"fill_box", 9, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
	},
	--level 4 
	{
		--screen 1 (:55 start lvl)
		{"fill_box", 3, -10, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"fill_box", 6, 4, 3, "X", "air", nil, nil, nil},
		{"fill_box", 1, 4, 3, "X", "default:cobble", nil, nil, nil},
		{"fill_box", 10, 4, 3, "X", "air", "default:mese_post_light", "T", 5},
		{"move", "x", -9},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 2  (:59 start lvl)			
		{"move", "x", 10},
		{"fill_box", -14, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
		{"fill_box", -8, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
		{"move", "x", 21},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", -19},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 3 (1:02 start)
		{"move", "x", -1},
		{"fill_box", 3, 4, 3, "X", "air", "default:mese_post_light", "T", 0},
		{"move", "x", 16},
		{"fill_box", 3, 4, 3, "X", "air", "default:mese_post_light", "T", 0},
		{"move", "x", -4},
		{"fill_box", 2, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", -16},
		{"fill_box", 2, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 4 (1:03 start)
		{"move", "x", -2},
		{"fill_box", 5, 4, 3, "X", "air", "default:mese_post_light", "T", 0},
		{"move", "x", 12},
		{"fill_box", 5, 4, 3, "X", "air", "default:mese_post_light", "T", 5},
		{"move", "x", -2},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", -21},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 5 (1:05 start)
		{"move", "x", 1},
		{"fill_box", 15, 4, 3, "X", "air", "default:mese_post_light", "T", 7},
		{"fill_box", 1, 4, 3, "X", "default:cobble"},
		{"fill_box", 6, 4, 3, "X", "air", "default:mese_post_light", "T", 2},
		{"move", "x", -10},
		{"fill_box", 2, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 6 (1:08 start)
		{"move", "x", 10},
		{"fill_box", -14, 4, 3, "X", "air", "default:mese_post_light", "T", -6},
		{"fill_box", -1, 4, 3, "X", "default:cobble"},
		{"fill_box", -6, 4, 3, "X", "air", "default:mese_post_light", "T", -6},
		{"move", "x", 1},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", 19},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 7 (1:12 start)
		{"move", "x", 1},
		{"fill_box", -18, 4, 3, "X", "air", "default:mese_post_light", "T", -8},
		{"fill_box", -1, 4, 3, "X", "default:cobble"},
		{"fill_box", -5, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
		{"move", "x", 8},
		{"fill_box", 6, -12, 3, "Y", "air", "default:mese_post_light", "T", -11},
		--screen 8 (1:16 start)
		{"move", "x", -6},
		{"move", "y", -3},
		{"fill_box", 8, 4, 3, "X", "air", "default:mese_post_light", "T", 3},
		{"move", "x", 2},
		{"fill_box", 8, 4, 3, "X", "air", "default:chest", "B", 7},
	},
	--level 5
	{
		--screen 1 (1:22 start)
		{"fill_box", 3, -10, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "x", -1},
		{"fill_box", 6, 4, 3, "X", "air", nil, nil, nil},
		{"fill_box", 1, 4, 3, "X", "default:cobble", nil, nil, nil},
		{"fill_box", 10, 4, 3, "X", "air", "default:mese_post_light", "T", 5},
		{"move", "x", -9},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 2 (1:27 start)
		{"move", "x", 10},
		{"fill_box", 3, 4, 3, "X", "hero_mines:magma"},
		{"move", "x", -3},
		{"fill_box", -23, 4, 3, "X", "air", "default:mese_post_light", "T", -15},
		--screen 3 (1:29 start)
		{"fill_box", -24, 4, 3, "X", "air", "default:mese_post_light", "T", -15},
		{"move", "x", 2},
		{"fill_box", 19, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 4 (1:30 start)
		{"fill_box", 5, 4, 3, "X", "hero_mines:magma"},
		{"fill_box", 9, 4, 3, "X", "air"},
		{"fill_box", 8, 4, 3, "X", "hero_mines:magma"},
		{"move", "x", -14},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 4 (1:31 start)
		{"move", "x", 10},
		{"fill_box", -14, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
		{"fill_box", -8, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
		{"move", "x", 21},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", -19},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 5 (1:35 start)
		{"move", "x", -1},
		{"fill_box", -3, 4, 3, "X", "hero_mines:magma",},
		{"move", "x", 3},
		{"fill_box", 4, 4, 3, "X", "air", "default:mese_post_light", "T", 0},
		{"fill_box", 1, 4, 3, "X", "hero_mines:magma"},
		{"fill_box", 17, 4, 3, "X", "air", "default:mese_post_light", "T", 7},
		{"fill_box", 3, 4, 3, "X", "hero_mines:magma",},
		{"move", "x", -15},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 5 (1:38 start)
	},
	--level 6 
	{
		--screen 1 (:55 start lvl)
		{"fill_box", 3, -10, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"fill_box", 6, 4, 3, "X", "air", nil, nil, nil},
		{"fill_box", 1, 4, 3, "X", "default:cobble", nil, nil, nil},
		{"fill_box", 10, 4, 3, "X", "air", "default:mese_post_light", "T", 5},
		{"move", "x", -9},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 2  (:59 start lvl)			
		{"move", "x", 10},
		{"fill_box", -14, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
		{"fill_box", -8, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
		{"move", "x", 21},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", -19},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 3 (1:02 start)
		{"move", "x", -1},
		{"fill_box", 3, 4, 3, "X", "air", "default:mese_post_light", "T", 0},
		{"move", "x", 16},
		{"fill_box", 3, 4, 3, "X", "air", "default:mese_post_light", "T", 0},
		{"move", "x", -4},
		{"fill_box", 2, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", -16},
		{"fill_box", 2, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 4 (1:03 start)
		{"move", "x", -2},
		{"fill_box", 5, 4, 3, "X", "air", "default:mese_post_light", "T", 0},
		{"move", "x", 12},
		{"fill_box", 5, 4, 3, "X", "air", "default:mese_post_light", "T", 5},
		{"move", "x", -2},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", -21},
		{"fill_box", 3, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 5 (1:05 start)
		{"move", "x", 1},
		{"fill_box", 15, 4, 3, "X", "air", "default:mese_post_light", "T", 7},
		{"fill_box", 1, 4, 3, "X", "hero_mines:magma"},
		{"fill_box", 6, 4, 3, "X", "air", "default:mese_post_light", "T", 2},
		{"move", "x", -10},
		{"fill_box", 2, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 6 (1:08 start)
		{"move", "x", 10},
		{"fill_box", -14, 4, 3, "X", "air", "default:mese_post_light", "T", -6},
		{"fill_box", -1, 4, 3, "X", "hero_mines:magma"},
		{"fill_box", -6, 4, 3, "X", "air", "default:mese_post_light", "T", -6},
		{"move", "x", 1},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		{"move", "y", 12},
		{"move", "x", 19},
		{"fill_box", 1, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 7 (1:12 start)
		{"move", "x", 1},
		{"fill_box", -18, 4, 3, "X", "air", "default:mese_post_light", "T", -8},
		{"fill_box", -1, 4, 3, "X", "hero_mines:magma"},
		{"fill_box", -5, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
		{"move", "x", 8},
		{"fill_box", 6, -12, 3, "Y", "air", "default:mese_post_light", "T", -5},
		--screen 8 (1:16 start)
		{"move", "y", 1},
		{"fill_box", -9, 4, 3, "X", "air", "default:mese_post_light", "T", -5},
		{"move", "x", 1},
		{"fill_box", 3, -4, 3, "Y", "air", "default:mese_post_light", "T", -3},
		{"fill_box", -12, 4, 3, "X", "air", "default:mese_post_light", "T", -6},
		{"move", "x", 12},
		{"move", "y", -1},
		{"fill_box", -12, -4, 3, "X", "default:lava_source"},
		{"move", "y", 5},
		{"fill_box", 3, 4, 3, "Y", "air", "default:mese_post_light", "T", 4},
		{"move", "y", -4},
		{"fill_box", -6, 4, 3, "X", "air", "default:mese_post_light", "T", -3},
		{"fill_box", -1, 4, 3, "X", "air", "default:chest", "B", 0},


	}
	
}

--https://www.youtube.com/watch?v=bpzN0fagzi8&t=42s
--levels

for level = 1, #script_tables do
    minetest.register_node("hero_mines:level_" .. level, {
        description = "Script Runner Level " .. level,
        tiles = {"script_runner.png"},
        groups = {cracky = 3, oddly_breakable_by_hand = 1},
        on_punch = function(pos, node, puncher)
            local script_table = script_tables[level]
            run_script(pos, script_table)
        end,
    })
end




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
	{"fill_box", -4, 4, 3, "X", "air", "default:chest", "B", -2},
}



