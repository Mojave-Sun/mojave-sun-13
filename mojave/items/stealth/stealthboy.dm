// Stealthboy

/obj/item/clothing/ms13/stealthboy
	name = "stealthboy"
	desc = "A RobCo Industries Stealth Boy 3001, a device capable of rendering the wearer nearly transparent for a period of time."
	icon = 'mojave/items/stealth/stealthboy_icon.dmi'
	icon_state = "stealthboy"
	throwforce = 5.0
	throw_speed = 1
	throw_range = 5
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	equip_sound = 'sound/items/equip/toolbelt_equip.ogg'
	var/stealthboy_on = FALSE
	COOLDOWN_DECLARE(stealthboy_cooldown)
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/ms13/stealthboy/dropped(mob/user)
	..()
	if(stealthboy_on)
		disrupt(user)

/obj/item/clothing/ms13/stealthboy/attack_self(mob/user)
	toggle(user)

/obj/item/clothing/ms13/stealthboy/proc/toggle(mob/user)
	if(!ishuman(user))
		return
	if(!COOLDOWN_FINISHED(src, stealthboy_cooldown))
		return
	playsound(get_turf(src), 'sound/effects/pop.ogg', 25, 1, 3)
	stealthboy_on = !stealthboy_on
	if(stealthboy_on)
		user.alpha = 25
		to_chat(user, "<span class='notice'>You activate the [src].</span>")
		addtimer(CALLBACK(src, .proc/disrupt, user), 20 SECONDS)
		user.add_filter("stealthboy_ripple", 2, list("type" = "ripple", "flags" = WAVE_BOUNDED, "radius" = 0, "size" = 2))
		var/filter = user.get_filter("stealthboy_ripple")
		animate(filter, radius = 32, time = 15, size = 0, loop = 1)
	else
		user.alpha = initial(user.alpha)
		to_chat(user, "<span class='notice'>You deactivate the [src].</span>")
		COOLDOWN_START(src, stealthboy_cooldown, 180 SECONDS)

/obj/item/clothing/ms13/stealthboy/proc/disrupt(mob/user)
	if(stealthboy_on)
		user.alpha = initial(user.alpha)
		stealthboy_on = FALSE
	COOLDOWN_START(src, stealthboy_cooldown, 180 SECONDS)
	to_chat(user, "<span class='notice'>[src] deactivates.</span>")
