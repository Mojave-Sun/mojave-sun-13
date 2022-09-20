//MS13 WINDOW FRAME/PANES STORAGE//

//MS13 BASE FRAME//

/obj/structure/ms13/frame
	icon_state = "test"
	icon = 'mojave/icons/structure/windows/frames.dmi'
	name = "base class ms13 window frame"
	desc = "An old window frame."
	plane = WALL_PLANE
	layer = CLOSED_TURF_LAYER
	density = TRUE
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	can_atmos_pass = ATMOS_PASS_YES
	flags_1 = ON_BORDER_1
	var/passchance = 60 //windowframes give minor cover
	var/mutable_appearance/side_1
	var/mutable_appearance/side_2
	var/mutable_appearance/side_3

/obj/structure/ms13/frame/Initialize()
	. = ..()
	var/static/list/loc_connections = list(
		COMSIG_ATOM_EXIT = .proc/on_exit,
	)

	AddElement(/datum/element/climbable, climb_time = 3 SECONDS, climb_stun = 0, no_stun = TRUE, jump_over = TRUE, jump_north = 10, jump_south = 15, jump_sides = 7)
	update_appearance()

	if (flags_1 & ON_BORDER_1)
		AddElement(/datum/element/connect_loc, loc_connections)
	if(dir == SOUTH)
		layer = ABOVE_ALL_MOB_LAYER

/obj/structure/ms13/frame/update_overlays()
	. = ..()
	switch(dir)
		if(EAST)
			icon_state = ""
			side_1 = mutable_appearance(icon = src.icon, icon_state = "[initial(icon_state)]_t - E", layer = BELOW_OBJ_LAYER, plane = GAME_PLANE)
			. += side_1
			side_2 = mutable_appearance(icon = src.icon, icon_state = "[initial(icon_state)]_m - E", plane = OVER_TILE_PLANE)
			. += side_2
			side_3 = mutable_appearance(icon = src.icon, icon_state = "[initial(icon_state)]_f - E", layer = ABOVE_MOB_LAYER, plane = ABOVE_GAME_PLANE)
			. += side_3
		if(WEST)
			icon_state = ""
			side_1 = mutable_appearance(icon = src.icon, icon_state = "[initial(icon_state)]_t - W", layer = BELOW_OBJ_LAYER, plane = GAME_PLANE)
			. += side_1
			side_2 = mutable_appearance(icon = src.icon, icon_state = "[initial(icon_state)]_m - W", plane = OVER_TILE_PLANE)
			. += side_2
			side_3 = mutable_appearance(icon = src.icon, icon_state = "[initial(icon_state)]_f - W", layer = ABOVE_MOB_LAYER, plane = ABOVE_GAME_PLANE)
			. += side_3

/proc/valid_frame_location(turf/dest_turf, test_dir)
	if(!dest_turf)
		return FALSE
	for(var/obj/turf_content in dest_turf)
		if(istype(turf_content, /obj/structure/ms13/frame))
			if((turf_content.dir == test_dir))
				return FALSE
	return TRUE

/obj/structure/ms13/frame/proc/window_check()
	var/obj/structure/window/ms13/window = locate() in loc
	if(window)
		density = FALSE

/obj/structure/ms13/frame/CanAllowThrough(atom/movable/mover, border_dir)
	. = ..()

	window_check()

	if(istype(mover, /obj/projectile))
		return TRUE

	if(istype(mover, /obj/projectile/bullet))
		return TRUE

	if(istype(mover, /obj/item))
		return TRUE

	if(.)
		return

	if(ismob(mover))
		if(get_dir(loc, src) == dir)
			return

	if(border_dir == dir)
		return FALSE

	if(istype(mover, /obj/structure/ms13/frame))
		var/obj/structure/ms13/frame/moved_frame = mover
		return valid_frame_location(loc, moved_frame.dir)

	return TRUE

/obj/structure/ms13/frame/proc/on_exit(datum/source, atom/movable/leaving, direction)
	SIGNAL_HANDLER

	window_check()

	if(istype(leaving, /obj/projectile) && prob(passchance))
		return

	if(istype(leaving, /obj/projectile/bullet) && prob(passchance))
		return

	if(istype(leaving, /obj/item))
		return

	if(leaving == src)
		return // Let's not block ourselves.

	if (leaving.pass_flags & pass_flags_self)
		return

	if(direction == dir && density)
		leaving.Bump(src)
		return COMPONENT_ATOM_BLOCK_EXIT

//MS13 BASE PANE//

/obj/structure/window/ms13
	name = "base MS13 window pane"
	desc = "A window."
	icon = 'mojave/icons/structure/windows/panes.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	max_integrity = 35
	damage_deflection = 5
	glass_type = /obj/item/stack/sheet/ms13/glass
	glass_amount = 1
	break_sound = 'mojave/sound/ms13effects/glass_break.ogg'
	hitted_sound = 'mojave/sound/ms13effects/glass_hit.ogg'
	knock_sound = 'mojave/sound/ms13effects/glass_knock.ogg'
	var/has_crack_overlay = TRUE
	var/crack_overlay_type = "basic"
	var/breaking = FALSE

/obj/structure/window/ms13/examine(mob/user)
	. = ..()
	. += span_notice("You can <b>right click</b> the window <b>in combat mode</b> to try smashing it bare handed.")

/obj/structure/window/ms13/attack_hand_secondary(mob/user, params)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!iscarbon(user))
		return
	var/mob/living/carbon/C = user
	if(!C.combat_mode)
		return
	if(!breaking)
		visible_message(span_warning("[C] is attempting to bash down the [src]!"))
		to_chat(C, span_notice("You attempt to bash the [src] with your elbow!"))
		breaking = TRUE
		if(do_after(C, 5 SECONDS))
			if(C.gloves && armor.melee < 50)
				visible_message(span_warning("[C] bashes against the [src], cracking it!"))
				take_damage(10, BRUTE, MELEE)
				update_appearance()
				playsound(loc, 'mojave/sound/ms13effects/glass_hit.ogg', 25, 1, -1)
				breaking = FALSE
				return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
			else
				visible_message(span_warning("[C] bashes against the [src] with their bare arm, ouch!"))
				C.emote("scream")
				take_damage(5, BRUTE, MELEE)
				update_appearance()
				playsound(loc, 'mojave/sound/ms13effects/glass_hit.ogg', 25, 1, -1)
				var/which_hand = BODY_ZONE_L_ARM
				if(!(C.active_hand_index % 2))
					which_hand = BODY_ZONE_R_ARM
				var/obj/item/bodypart/ouch = C.get_bodypart(which_hand)
				ouch.receive_damage(15)
				if(prob(30))
					ouch.receive_damage(15, wound_bonus = 15)
				breaking = FALSE
				return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
		else
			breaking = FALSE
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/structure/window/ms13/update_overlays()
	. = ..()
	var/ratio = atom_integrity / max_integrity
	ratio = CEILING(ratio*4, 1) * 25
	cut_overlay(crack_overlay)
	if(ratio > 75)
		return
	if(has_crack_overlay)
		switch(dir)
			if(NORTH)
				crack_overlay = mutable_appearance(icon, "[crack_overlay_type]_[ratio] - N", (4.6), GAME_PLANE_FOV_HIDDEN)
			if(SOUTH)
				crack_overlay = mutable_appearance(icon, "[crack_overlay_type]_[ratio] - S", (4.6), GAME_PLANE_FOV_HIDDEN)
			if(EAST)
				crack_overlay = mutable_appearance(icon, "[crack_overlay_type]_[ratio] - E", (4.6), GAME_PLANE_FOV_HIDDEN)
			if(WEST)
				crack_overlay = mutable_appearance(icon, "[crack_overlay_type]_[ratio] - W", (4.6), GAME_PLANE_FOV_HIDDEN)
		. += crack_overlay

/obj/structure/window/ms13/Destroy()
	var/obj/structure/ms13/frame/frame = locate() in loc
	if(frame)
		frame.density = TRUE
	. = ..()

/obj/structure/window/ms13/can_be_reached(mob/user)
	return TRUE

/obj/structure/window/ms13/spawnDebris(location)
	. = list()
	. += new /obj/item/stack/sheet/ms13/glass(location)
	. += new /obj/effect/decal/cleanable/glass(location)

/obj/structure/window/ms13/reinforced
	name = "base MS13 reinforced window pane"
	desc = "A window protected by metal bars."
	max_integrity = 250
	armor = list(MELEE = 75, BULLET = 75, LASER = 75, ENERGY = 75, BOMB = 25, BIO = 100, FIRE = 80, ACID = 100)
	receive_ricochet_chance_mod = 0.75
	damage_deflection = 20
	has_crack_overlay = FALSE //wisi

/obj/structure/window/ms13/reinforced/spawnDebris(location)
	. = list()
	. += new /obj/item/stack/sheet/ms13/glass(location)
	. += new /obj/item/stack/sheet/ms13/scrap(location)
	. += new /obj/effect/decal/cleanable/glass(location)

//MS13 FRAME TYPES//

/obj/structure/ms13/frame/sewer
	icon_state = "sewer"
	name = "sewer window frame"
	desc = "A sewer window frame. Gross."

/obj/structure/ms13/frame/brick
	icon_state = "brick"
	name = "brick window frame"
	desc = "A brick window frame."

/obj/structure/ms13/frame/brickalt
	icon_state = "brickalt"
	name = "brick window frame"
	desc = "A brick window frame."

/obj/structure/ms13/frame/brickgray
	icon_state = "brickgray"
	name = "brick window frame"
	desc = "A brick window frame."

/obj/structure/ms13/frame/concrete
	icon_state = "concrete"
	name = "concrete window frame"
	desc = "A concrete window frame."

/obj/structure/ms13/frame/concretealt
	icon_state = "concretealt"
	name = "concrete window frame"
	desc = "A concrete window frame."

/obj/structure/ms13/frame/dungeon
	icon_state = "dungeon"
	name = "bunker window frame"
	desc = "A bunker window frame."

/obj/structure/ms13/frame/dungeonrust
	icon_state = "dungeonrust"
	name = "bunker window frame"
	desc = "A bunker window frame."

/obj/structure/ms13/frame/rmetal
	icon_state = "rmetal"
	name = "reinforced metal window frame"
	desc = "A reinforced metal window frame."

/obj/structure/ms13/frame/rmetalrust
	icon_state = "rrustmetal"
	name = "rusted reinforced metal window frame"
	desc = "A rusted reinforced metal window frame."

/obj/structure/ms13/frame/metalrust
	icon_state = "rustmetal"
	name = "metal window frame"
	desc = "A metal window frame."

/obj/structure/ms13/frame/metal
	icon_state = "metal"
	name = "metal window frame"
	desc = "A metal window frame."

/obj/structure/ms13/frame/scrap
	icon_state = "scrap"
	name = "scrap window frame"
	desc = "A scrap window frame."

/obj/structure/ms13/frame/scrapred
	icon_state = "scrapred"
	name = "scrap window frame"
	desc = "A scrap window frame."

/obj/structure/ms13/frame/scrapblue
	icon_state = "scrapblue"
	name = "scrap window frame"
	desc = "A scrap window frame."

/obj/structure/ms13/frame/scrapwhite
	icon_state = "scrap"
	name = "scrap window frame"
	desc = "A scrap window frame."

/obj/structure/ms13/frame/vault
	icon_state = "vault"
	name = "vault window frame"
	desc = "A vault window frame."

/obj/structure/ms13/frame/vaultrust
	icon_state = "rustvault"
	name = "rusted vault window frame"
	desc = "A rusted vault window frame."

/obj/structure/ms13/frame/wood
	icon_state = "wood"
	name = "wooden window frame"
	desc = "A wooden window frame."

/obj/structure/ms13/frame/woodfresh
	icon_state = "woodfresh"
	name = "wooden window frame"
	desc = "A wooden window frame."

//MS13 PANE TYPES//

/obj/structure/window/ms13/basic
	name = "window"
	icon_state = "basic"

/obj/structure/window/ms13/basic/damaged
	icon_state = "basic_damaged"
	damage_deflection = 0

/obj/structure/window/ms13/basic/damaged/Initialize()
	. = ..()
	icon_state = "basic"
	take_damage(rand(10, 34), BRUTE, MELEE)
	update_appearance()

/obj/structure/window/ms13/reinforced/black
	name = "reinforced window"
	icon_state = "rbasic_black"

/obj/structure/window/ms13/reinforced/rust
	name = "rusted reinforced window"
	icon_state = "rbasic_rust"

/obj/structure/window/ms13/reinforced/white
	name = "reinforced window"
	icon_state = "rbasic_white"
