// Fishing rods

/obj/item/ms13/tools/fishing_rod
	name = "fishing rod"
	desc = "You shouldn't be seeing this. LOOK AWAY."
	tool_behaviour = TOOL_FISHINGROD
	icon = 'fallout/icons/objects/fishing_rods.dmi'
	var/fish_speed = 600 SECONDS

/obj/item/ms13/tools/fishing_rod/basic
	name = "wooden rod"
	desc = "A wooden fishing rod. Capable and proven."
	tool_behaviour = TOOL_FISHINGROD
	icon_state = "basic"
	lefthand_file = 'fallout/icons/mob/inhands/equipment/basic_lefthand.dmi'
	righthand_file = 'fallout/icons/mob/inhands/equipment/basic_righthand.dmi'
	w_class_on = WEIGHT_CLASS_NORMAL
	fish_speed = 60 SECONDS

/obj/item/ms13/tools/fishing_rod/telescopic
	name = "telescoping rod"
	desc = "A telescoping fishing rod, perfect to store away in your bag."
	icon_state = "telescopic"
	lefthand_file = 'fallout/icons/mob/inhands/equipment/telescopic_lefthand.dmi'
	righthand_file = 'fallout/icons/mob/inhands/equipment/telescopic_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/on_sound = 'sound/weapons/batonextend.ogg'

/obj/item/ms13/tools/fishing_rod/telescopic/Initialize()
	. = ..()
	AddComponent(/datum/component/transforming, \
		w_class_on = WEIGHT_CLASS_NORMAL, \
		tool_behaviour = TOOL_FISHINGROD, \
		fish_speed = 40 SECONDS)
	RegisterSignal(src, COMSIG_TRANSFORMING_ON_TRANSFORM, .proc/on_transform)

/obj/item/ms13/tools/fishing_rod/advanced
	name = "advanced rod"
	desc = "A professional, high-end fishing rod, state of the art fishing technology. They don't make them like this anymore."
	tool_behaviour = TOOL_FISHINGROD
	icon_state = "advanced"
	lefthand_file = 'fallout/icons/mob/inhands/equipment/advanced_lefthand.dmi'
	righthand_file = 'fallout/icons/mob/inhands/equipment/advanced_righthand.dmi'
	w_class_on = WEIGHT_CLASS_NORMAL
	fish_speed = 20 SECONDS
