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
    player:set_hp(player:get_hp() - 1, "magma")
end

-- Register global step action for magma nodes
registerNodeTouchAction("hero_mines:magma", magmaTouchAction)


-- Define a new node for the broken lantern
function default.register_mesepost(name, def)
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

default.register_mesepost("hero_mines:broken_mese_post_light", {
	description = "Broken Apple Wood Mese Post Light",
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
				
				if node.name == "default:mese_post_light" then
					minetest.swap_node(neighbor_pos, {name = "hero_mines:broken_mese_post_light", param2 = node.param2})
				end
			end
		end
	end
    minetest.sound_play("default_break_glass", {pos = pos, gain = 0.5, max_hear_distance = 10})
end

-- Register global step action for magma nodes
registerNodeTouchAction("default:mese_post_light", mesepostTouchAction)