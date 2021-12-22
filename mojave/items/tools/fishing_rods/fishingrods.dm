// Fishing rods

/obj/item/ms13/tools/fishing_rod
	name = "fishing rod"
	desc = "You shouldn't be seeing this. LOOK AWAY."
	tool_behaviour = TOOL_FISHINGROD
	icon = 'mojave/icons/objects/tools/fishingrods.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/equipment/fishing_left_inhands.dmi'
	righthand_file = 'mojave/icons/mob/inhands/equipment/fishing_right_inhands.dmi'

/obj/item/ms13/tools/fishing_rod/basic
	name = "wooden rod"
	desc = "A basic wooden fishing rod. Capable and proven."
	tool_behaviour = TOOL_FISHINGROD
	icon_state = "basic"
	inhand_icon_state = "basic"
	w_class = WEIGHT_CLASS_NORMAL
	toolspeed = 1.5 //60 second fish time

/obj/item/ms13/tools/fishing_rod/telescopic
	name = "telescoping rod"
	desc = "A telescoping fishing rod, perfect to store away in your bag."
	icon_state = "telescopic"
	inhand_icon_state = "telescopic"
	w_class = WEIGHT_CLASS_SMALL
	toolspeed = 1 //40 second fish time
	var/on_sound = 'sound/weapons/batonextend.ogg'

/obj/item/ms13/tools/fishing_rod/advanced
	name = "advanced rod"
	desc = "A professional, high-end fishing rod, state of the art fishing technology. They don't make them like this anymore."
	icon_state = "advanced"
	inhand_icon_state = "advanced"
	w_class = WEIGHT_CLASS_NORMAL
	toolspeed = 0.5 //20 second fish time
