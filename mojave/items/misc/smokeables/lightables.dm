/// MOJAVE SUN THINGS THAT LIGHT STORAGE ///

//Matchbox

/obj/item/storage/box/matches/ms13
	name = "\improper matchbox"
	desc = "A hardy box of robust matches, a slogan on the side claims \"Spark Survival Co. Our matches burn for up to 45 seconds!\""
	icon = 'mojave/icons/objects/tools/lightables_world.dmi'
	icon_state = "matchbox"
	inventory_state = "matchbox"
	world_state = "matchbox"
	component_type = /datum/component/storage/concrete/ms13/matchbox
	lefthand_file = 'mojave/icons/mob/inhands/misc/lightables_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/misc/lightables_righthand.dmi'
	inhand_icon_state = "matchbox"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = null
	foldable = null
	grid_width = 32
	grid_height = 32
	var/max_amount = 20
	var/is_open = FALSE //whether the box is open or not
	var/is_randomised = FALSE

/obj/item/storage/box/matches/ms13/randomised
	is_randomised = TRUE

/obj/item/storage/box/matches/ms13/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = max_amount
	STR.max_combined_w_class = 100
	STR.set_holdable(list(/obj/item/match/ms13))
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/lightables_inventory.dmi', world_state, inventory_state)

/obj/item/storage/box/matches/ms13/PopulateContents()
	if(!is_randomised)
		for(var/i = 1 to max_amount)
			new /obj/item/match/ms13(src)
	else
		for(var/i = 0 to rand(0, max_amount))
			new /obj/item/match/ms13(src)

/obj/item/storage/box/matches/ms13/attack_hand_secondary(mob/user, list/modifiers)
	attack_hand(user, modifiers)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/storage/box/matches/ms13/alt_click_on_secondary(mob/user)
	attack_hand(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/storage/box/matches/ms13/AltClick(mob/user)
	attack_hand(user)
	return

/obj/item/storage/box/matches/ms13/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/match) && !is_open)
		to_chat(user, "<span class='danger'>[src] is closed.</span>")
		return
	else
		. = ..()

/obj/item/storage/box/matches/ms13/attackby_secondary(obj/item/match/W as obj, mob/user, params)
	if(istype(W, /obj/item/match))
		W.matchignite(user)
		W.update_appearance()
		W.update_overlays()
		W.update_icon()
		W.build_worn_icon()
		user.update_inv_hands()
		W.set_light_on(TRUE)
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/item/storage/box/matches/ms13/update_icon_state()
	. = ..()
	box_check()
	update_overlays()

/obj/item/storage/box/matches/ms13/update_overlays()
	. = ..()
	cut_overlays()
	if(is_open && contents.len && item_flags & IN_INVENTORY)
		switch(contents.len)
			if(1 to 6) //I know it can be done easier, but it was bugging out and im outta time
				add_overlay(image(icon = 'mojave/icons/objects/tools/lightables_inventory.dmi', icon_state = "match_overlay_1"))
			if(7 to 12)
				add_overlay(image(icon = 'mojave/icons/objects/tools/lightables_inventory.dmi', icon_state = "match_overlay_2"))
			if(13 to 20)
				add_overlay(image(icon = 'mojave/icons/objects/tools/lightables_inventory.dmi', icon_state = "match_overlay_3"))


/obj/item/storage/box/matches/ms13/MouseDrop()
	if(!is_open && (usr.stat != DEAD))
		to_chat(usr, "<span class='danger'>[src] is closed.</span>")
		return COMPONENT_NO_MOUSEDROP
	else
		return . = ..()

/obj/item/storage/box/matches/ms13/attack_hand(mob/user, list/modifiers)
	if(!ismob(user))
		return
	if(!user.is_holding(src))
		return . = ..()
	if(!loc == user)
		return . = ..()
	if(!is_open)
		to_chat(user, "<span class='danger'>[src] is closed.</span>")
		return
	var/obj/item/match/ms13/match = locate(/obj/item/match/ms13) in contents
	box_check()
	if(match)
		if(user && contents.len > 0)
			var/obj/item/match/ms13/W = match
			SEND_SIGNAL(src, COMSIG_TRY_STORAGE_TAKE, W, user)
			user.put_in_hands(W)
			contents -= W
			to_chat(user, "<span class='notice'>You take \a [W] out of the box.</span>")
			update_appearance()
			update_overlays()
			update_icon()
		return
	else
		to_chat(user, "<span class='notice'>There are no matches left in the box.</span>")

/obj/item/storage/box/matches/ms13/attack_self(mob/user)
	if(do_after(user, 0.5 SECONDS, src))
		if(!is_open)
			playsound(src, 'mojave/sound/ms13effects/matchboxopen.ogg', 200)
			is_open = TRUE
			update_appearance()
			box_check()
			update_overlays()
			update_icon()
			return
		if(is_open)
			playsound(src, 'mojave/sound/ms13effects/matchboxclose.ogg', 200)
			is_open = FALSE
			update_appearance()
			box_check()
			update_overlays()
			update_icon()
			return

/obj/item/storage/box/matches/ms13/proc/box_check()
	if(is_open && contents.len)
		inventory_state = "[initial(inventory_state)]_open"
	if(!is_open && contents.len)
		inventory_state = "[initial(inventory_state)]"
	if(is_open && !(contents.len))
		inventory_state = "matchbox_empty"

/obj/item/storage/box/matches/ms13/Exited(atom/movable/gone, direction)
	. = ..()
	playsound(src, 'mojave/sound/ms13effects/matchremove.ogg', 200)

/obj/item/storage/box/matches/ms13/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	playsound(src, 'mojave/sound/ms13effects/matchplace.ogg', 200)

//Match

/obj/item/match/ms13
	name = "match"
	desc = "A robust match, a rare thing in these trying times."
	icon_state = "match_unlit"
	icon = 'mojave/icons/objects/tools/lightables_world.dmi'
	icon_state = "match"
	inventory_state = "match"
	world_state = "match"
	lefthand_file = 'mojave/icons/mob/inhands/misc/lightables_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/misc/lightables_righthand.dmi'
	inhand_icon_state = "match"
	smoketime = 45 SECONDS
	grind_results = null
	grid_width = 32
	grid_height = 32
	light_system = MOVABLE_LIGHT
	light_range = 1
	light_power = 0.6
	light_color = LIGHT_COLOR_FIRE

/obj/item/match/ms13/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/lightables_inventory.dmi', world_state, inventory_state)
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/match/ms13/Initialize(mapload)
	. = ..()
	set_light_on(FALSE)

/obj/item/match/ms13/process(delta_time)
	smoketime -= 1 SECONDS
	if(lit)
		world_state = "match_lit"
		inhand_icon_state = "match_lit"
		update_appearance()
		update_overlays()
		update_icon()
	if(smoketime <= 0)
		world_state = "match_burnt"
		inhand_icon_state = "match_burnt"
		update_appearance()
		update_overlays()
		update_icon()
		matchburnout(src)
	else
		open_flame(heat)

/obj/item/match/ms13/update_icon_state()
	. = ..()
	if(lit)
		world_state = "match_lit"
		inhand_icon_state = "match_lit"
		switch(smoketime)
			if(0 to 60)
				inventory_state = "[initial(inventory_state)]_lit_5"
			if(60 to 150)
				inventory_state = "[initial(inventory_state)]_lit_4"
			if(160 to 250)
				inventory_state = "[initial(inventory_state)]_lit_3"
			if(260 to 350)
				inventory_state = "[initial(inventory_state)]_lit_2"
			if(360 to 500)
				inventory_state = "[initial(inventory_state)]_lit_1"
	if(burnt || smoketime <= 0)
		inventory_state = "match_burnt"
		world_state = "match_burnt"
		inhand_icon_state = "match_burnt"
		return

/obj/item/match/ms13/matchignite(mob/user)
	if(lit || burnt)
		return

	playsound(src, 'mojave/sound/ms13effects/matchlight.ogg', 100, TRUE)
	lit = TRUE
	set_light_on(TRUE)
	damtype = BURN
	force = 3
	inventory_state = "[initial(inventory_state)]_lit_5"
	world_state = "match_lit"
	inhand_icon_state = "match_lit"
	name = "lit [initial(name)]"
	desc = "A [initial(name)]. This one is lit."
	attack_verb_continuous = string_list(list("burns", "singes"))
	attack_verb_simple = string_list(list("burn", "singe"))
	START_PROCESSING(SSobj, src)
	update_appearance()
	update_overlays()
	update_icon()

/obj/item/match/ms13/matchburnout()
	if(!lit)
		return

	lit = FALSE
	set_light_on(FALSE)
	playsound(src, 'mojave/sound/ms13effects/smokeables/cigsnuff.ogg', 25, 1)
	burnt = TRUE
	damtype = BRUTE
	force = initial(force)
	update_appearance()
	update_overlays()
	update_icon()
	inventory_state = "match_burnt"
	world_state = "match_burnt"
	inhand_icon_state = "match_burnt"
	name = "burnt [initial(name)]"
	desc = "A [initial(name)]. This one has seen better days."
	attack_verb_continuous = string_list(list("flicks"))
	attack_verb_simple = string_list(list("flick"))
	STOP_PROCESSING(SSobj, src)

/obj/item/match/ms13/attack_self(mob/user)
	if(lit)
		playsound(src, 'mojave/sound/ms13effects/smokeables/cigsnuff.ogg', 25, 1)
		update_appearance()
		update_overlays()
		update_icon()
		matchburnout(src)
		user.visible_message("<span class='notice'>[user] pinches \the end of [src], putting it out.</span>")
		smoketime = 0

// Zippo

/obj/item/lighter/ms13/zippo
	name = "Zippo lighter"
	desc = "A truly robust zippo lighter, still pristine after everything its gone through."
	icon_state = "zippo"
	icon = 'mojave/icons/objects/tools/lightables_world.dmi'
	icon_state = "zippo"
	inventory_state = "zippo"
	world_state = "zippo"
	lefthand_file = 'mojave/icons/mob/inhands/misc/lightables_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/misc/lightables_righthand.dmi'
	inhand_icon_state = "zippo"
	slot_flags = null
	var/max_fuel = 50
	overlay_list = null
	var/is_open = FALSE

/obj/item/lighter/ms13/zippo/Initialize(mapload)
	. = ..()
	var/fuel_start = rand(10, max_fuel)
	create_reagents(fuel_start)
	reagents.add_reagent(/datum/reagent/fuel, fuel_start)
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/lightables_inventory.dmi', world_state, inventory_state)
	update_appearance()

/obj/item/lighter/ms13/zippo/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Use it to open, use again to ignite. Right Click/Use to close.</span>"

/obj/item/lighter/ms13/proc/get_fuel()
	return reagents.get_reagent_amount(/datum/reagent/fuel)

/obj/item/lighter/ms13/zippo/update_overlays()
	if(lit && item_flags & IN_INVENTORY)
		var/mutable_appearance/overlay = mutable_appearance('mojave/icons/objects/tools/lightables_inventory.dmi')
		overlay.icon_state = "zippo_flame"
		add_overlay(image(icon, icon_state = overlay.icon_state))
	else
		cut_overlays()
	. = ..()

/obj/item/lighter/ms13/zippo/process()
	if(!is_open)
		set_lit(FALSE)
		inhand_icon_state = "zippo"
		world_state = "zippo"
		return
	if(lit)
		reagents.remove_reagent(/datum/reagent/fuel, 0.05)
		update_appearance()
		update_overlays()
		update_icon()
		inhand_icon_state = "zippo_on"
		world_state = "zippo_on"
		if(get_fuel() <= 0)
			set_lit(FALSE)
			inhand_icon_state = "zippo_open"
			world_state = "zippo_open"

/obj/item/lighter/ms13/zippo/attack_self()
	if(!is_open)
		playsound(src, 'mojave/sound/ms13effects/zippoopen.ogg', 100)
		is_open = TRUE
		inventory_state = "[initial(inventory_state)]_open"
		inhand_icon_state = "zippo_open"
		world_state = "zippo_open"
		update_appearance()
		update_overlays()
		update_icon()
		return
	if(is_open && get_fuel() > 0 && !lit)
		playsound(src, 'mojave/sound/ms13effects/zippolight.ogg', 100)
		set_lit(TRUE)
		inhand_icon_state = "zippo_on"
		world_state = "zippo_on"
		update_appearance()
		update_overlays()
		update_icon()
		return
	if(is_open && lit)
		playsound(src, 'mojave/sound/ms13effects/zippoclose.ogg', 100)
		set_lit(FALSE)
		is_open = FALSE
		inventory_state = initial(inventory_state)
		inhand_icon_state = "zippo"
		world_state = "zippo"
		update_appearance()
		update_overlays()
		update_icon()
		return
	if(is_open)
		playsound(src, 'mojave/sound/ms13effects/zippoclose.ogg', 100)
		set_lit(FALSE)
		is_open = FALSE
		inventory_state = initial(inventory_state)
		inhand_icon_state = "zippo"
		world_state = "zippo"
		update_appearance()
		update_overlays()
		update_icon()
		return
	else
		playsound(src, 'mojave/sound/ms13effects/zippoempty.ogg', 100)
		update_appearance()
		update_overlays()
		update_icon()

/obj/item/lighter/ms13/zippo/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, /obj/item/reagent_containers/ms13/lighterfluid) && is_open)
		if(!I.reagents.has_reagent(/datum/reagent/fuel))
			to_chat(user, span_warning("[src] is out of fluid!"))
			return
		if(reagents.has_reagent(/datum/reagent/fuel, max_fuel))
			to_chat(user, span_warning("Your [name] is already full!"))
			return
		I.reagents.trans_to(src, max_fuel, transfered_by = user)
		user.visible_message(span_notice("[user] refills [user.p_their()] [name]."), span_notice("You refill [name]."))
		playsound(src, 'sound/effects/refill.ogg', 50, TRUE)
		update_appearance()
	if(istype(I, /obj/item/reagent_containers/ms13/lighterfluid) && !is_open)
		to_chat(usr, "<span class='danger'>[src] is closed.</span>")
	return ..()

/obj/item/lighter/ms13/zippo/attack_self_secondary(mob/user)
	. = ..()
	if(is_open)
		playsound(src, 'mojave/sound/ms13effects/zippoclose.ogg', 100)
		set_lit(FALSE)
		is_open = FALSE
		inhand_icon_state = "zippo"
		world_state = "zippo"
		inventory_state = initial(inventory_state)
		update_appearance()
		update_overlays()
		update_icon()
		return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

// Universal Lighter Fluid

/obj/item/reagent_containers/ms13/lighterfluid
	name = "universal lighter fluid"
	desc = "Universal lighter fluid, works in anything that needs a flame."
	icon_state = "butane"
	icon = 'mojave/icons/objects/tools/lightables_world.dmi'
	icon_state = "butane"
	inventory_state = "butane"
	world_state = "butane"
	lefthand_file = 'mojave/icons/mob/inhands/misc/lightables_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/misc/lightables_righthand.dmi'
	inhand_icon_state = "butane"
	volume = 100 // 2 and half welder refills
	list_reagents = list(/datum/reagent/fuel = 100)
	grid_width = 32
	grid_height = 64

/obj/item/reagent_containers/ms13/lighterfluid/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/lightables_inventory.dmi', world_state, inventory_state)
