// Fishing rods

/obj/item/ms13/tools/fishing_rod
	name = "fishing rod"
	desc = "You shouldn't be seeing this. LOOK AWAY."
	tool_behaviour = TOOL_FISHINGROD
	w_class = WEIGHT_CLASS_BULKY
	icon = 'mojave/icons/objects/tools/tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	grid_width = 192
	grid_height = 32

/obj/item/ms13/tools/fishing_rod/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/tools_inventory.dmi')

/obj/item/ms13/tools/fishing_rod/basic
	name = "wooden fishing rod"
	desc = "A basic wooden fishing rod. Capable and proven."
	tool_behaviour = TOOL_FISHINGROD
	icon_state = "basic"
	toolspeed = 1.5 //60 second fish time

/obj/item/ms13/tools/fishing_rod/telescopic
	name = "telescoping fishing rod"
	desc = "A telescoping fishing rod, perfect to store away in your bag."
	icon_state = "telescopic-collapsed"
	tool_behaviour = null // starts closed
	w_class = WEIGHT_CLASS_NORMAL
	toolspeed = 1 //40 second fish time
	grid_width = 96
	grid_height = 32
	var/toggled = FALSE
	var/extended_icon = "telescopic"
	var/on_sound = 'sound/weapons/batonextend.ogg'

/obj/item/ms13/tools/fishing_rod/telescopic/attack_self(mob/user, modifiers)
	. = ..()
	if(!toggled)
		to_chat(user, span_notice("You begin to extend the rod fully."))
		if(do_after(user, 2.5 SECONDS, interaction_key = DOAFTER_SOURCE_TELESCOPICROD))
			icon_state = extended_icon
			inhand_icon_state = icon_state
			desc = "[initial(desc)] It is currently extended."
			tool_behaviour = TOOL_FISHINGROD
			w_class = WEIGHT_CLASS_BULKY
			toggled = TRUE
			playsound(src, on_sound, 60, TRUE)
			grid_width = 192
			grid_height = 32
	else
		to_chat(user, span_notice("You begin to collapse the rod."))
		if(do_after(user, 2.5 SECONDS, interaction_key = DOAFTER_SOURCE_TELESCOPICROD))
			icon_state = (initial(icon_state))
			inhand_icon_state = icon_state
			desc = "[initial(desc)] It is currently collapsed."
			tool_behaviour = null
			w_class = WEIGHT_CLASS_NORMAL
			toggled = FALSE
			playsound(src, on_sound, 85, TRUE)
			grid_width = 96
			grid_height = 32

/obj/item/ms13/tools/fishing_rod/advanced
	name = "advanced fishing rod"
	desc = "A professional, high-end fishing rod, state of the art fishing technology. They don't make them like this anymore."
	icon_state = "advanced"
	toolspeed = 0.5 //20 second fish time
