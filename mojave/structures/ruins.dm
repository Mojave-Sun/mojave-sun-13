#define RUIN_BODIES list("coupe" = 10, "muscle" = 3, "sport" = 3, "van" = 2)

/////////////////////////////////////////////////////////////
////////////// MOJAVE SUN RUINS/TRASH ///////////////////////
/////////////////////////////////////////////////////////////

///Place here semi-functional structures that are basically for scrapping/joonking///

//Cars//

/obj/structure/ms13/vehicle_ruin
	name = "vehicle ruin"
	desc = "A base class unrandomised vehicle, if you see it, report it foo."
	icon = 'mojave/icons/structure/wrecks.dmi'
	icon_state = "helper"
	bound_width = 96
	density = TRUE
	anchored = TRUE
	max_integrity = 10000
	resistance_flags = INDESTRUCTIBLE
	var/body_state = null
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE
	projectile_passchance = 45

/obj/structure/ms13/vehicle_ruin/welder_act_secondary(mob/living/user, obj/item/I)
	if(!I.tool_start_check(user, amount=0))
		return TRUE
	if(I.use_tool(src, user, 65 SECONDS, volume=80))
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/vehicle_ruin/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/scrap(loc, 6)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 6)
			new /obj/item/stack/sheet/ms13/scrap_steel(loc, 6)
			new /obj/item/stack/sheet/ms13/scrap_alu(loc, 5)
			new /obj/item/stack/sheet/ms13/leather(loc, 5)
			new /obj/item/stack/sheet/ms13/rubber(loc, 6)
			new /obj/item/stack/sheet/ms13/glass(loc, 4)
			new /obj/item/stack/sheet/ms13/scrap_lead(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_brass(loc, 3)
		else
			new /obj/item/stack/sheet/ms13/scrap(loc)
	qdel(src)

/obj/structure/ms13/vehicle_ruin/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/vehicle_ruin/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>welding tool</b> to painstakingly take apart [src] for parts.")

/obj/structure/ms13/vehicle_ruin/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_WELDER)
			context[SCREENTIP_CONTEXT_RMB] = "Slowly take apart"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/vehicle_ruin/coupe
	body_state = "coupe"

/obj/structure/ms13/vehicle_ruin/muscle
	body_state = "muscle"

/obj/structure/ms13/vehicle_ruin/sport
	body_state = "sport"

/obj/structure/ms13/vehicle_ruin/van
	body_state = "van"
	projectile_passchance = 35

/obj/structure/ms13/vehicle_ruin/Initialize()
	. = ..()
	register_context()
	var/randomiser = rand(1,5)
	if(!body_state)
		body_state = pick_weight(RUIN_BODIES)
	switch(body_state)
		if("coupe")
			name = "coupe car wreck"
			desc = "An old pre-war coupe car, scrapped and destroyed beyond repair."
			icon_state = "coupe-[randomiser]"
			add_overlay(image(icon, "coupe-tires-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "coupe-bumper-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "coupe-part-1-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "coupe-part-2-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "coupe-part-3-[randomiser]", FLOAT_LAYER, dir))
			return
		if("muscle")
			name = "muscle car wreck"
			desc = "An old pre-war muscle car, scrapped and destroyed beyond repair, legend says it has an interior capable of accommodating as much as seven people, including a super mutant, robobrain, and a deathclaw."
			icon_state = "muscle-[randomiser]"
			add_overlay(image(icon, "muscle-tires-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "muscle-bumper-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "muscle-part-1-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "muscle-part-2-[randomiser]", FLOAT_LAYER, dir))
			return
		if("sport")
			name = "sport car wreck"
			desc = "An old pre-war sport car, scrapped and destroyed beyond repair."
			icon_state = "sport-[randomiser]"
			add_overlay(image(icon, "sport-tires-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "sport-bumper-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "sport-part-1-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "sport-part-2-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "sport-part-3-[randomiser]", FLOAT_LAYER, dir))
			return
		if("van")
			name = "van wreck"
			desc = "An old pre-war van, scrapped and destroyed beyond repair."
			icon_state =  "van-[randomiser]"
			projectile_passchance = 45
			add_overlay(image(icon, "van-tires-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "van-bumper-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "van-part-1-[randomiser]", FLOAT_LAYER, dir))
			if(prob(50))
				add_overlay(image(icon, "van-part-2-[randomiser]", FLOAT_LAYER, dir))
			return
