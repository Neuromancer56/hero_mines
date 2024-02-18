
local function level(name, param)
local player = minetest.get_player_by_name(name)
        if player then
            local level_number = tonumber(param) -- Convert the parameter to a number

            -- Check if the parameter is a valid number
            if level_number and level_number >= 1 and level_number <= 20 then
                local item_name = "hero_mines:level_"..level_number

                -- Clear the inventory
                local inventory = player:get_inventory()

                -- Give the specified level item block
                inventory:add_item("main", item_name)
                
                minetest.chat_send_player(name, "Your inventory has been given the block to create hero mine level "..level_number..".")
            else
                minetest.chat_send_player(name, "Invalid level number. Please specify a level between 1 and 20.")
            end
        else
            minetest.chat_send_player(name, "Player not found.")
        end
end

local function clear_inv(name, param)
        local player = minetest.get_player_by_name(name)
        if player then
            -- Clear the inventory
            local inventory = player:get_inventory()
            inventory:set_list("main", {})

            -- Give basic items blocks
			inventory:add_item("main", "hero_jetpack:jetpack")
            inventory:add_item("main", "hero_tnt:tnt 6")
			inventory:add_item("main", "fire:flint_and_steel")
			inventory:add_item("main", "hero_jetpack:jetpack_fuel 8")
			inventory:add_item("main", "default:sword_diamond")
			
            minetest.chat_send_player(name, "Your inventory has been cleared and replaced with the only items you should use at start of hero mine level.")
        else
            minetest.chat_send_player(name, "Player not found.")
        end
end


minetest.register_chatcommand("level", {
    params = "<level_number>",
    description = "Prepares inventory and health for hero mine level.",
    privs = {interact = true},
    func = function(name, param)
       clear_inv(name, param)
	   level(name, param)
    end,
})


minetest.register_chatcommand("give_level", {
    params = "<level_number>",
    description = "Gives you a script block to create a hero mine for the specified level.",
    privs = {interact = true},
    func = function(name, param)
	   level(name, param)
    end,
})

minetest.register_chatcommand("clear_inv", {
    params = "",
    description = "Clears inventory and replaces it with the only items you should use at start of hero mine level",
    privs = {interact = true},
    func = function(name, param)
       clear_inv(name, param)
    end,
})
