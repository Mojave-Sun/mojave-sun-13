/obj/structure/ms13/torch
	name = "torch"
	icon = 'mojave/icons/structure/lighting.dmi'
	icon_state = "torch"
	density = FALSE
	anchored = TRUE
	layer = BELOW_MOB_LAYER
	light_color = LIGHT_COLOR_FIRE
	light_power = 0.5
	light_range = 0
	pixel_y = 10
	var/burning = FALSE

/obj/structure/ms13/torch/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(burning)
		user.visible_message("<span class='notice'>[user] snuffs [src] out.</span>", "<span class='notice'>You snuff [src] out.</span>")
		burning = FALSE
		icon_state = "[initial(icon_state)]"
		set_light(0)
		update_icon()
		return
/*	if(!burning) re-add later
		user.visible_message("<span class='notice'>[user] starts to pull [src] free from the ground....</span>", "<span class='notice'>You start to pull [src] free from the ground...</span>")
		if(do_after(user, 2 SECONDS, target = src))
			to_chat("<span class='notice'>You pull [src] free from the ground.</span>")
			var/torch = new /obj/item/flashlight/flare/torch/ms13
			user.put_in_hands(torch)
			qdel(src)
			return */

/obj/structure/ms13/torch/attackby(obj/item/W, mob/user, params)
	if(W.ignition_effect())
		StartBurning()
		update_icon()
		user.visible_message("<span class='notice'>[user] lights [src] with [W].</span>", "<span class='notice'>You light [src] with [W].</span>")
		return

/obj/structure/ms13/torch/proc/StartBurning()
	if(!burning)
		burning = TRUE
		icon_state = "[initial(icon_state)]_lit"
		set_light(7)
		update_icon()
		return
/obj/structure/ms13/torch/prelit

/obj/structure/ms13/torch/prelit/Initialize()
	. = ..()
	StartBurning()

/obj/structure/ms13/torch/wall_mounted
	name = "wall mounted torch"
	icon_state = "wall_torch"
	density = FALSE
	layer = ON_EDGED_TURF_LAYER
	pixel_y = 0

/obj/structure/ms13/torch/wall_mounted/Initialize() //So that no matter what, Mappers aren't messing stuff up. Nice and consistent.
	. = ..()
	if(dir == NORTH)
		return
	if(dir == SOUTH)
		pixel_y = 28
	if(dir == WEST)
		pixel_x = 10
		pixel_y = 11
	if(dir == EAST)
		pixel_x = -10
		pixel_y = 11

/obj/structure/ms13/torch/wall_mounted/prelit

/obj/structure/ms13/torch/wall_mounted/prelit/Initialize()
	. = ..()
	StartBurning()

/obj/structure/ms13/torch/wall_mounted/attack_hand(mob/user)
	if(.)
		return
	if(burning)
		user.visible_message("<span class='notice'>[user]reaches up and snuffs [src] out.</span>", "<span class='notice'>You reach up and snuff [src] out.</span>")
		burning = FALSE
		icon_state = "[initial(icon_state)]"
		set_light(0)
		update_icon()
		return
	if(!burning)
		return
