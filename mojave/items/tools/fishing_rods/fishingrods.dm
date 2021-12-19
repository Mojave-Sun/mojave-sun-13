// Fishing rods

/obj/item/ms13/tools/fishing_rod
	name = "fishing rod"
	desc = "You shouldn't be seeing this. LOOK AWAY."
	tool_behaviour = TOOL_FISHINGROD
	icon = 'mojave/icons/objects/tools/fishingrods.dmi'
	var/fish_speed = 600 SECONDS

/obj/item/ms13/tools/fishing_rod/basic
	name = "wooden rod"
	desc = "A wooden fishing rod. Capable and proven."
	tool_behaviour = TOOL_FISHINGROD
	icon_state = "basic"
	lefthand_file = 'mojave/icons/objects/tools/fishing_left_inhands.dmi'
	righthand_file = 'mojave/icons/objects/tools/fishing_right_inhands.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	fish_speed = 60 SECONDS

/obj/item/ms13/tools/fishing_rod/telescopic
	name = "telescoping rod"
	desc = "A telescoping fishing rod, perfect to store away in your bag."
	icon_state = "telescopic"
	lefthand_file = 'mojave/icons/objects/tools/fishing_left_inhands.dmi'
	righthand_file = 'mojave/icons/objects/tools/fishing_right_inhands.dmi'
	w_class = WEIGHT_CLASS_SMALL
	fish_speed = 40 SECONDS
	var/on_sound = 'sound/weapons/batonextend.ogg'

/obj/item/ms13/tools/fishing_rod/advanced
	name = "advanced rod"
	desc = "A professional, high-end fishing rod, state of the art fishing technology. They don't make them like this anymore."
	tool_behaviour = TOOL_FISHINGROD
	icon_state = "advanced"
	lefthand_file = 'mojave/icons/objects/tools/fishing_left_inhands.dmi'
	righthand_file = 'mojave/icons/objects/tools/fishing_right_inhands.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	fish_speed = 20 SECONDS
