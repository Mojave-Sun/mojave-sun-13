// Handheld light sources  //

/obj/item/flashlight/ms13
	name = "flashlight"
	desc = "A common flashlight. An essential tool for any tomfoolery in the unknown."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	icon_state = "flashlight_old"
	inhand_icon_state = "flashlight_old"
	light_range = 3.75
	light_power = 0.75
	light_color = "#dbb070"
	grid_width = 64
	grid_height = 32

/obj/item/flashlight/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/flashlight/ms13/mag
	name = "stick flashlight"
	desc = "A lengthy dark flashlight. Has a fair light range, and feels relatively high quality."
	icon_state = "flashlight_mag"
	inhand_icon_state = "flashlight_mag"
	light_range = 4.5
	light_power = 0.9
	light_color = "#dac97c"

/obj/item/flashlight/ms13/crafted
	name = "homemade flashlight"
	desc = "To call it a flashlight is even a stretch. This device is simply a lightbulb connected to a low output fusion cell."
	icon_state = "flashlight_crafted"
	inhand_icon_state = "flashlight_crafted"
	light_range = 3 // doo-doo. But much better than nothing.
	light_power = 0.6
	light_color = "#ddd2b9"

/obj/item/flashlight/flare/ms13
	name = "flare"
	desc = "A red flare, quite simple."
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	icon_state = "flare"
	inhand_icon_state = "flare"
	light_range = 3.5
	light_power = 0.75
	grid_width = 64
	grid_height = 32

/obj/item/flashlight/flare/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')
	fuel = rand(900, 1200) //This is remaining fuel in seconds, so this puts every flare at between 15-20 minutes of life time.

/obj/item/flashlight/flare/torch/ms13
	name = "torch"
	desc = "A torch fashioned from some leaves and a log."
	w_class = WEIGHT_CLASS_BULKY
	light_range = 4
	light_color = LIGHT_COLOR_FIRE

/obj/item/flashlight/flare/torch/ms13/attack_self(mob/user)
	if(!src.on)
		to_chat(user, "<span class='notice'>You start pushing [src] into the ground...</span>")
		if (do_after(user, 5 SECONDS, target=src))
			qdel(src)
			new /obj/structure/ms13/torch(get_turf(user))
			user.visible_message("<span class='notice'>[user] plants \the [src] firmly in the ground.</span>", "<span class='notice'>You plant \the [src] firmly in the ground.</span>")
			return
	else if(on)
		user.visible_message(
			"<span class='notice'>[user] snuffs [src] out.</span>")
		on = FALSE
		set_light(0)

/obj/item/flashlight/flare/torch/ms13/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(W.ignition_effect())
		update_brightness()
		update_icon()
		user.visible_message("<span class='notice'>[user] lights [src] with [W].</span>", "<span class='notice'>You light [src] with [W].</span>")
		return
