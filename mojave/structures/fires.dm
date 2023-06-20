//For open flames/children of TG bonfires (Campfires, fire barrels, etc.)

/obj/structure/bonfire/ms13
    name = "base class ms13 bonfire"
    desc = "If you see this, that is not very lit."
    icon = 'mojave/icons/structure/fires.dmi'
    icon_state = "campfire"
    burn_icon = "campfire_lit"

/obj/structure/bonfire/ms13/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/personal_crafting, CRAFTING_BENCH_CAMPFIRE)
	register_context()

/obj/structure/bonfire/ms13/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Use <b>CTRL + CLICK</b> on [src] to begin crafting.</span>"

/obj/structure/bonfire/ms13/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	if (isnull(held_item))
		context[SCREENTIP_CONTEXT_CTRL_LMB] = "Start crafting"
		return CONTEXTUAL_SCREENTIP_SET

/obj/structure/bonfire/ms13/attack_hand(mob/user, list/modifiers)
    return

/obj/structure/bonfire/ms13/extinguish()
	if(burning)
		icon_state = "[initial(icon_state)]"
		burning = FALSE
		set_light(0)
		QDEL_NULL(particles)
		STOP_PROCESSING(SSobj, src)

/obj/structure/bonfire/ms13/campfire
    name = "campfire"
    desc = "A nice and cozy campfire. Proven to keep you warm and lift your spirits."
    icon_state = "campfire"
    burn_icon = "campfire_lit"
    max_integrity = 80

/obj/structure/bonfire/ms13/campfire/attackby(obj/item/used_item, mob/living/user, params)
	if(used_item.get_temperature())
		start_burning()

/obj/structure/bonfire/ms13/campfire/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, 2)
	qdel(src)


/obj/structure/bonfire/ms13/campfire/prelit/Initialize(mapload)
	. = ..()
	start_burning()

/obj/structure/bonfire/ms13/fire_barrel
    name = "fire barrel"
    desc = "An open barrel with wood for starting a fire. A classic for keeping those going through hard times nice and warm."
    icon_state = "fire_barrel"
    burn_icon = "fire_barrel_lit"
    density = TRUE
    max_integrity = 150

/obj/structure/bonfire/ms13/fire_barrel/examine(mob/user)
	. = ..()
	if(!grill)
		. += span_notice("You could add a grill to [src] with some <b>scrap metal</b>.")

/obj/structure/bonfire/ms13/fire_barrel/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc, 2)
	qdel(src)

/obj/structure/bonfire/ms13/fire_barrel/attackby(obj/item/used_item, mob/living/user, params)
	if(istype(used_item, /obj/item/stack/sheet/ms13/scrap) && !grill)
		var/obj/item/stack/sheet/ms13/scrap/scrap = used_item
		if(do_after(user, 4 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_ADDGRILL))
			grill = TRUE
			to_chat(user, span_notice("You add a grill to \the [src]."))
			add_overlay("barrel_grill")
			scrap.use(1)
		else
			return ..()
	if(used_item.get_temperature())
		start_burning()
	if(grill)
		if(istype(used_item, /obj/item/melee/roastingstick))
			return FALSE
		if(!user.combat_mode && !(used_item.item_flags & ABSTRACT))
			if(user.temporarilyRemoveItemFromInventory(used_item))
				used_item.forceMove(get_turf(src))
				var/list/modifiers = params2list(params)
				//Center the icon where the user clicked.
				if(!LAZYACCESS(modifiers, ICON_X) || !LAZYACCESS(modifiers, ICON_Y))
					return
				//Clamp it so that the icon never moves more than 10 pixels to the side or 6 pixels up (thus leaving the turf)
				used_item.pixel_x = used_item.base_pixel_x + clamp(text2num(LAZYACCESS(modifiers, ICON_X)) - 10, -(world.icon_size/2), world.icon_size/2)
				used_item.pixel_y = used_item.base_pixel_y + clamp(text2num(LAZYACCESS(modifiers, ICON_Y)) - 6, -(world.icon_size/2), world.icon_size/2)
		else
			return ..()

/obj/structure/bonfire/ms13/fire_barrel/prelit/Initialize(mapload)
	. = ..()
	start_burning()

/obj/structure/bonfire/ms13/fire_barrel/start_burning()
	if(burning)
		return
	icon_state = burn_icon
	burning = TRUE
	set_light(6)
	bonfire_burn()
	particles = new /particles/bonfire/ms13/fire_barrel()
	START_PROCESSING(SSobj, src)

/particles/bonfire/ms13/fire_barrel
	width = 50
	height = 150
