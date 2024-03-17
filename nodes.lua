--[[local function performActionOnNode(node_name, action_function)
    local get_connected_players = minetest.get_connected_players
    local wait_table = {}

    local function blockWithinRange(xs, ys, zs, xe, ye, ze, name)
        for x = math.floor(xs), math.floor(xe) do
            for y = math.floor(ys), math.floor(ye) do
                for z = math.floor(zs), math.floor(ze) do
                    if minetest.get_node({x=x, y=y, z=z}).name == name then
                        return true
                    end
                end
            end
        end
        return false
    end

    local function blockTouching(player, name)
        local pos = player:get_pos()
        local spd = player:get_velocity()
        local spdy = math.min(player:get_velocity().y / 10, -0.8)
        return blockWithinRange(pos.x + 0.15, pos.y - 0.08 + spdy, pos.z + 0.15, pos.x + 0.85, pos.y + 2 + spdy, pos.z + 0.85, name)
    end

    minetest.register_globalstep(function(dtime)
        for _, player in pairs(get_connected_players()) do
            local pname = player:get_player_name()
            if not wait_table[pname] then
                if blockTouching(player, node_name) then
                    action_function(player)
                    wait_table[pname] = true
                    minetest.after(0.5, function() wait_table[pname] = nil end)
                end
            end
        end
    end)
end
]]
-- Register magma node
minetest.register_node("hero_mines:magma", {
    description = "Magma",
    tiles = {"default_lava.png"},
    light_source = 3,
    groups = {cracky = 3, oddly_breakable_by_hand = 3},
    --damage_per_second = 24,
    post_effect_color = {a = 103, r = 255, g = 100, b = 0},
    walkable = true,
    pointable = false,
})


local function magmaTouchAction(player)
    player:set_hp(player:get_hp() - 4, "magma")
end

-- Register global step action for magma nodes
registerNodeTouchAction("hero_mines:magma", magmaTouchAction)


-- Define a new node for the broken lantern
--function hero_mines.register_mesepost_broken(name, def)
function register_mesepost_broken(name, def)
	local post_texture = def.texture .. "^default_mese_post_light_side.png^[makealpha:0,0,0"
	local post_texture_dark = def.texture .. "^default_mese_post_light_side_dark.png^[makealpha:0,0,0"
	-- Allow almost everything to be overridden
	local default_fields = {
		wield_image = post_texture,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
			},
		},
		paramtype = "light",
		tiles = {def.texture, def.texture, post_texture_dark, post_texture_dark, post_texture, post_texture},
		use_texture_alpha = "opaque",
		--light_source = default.LIGHT_MAX,
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end

--hero_mines.register_mesepost_broken("hero_mines:broken_mese_post_light", {
	register_mesepost_broken("hero_mines:broken_mese_post_light", {
	description = "Broken Apple Wood Mese Post Light",
	texture = "default_fence_wood.png",
	material = "default:wood",
})

-- Define a new node for a working lantern
function register_mesepost_working(name, def)
	local post_texture = def.texture .. "^default_mese_post_light_side.png^[makealpha:0,0,0"
	local post_texture_dark = def.texture .. "^default_mese_post_light_side_dark.png^[makealpha:0,0,0"
	-- Allow almost everything to be overridden
	local default_fields = {
		wield_image = post_texture,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
			},
		},
		paramtype = "light",
		tiles = {def.texture, def.texture, post_texture_dark, post_texture_dark, post_texture, post_texture},
		use_texture_alpha = "opaque",
		light_source = default.LIGHT_MAX,
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
	}
	for k, v in pairs(default_fields) do
		if def[k] == nil then
			def[k] = v
		end
	end

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end

register_mesepost_working("hero_mines:working_mese_post_light", {
	description = "Working Apple Wood Mese Post Light",
	texture = "default_fence_wood.png",
	material = "default:wood",
})


local function mesepostTouchAction(player)
	local pos = player:get_pos()
	--minetest.swap_node(pos, {name = "hero_mines:broken_mese_post_light", param2 = node.param2})
	for dx = -2, 2 do
		for dy = -2, 2 do
			for dz = -2, 2 do
				local neighbor_pos = {x = pos.x + dx, y = pos.y + dy, z = pos.z + dz}
				local node = minetest.get_node(neighbor_pos)
				
				if node.name == "hero_mines:working_mese_post_light" then
					minetest.swap_node(neighbor_pos, {name = "hero_mines:broken_mese_post_light", param2 = node.param2})
				end
			end
		end
	end
    minetest.sound_play("default_break_glass", {pos = pos, gain = 0.5, max_hear_distance = 10})
end

-- Register global step action for magma nodes
--registerNodeTouchAction("default:mese_post_light", mesepostTouchAction)
registerNodeTouchAction("hero_mines:working_mese_post_light", mesepostTouchAction)


minetest.register_node("hero_mines:trapped_miner", {
	description = "Trapped Miner",
	drawtype = "mesh",
	mesh = "trapped_miner.obj",
	--mesh = "Miner.b3d",
	--paramtype2 = 3,
	tiles = {
		"trapped_miner.png",
		--"texturemedminer.png",
	},
	visual_scale = 1.0,
	--visual_scale = 0.28,
	--visual_scale = 0.1,
	wield_image = "trapped_miner_item.png",
	wield_scale = {x=1.0, y=1.0, z=1.0},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
	},
	inventory_image = "trapped_miner_item.png",
	groups = {choppy = 1, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults()
})

minetest.register_node("hero_mines:rescued_miner", {
	description = "Rescued Miner",
	drawtype = "mesh",
	mesh = "rescued_miner.obj",
	--mesh = "Miner.b3d",
	--paramtype2 = 3,
	tiles = {
		"trapped_miner.png",
		--"texturemedminer.png",
	},
	visual_scale = 1.0,
	--visual_scale = 0.28,
	--visual_scale = 0.1,
	wield_image = "trapped_miner_item.png",
	wield_scale = {x=1.0, y=1.0, z=1.0},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 1, 0.3}
	},
	inventory_image = "trapped_miner_item.png",
	groups = {choppy = 1, oddly_breakable_by_hand = 1},
	sounds = default.node_sound_wood_defaults()
})

local function removeMiner()
	local numberx = 1+2
end

local function minerTouchAction(player)
	local pos = player:get_pos()
	for dx = -2, 2 do
		for dy = -2, 2 do
			for dz = -2, 2 do
				local neighbor_pos = {x = pos.x + dx, y = pos.y + dy, z = pos.z + dz}
				local node = minetest.get_node(neighbor_pos)
				
				if node.name == "hero_mines:trapped_miner" then
					--local newparam2 = 3
					--if (node.param2 == 2) then newparam2 = 1 end
					minetest.swap_node(neighbor_pos, {name = "hero_mines:rescued_miner", param2 = node.param2})
					--minetest.log("x", "replaceminer param2: "..node.param2)
				end
			end
		end
	end
    minetest.sound_play("grunt", {pos = pos, gain = 0.5, max_hear_distance = 10})

	minetest.after(0.5, function()
		for dx = -2, 2 do
			for dy = -2, 2 do
				for dz = -2, 2 do
					local neighbor_pos = {x = pos.x + dx, y = pos.y + dy, z = pos.z + dz}
					local node = minetest.get_node(neighbor_pos)
					if node.name == "hero_mines:rescued_miner" then
						minetest.swap_node(neighbor_pos, {name = "air", param2 = node.param2})
					end
				end
			end
		end
	end)
	local inventory = player:get_inventory()
	inventory:add_item("main", "hero_mines:rescued_miner")
end




-- Register global step action for magma nodes
--registerNodeTouchAction("default:mese_post_light", mesepostTouchAction)
registerNodeTouchAction("hero_mines:trapped_miner", minerTouchAction)



minetest.register_node("hero_mines:toxic_water_source", {
	description = ("Toxic Water Source"),
	drawtype = "liquid",
	waving = 3,
	tiles = {
		{
			name = "default_water_source_animated.png^[colorize:green:40",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "default_water_source_animated.png^[colorize:green:40",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "hero_mines:toxic_water_source",
	liquid_viscosity = 1,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

--[[minetest.register_node("hero_mines:trapped_miner", {
	description = "Trapped Miner",
	drawtype = "mesh",
	drop = "hero_mines:trapped_miner",
	groups = miner_groups,
	inventory_image =  "trapped_miner_item.png",  --***
	mesh = "trapped_miner.obj", --*** .obj, .bd3?
	visual_scale = 0.3,
	on_place = function(itemstack, placer, pointed_thing)
		local pointed_pos = minetest.get_pointed_thing_position(pointed_thing, true)
		local return_value = minetest.item_place(itemstack, placer, pointed_thing, math.random(0,3))
		local node_name = minetest.get_node(pointed_pos).name
			minetest.set_node(pointed_pos, {name = "hero_mines:trapped_miner",
											 param2 = math.random(0,3)})
		--end

		return return_value
	end,
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -0.3125, 0.5},
	},
	collision_box = cbox,
	sunlight_propagates = true,
	tiles = {"trapped_miner.png"},  --***
	walkable = true,
	--sounds = {
		--walk = {name = "default_gravel_footstep", gain = 0.5},
		--},
	sounds = default.node_sound_gravel_defaults(),

})]]

