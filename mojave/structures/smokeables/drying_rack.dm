////////////////MOJAVE SUN DRYING RACK STORAGE/////////////////

/obj/structure/ms13/drying_rack
	name = "drying rack"
	desc = "A makeshift wooden herbal drying rack. For leaving plants in the sun."
	icon = 'mojave/icons/structure/drying_rack.dmi'
	icon_state = "drying_rack"
	armor = list(MELEE = 10, BULLET = 10, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 100,  FIRE = 10, ACID = 100)
	density = TRUE
	anchored = TRUE
	max_integrity = 200
	bound_width = 64
	var/has_rope = FALSE
	//Having a mental breakdown so this is how its gonna be, if anyone knows something better please do tell me
	var/indoors = FALSE //hard indoor check
	var/is_processing = FALSE
	var/obj/slot_1
	var/mutable_appearance/slot_1m
	var/obj/slot_2
	var/mutable_appearance/slot_2m
	var/obj/slot_3
	var/mutable_appearance/slot_3m
	var/obj/slot_4
	var/mutable_appearance/slot_4m
	var/obj/slot_5
	var/mutable_appearance/slot_5m
	var/obj/slot_6
	var/mutable_appearance/slot_6m
	var/obj/slot_7
	var/mutable_appearance/slot_7m
	var/obj/slot_8
	var/mutable_appearance/slot_8m

/obj/structure/ms13/drying_rack/Initialize()
	. = ..()
	var/turf/turfcheck = get_turf(src)
	var/turf/above_turf = get_step_multiz(turfcheck, UP) // z level above, if there is none this is the highest level and so therefore cannot be checked if its indoors or not
	var/area/ms13/area_check = get_area(turfcheck) //check for area as theres no way to pick up on roof setters (very cool)
	var/roofStat = turfcheck.get_ceiling_status()
	if(!roofStat["SKYVISIBLE"]) //lower Z indoor check
		indoors = TRUE
		return
	if(!above_turf)
		var/static/list/area_outdoorslist = list(
			/area/ms13 = TRUE,
			/area/ms13/desert = TRUE,
			/area/ms13/legioncamp = TRUE,
			/area/ms13/drylanders = TRUE,
			/area/ms13/rangeroutpost = TRUE,
			/area/ms13/water_baron = TRUE,
			/area/ms13/snow = TRUE,
			/area/ms13/snow/forest = TRUE,
			/area/ms13/snow/lightforest = TRUE,
			/area/ms13/snow/deepforest = TRUE,
		)
		if(!area_outdoorslist[area_check.type]) //indoors and not outside and on the top Z
			indoors = TRUE
			return
	//oh my god why did riddler put the drying rack indoors AND on the upper Z this shit is diabolical
	GLOB.weather_act_upon_list += src
	GLOB.sunlight_act_upon_list += get_turf(src)

/obj/structure/ms13/drying_rack/pre_roped
	icon_state = "drying_rack_roped"
	has_rope = TRUE

/obj/structure/ms13/drying_rack/pre_roped/Initialize(mapload)
	. = ..()
	new /obj/item/restraints/handcuffs/ms13/rope(src)

/obj/structure/ms13/drying_rack/update_appearance(updates)
	. = ..()
	if(has_rope)
		icon_state = "drying_rack_roped"

/obj/structure/ms13/drying_rack/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, 3)
	for(var/atom/movable/M in contents)
		M.forceMove(get_turf(src))
	qdel(src)

/obj/structure/ms13/drying_rack/examine(mob/user)
	. = ..()
	if(!has_rope)
		. += "Attach some rope to it to start hanging produce."

/obj/structure/ms13/drying_rack/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/restraints/handcuffs/ms13/rope) && !has_rope)
		playsound(user, 'mojave/sound/ms13effects/hogtie.ogg', 90)
		if(do_after(user, 10 SECONDS))
			playsound(user, 'mojave/sound/ms13effects/hogtie.ogg', 90)
			has_rope = TRUE
			update_appearance()
			if(!user.transferItemToLoc(I, src))
				return
			to_chat(user, span_notice("You string up [I] on [src]."))
			return
	if(!has_rope)
		to_chat(user, "<span class='warning'>You need to attach some rope to hang things here!</span>")
		return
	if(contents.len == 9)
		to_chat(user, "<span class='warning'>The [name] is at maximum space!</span>")
		return
	if(istype(I, /obj/item/food/grown/ms13) || istype(I, /obj/item/ms13/dried))
		var/obj/item/food/grown/ms13/place_dry = I
		if(place_dry.can_dry)
			to_chat(user, "<span class='notice'>You hang [place_dry.name] to dry on the [name].</span>")
			place_check(I)
			drying_check(I)
			playsound(user, 'mojave/sound/ms13effects/smokeables/rackattach.ogg', 100)
			if(!user.transferItemToLoc(I, src))
				return
		else
			to_chat(user, "<span class='warning'>You cant think of a reason to hang [place_dry.name] to dry.</span>")
	. = ..()

/obj/structure/ms13/drying_rack/proc/drying_check(obj/item/I)
	var/obj/item/food/grown/ms13/place_dry = I
	if(indoors)
		return
	if(contents.len && place_dry.can_dry)
		if(!is_processing)
			is_processing = TRUE
			START_PROCESSING(SSobj,src)
		return

/obj/structure/ms13/drying_rack/proc/drying_check_after()
	if(contents == list(/obj/item/restraints/handcuffs/ms13/rope))
		is_processing = FALSE
		STOP_PROCESSING(SSobj,src)
		return

/obj/structure/ms13/drying_rack/process()
	var/turf/dry_turf = get_turf(src)
	if(indoors)
		STOP_PROCESSING(SSobj,src)
		return
	if(dry_turf.outdoor_effect.state == SKY_BLOCKED) //so it has to be outside
		return
	if(dry_turf.outdoor_effect.time_of_day <= 5 HOURS || dry_turf.outdoor_effect.time_of_day >= 19 HOURS) //so it cannot be night
		return
	if(weather) //weather stops the drying process (gotta see the clear sun), could make it so snow and rain ruins the process, but then id have to add like a fucking tarp or something you throw over it and that is just TOO much soul for this kind of pr
		return
	for(var/obj/item/food/grown/ms13/A in contents)
		if(A.time_drying >= A.dry_time)
			A.dry(src)
		A.time_drying ++

/obj/structure/ms13/drying_rack/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(!has_rope)
		to_chat(user, "<span class='warning'>You need to attach some rope to hang things here!</span>")
		return
	if(!LAZYLEN(contents))
		return
	var/list/display_names = list()
	var/list/items = list()
	for(var/obj/item/thing as anything in contents)
		if(!(thing.type == /obj/item/restraints/handcuffs/ms13/rope))
			display_names["[initial(thing.name)]"] = thing
			var/image/item_image = image(icon = initial(thing.icon), icon_state = initial(thing.icon_state))
			items += list("[initial(thing.name)]" = item_image)
	var/pick = show_radial_menu(user, src, items, require_near = TRUE, tooltips = TRUE)
	if(!pick)
		return
	var/obj/item/drying_removal = display_names[pick]
	user.put_in_hands(drying_removal)
	playsound(user, 'mojave/sound/ms13effects/smokeables/rackattach.ogg', 100)
	remove_check(drying_removal)
	drying_check_after()

/obj/structure/ms13/drying_rack/proc/place_check(obj/item/I) //what this does is add shit in order, but if its removed, dosent crump it all up, and fillsin the closest space
	//imma be real with you cuh, I was not feeling well when I coded this
	if(!slot_1) //basically done so things can be added and removed without overlays shifting overlays downwards on removal
		I.place_slot = 1
		slot_1 = I
		slot_1m = mutable_appearance(icon, "[I.icon_state]_[I.place_slot]", layer + 1)
		add_overlay(slot_1m)
		return
	if(!slot_2)
		I.place_slot = 2
		slot_2 = I
		slot_2m = mutable_appearance(icon, "[I.icon_state]_[I.place_slot]", layer + 1)
		add_overlay(slot_2m)
		return
	if(!slot_3)
		I.place_slot = 3
		slot_3 = I
		slot_3m = mutable_appearance(icon, "[I.icon_state]_[I.place_slot]", layer + 1)
		add_overlay(slot_3m)
		return
	if(!slot_4)
		I.place_slot = 4
		slot_4 = I
		slot_4m = mutable_appearance(icon, "[I.icon_state]_[I.place_slot]", layer + 1)
		add_overlay(slot_4m)
		return
	if(!slot_5)
		I.place_slot = 5
		slot_5 = I
		slot_5m = mutable_appearance(icon, "[I.icon_state]_[I.place_slot]", layer + 1)
		add_overlay(slot_5m)
		return
	if(!slot_6)
		I.place_slot = 6
		slot_6 = I
		slot_6m = mutable_appearance(icon, "[I.icon_state]_[I.place_slot]", layer + 1)
		add_overlay(slot_6m)
		return
	if(!slot_7)
		I.place_slot = 7
		slot_7 = I
		slot_7m = mutable_appearance(icon, "[I.icon_state]_[I.place_slot]", layer + 1)
		add_overlay(slot_7m)
		return
	if(!slot_8)
		I.place_slot = 8
		slot_8 = I
		slot_8m = mutable_appearance(icon, "[I.icon_state]_[I.place_slot]", layer + 1)
		add_overlay(slot_8m)
		return

/obj/structure/ms13/drying_rack/proc/remove_check(obj/item/I) //I WILL MAKE A SLOT COMPONENT ONE DAY
	if(I.place_slot == 1)
		I.place_slot = null
		slot_1 = null
		cut_overlay(slot_1m)
		return
	if(I.place_slot == 2)
		I.place_slot = null
		slot_2 = null
		cut_overlay(slot_2m)
		return
	if(I.place_slot == 3)
		I.place_slot = null
		slot_3 = null
		cut_overlay(slot_3m)
		return
	if(I.place_slot == 4)
		I.place_slot = null
		slot_4 = null
		cut_overlay(slot_4m)
		return
	if(I.place_slot == 5)
		I.place_slot = null
		slot_5 = null
		cut_overlay(slot_5m)
		return
	if(I.place_slot == 6)
		I.place_slot = null
		slot_6 = null
		cut_overlay(slot_6m)
		return
	if(I.place_slot == 7)
		I.place_slot = null
		slot_7 = null
		cut_overlay(slot_7m)
		return
	if(I.place_slot == 8)
		I.place_slot = null
		slot_8 = null
		cut_overlay(slot_8m)
		return
