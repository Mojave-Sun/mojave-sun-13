/client/proc/spawn_vapour()
	set category = "Admin.Fun"
	set name = "Spawn Vapour"
	set desc = "Spawns an amount of chosen vapour at your current location."

	var/list/singleton_list = SSvapour.singletons
	var/choice = tgui_input_list(usr, "What type of vapour would you like to spawn?", "Spawn Vapour", singleton_list)
	if(!choice)
		return
	var/amount_choice = input("Amount of vapour:") as null|num
	if(!amount_choice)
		return
	var/turf/epicenter = get_turf(mob)
	epicenter.VapourTurf(choice, amount_choice)
	message_admins("[ADMIN_LOOKUPFLW(usr)] spawned vapour at [epicenter.loc] ([choice] - [amount_choice]).")
	log_admin("[key_name(usr)] spawned vapour at [epicenter.loc] ([choice] - [amount_choice]).")
