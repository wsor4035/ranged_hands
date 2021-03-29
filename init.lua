minetest.register_item("ranged_hands:ranged_hand", {
    type = "none",
	wield_scale = {x=1,y=1,z=2.5},
    wield_image = "wieldhand.png",
    range = 15,
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=1},
	}
})

minetest.register_privilege("ranged_hand", "allows enabling the ranged hand")

minetest.register_chatcommand("range_it", {
    privs = {ranged_hand = true},
    params = "<yes/no>",
    description = "the flux is out of balance",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)

        if minetest.is_yes(param) then
            player:get_inventory():set_size("hand", 1)
            player:get_inventory():set_stack("hand", 1, "ranged_hands:ranged_hand")
        elseif param == "n" then
            player:get_inventory():set_size("hand", 0)
            return
        else
            minetest.chat_send_player(name, "please enter y or n")
        end
    end,
})