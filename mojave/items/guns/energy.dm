////guns
/obj/item/gun/energy/ms13
	name = "generic ms13 gun"
	desc = "complain when seeing this"
	icon = 'mojave/icons/objects/guns/guns_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/guns_inhand_right.dmi'
	worn_icon = 'mojave/icons/mob/worn_guns.dmi'
	base_icon_state = ""
	w_class = WEIGHT_CLASS_HUGE
	automatic_charge_overlays = FALSE
	extra_damage = 10
	fire_delay = 6
	var/tac_reloads = FALSE
	var/load_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/energy_reload.ogg'
	var/unload_sound = 'mojave/sound/ms13weapons/gunsounds/lasrifle/energy_unload.ogg'
	var/load_sound_volume = 40
	var/load_sound_vary = TRUE
	var/has_scope = FALSE
	var/scope_range = 0

/obj/item/gun/energy/ms13/Initialize()
	. = ..()
	update_icon()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/guns/guns_inventory.dmi')

	if(has_scope)
		AddComponent(/datum/component/scope, range_modifier = (scope_range))

/obj/item/gun/energy/ms13/update_ammo_types()
	var/obj/item/ammo_casing/energy/shot
	for (var/i = 1, i <= ammo_type.len, i++)
		var/shottype = ammo_type[i]
		shot = new shottype(src)
		ammo_type[i] = shot
	shot = ammo_type[select]

/obj/item/gun/energy/ms13/update_icon()
	worn_icon_state = "[initial(icon_state)]"
	if(!cell)
		icon_state = "[base_icon_state]_empty"
	else
		icon_state = "[base_icon_state]"
	return ..()

/obj/item/gun/energy/ms13/proc/insert_magazine(mob/user, var/obj/item/stock_parts/cell/ms13/AM, display_message = TRUE)
	if(!istype(AM, cell_type))
		to_chat(user, "<span class='warning'>\The [AM] doesn't seem to fit into \the [src]...</span>")
		return FALSE
	if(user.transferItemToLoc(AM, src))
		cell = AM
		if (display_message)
			to_chat(user, "<span class='notice'>You load a new [AM] into \the [src].</span>")
			playsound(src, load_sound, load_sound_volume, load_sound_vary)
		update_icon()
		return TRUE
	else
		to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")
		return FALSE

///Handles all the logic of magazine ejection, if tac_load is set that magazine will be tacloaded in the place of the old eject
/obj/item/gun/energy/ms13/proc/eject_magazine(mob/user, display_message = TRUE, var/obj/item/stock_parts/cell/ms13/tac_load = null)
	if(cell)
		cell.forceMove(drop_location())
		var/obj/item/stock_parts/cell/ms13/old_mag = cell
		playsound(src, unload_sound, load_sound_volume, load_sound_vary)
		if (tac_load)
			if (insert_magazine(user, tac_load, FALSE))
				to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src].</span>")
			else
				to_chat(user, "<span class='warning'>You dropped the old [old_mag.name], but the new one doesn't fit. How embarassing.</span>")
				cell = null
		else
			cell = null
		user.put_in_hands(old_mag)
		old_mag.update_icon()
		if (display_message)
			to_chat(user, "<span class='notice'>You pull the [old_mag.name] out of \the [src].</span>")
		update_icon()

/obj/item/gun/energy/ms13/attackby(obj/item/A, mob/user, params)
	. = ..()
	if (.)
		return
	if (istype(A, /obj/item/stock_parts/cell/ms13))
		var/obj/item/stock_parts/cell/ms13/AM = A
		if (!cell)
			insert_magazine(user, AM)
		else
			if (tac_reloads)
				eject_magazine(user, FALSE, AM)
			else
				to_chat(user, "<span class='notice'>There's already a [cell.name] in \the [src].</span>")
		return

/obj/item/gun/energy/ms13/attack_self(mob/user)
	eject_magazine(user)
	return ..()

/obj/item/gun/energy/ms13/attack_hand(mob/user)
	if(loc == user && user.is_holding(src) && cell)
		eject_magazine(user)
		return
	return ..()

/obj/item/gun/energy/ms13/laser
	name = "Base class laser gub"
	desc = "Life is heck. Report a bug today"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/laser)
	cell_type = /obj/item/stock_parts/cell/ms13/mfc
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_SUITSTORE
	extra_damage = 0
	extra_penetration = 0
	wound_bonus = 0
	bare_wound_bonus = 0
	fire_delay = 5

/obj/item/gun/energy/ms13/plasma
	name = "Base class plasma gun"
	desc = "Life is heck. Report a bug today"
	ammo_type = list(/obj/item/ammo_casing/energy/ms13/plasma)
	cell_type = /obj/item/stock_parts/cell/ms13/pc
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_SUITSTORE
	extra_damage = 0
	extra_penetration = 0
	wound_bonus = 0
	bare_wound_bonus = 0
	fire_delay = 5

//energy weapon ammotypes: I don't think there's a better place to put these, they're all really generic.

/obj/item/stock_parts/cell/ms13
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	name = "ammo cell"
	desc = "You shouldn't be holding this."
	w_class = WEIGHT_CLASS_SMALL
	worn_icon = 'mojave/icons/mob/worn_misc.dmi'
	worn_icon_state = "empty_placeholder"
	grid_height = 32
	grid_width = 32
	var/base_icon = ""
	var/multiple_states = FALSE

/obj/item/stock_parts/cell/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/ammo/ammo_inventory.dmi')

/obj/item/stock_parts/cell/ms13/New()
	..()
	return

/obj/item/stock_parts/cell/ms13/mfc
	name = "microfusion cell"
	desc = "A microfusion cell, typically used as ammunition for large energy weapons."
	icon_state = "mfc"
	maxcharge = 600
	chargerate = 100
	base_icon = "mfc"

/obj/item/stock_parts/cell/ms13/ecp
	name = "electron charge pack"
	desc = "An electron charge pack, typically used as ammunition for rapidly-firing energy weapons."
	icon_state = "mfc"
	maxcharge = 1000
	chargerate = 100
	base_icon = "mfc"

/obj/item/stock_parts/cell/ms13/ec
	name = "energy cell"
	desc = "An energy cell, typically used as ammunition for small-arms energy weapons."
	icon_state = "sec"
	maxcharge = 300
	chargerate = 100
	base_icon = "sec"

/obj/item/stock_parts/cell/ms13/pc
	name = "plasma cell"
	desc = "A plasma cell, typically used as ammunition for plasma based energy weapons."
	icon_state = "plasma"
	maxcharge = 600
	chargerate = 50
	base_icon = "plasma"
	multiple_states = TRUE

/obj/item/stock_parts/cell/ms13/pc/update_icon()
	if (src.charge == 0)
		icon_state = "[base_icon]_empty"
	else
		icon_state = "[base_icon]"
	return ..()

/obj/item/stock_parts/cell/ms13/gauss
	name = "2mm electromagnetic cartridge"
	desc = "A combination battery pack and magazine used as ammunition for gauss weaponry."
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	icon_state = "2mmec"
	maxcharge = 600
	chargerate = 50
	base_icon = "2mmec"
	multiple_states = TRUE
