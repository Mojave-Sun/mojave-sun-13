#define MAIN_MODULE_PA "mainmodulepa"
#define PASSIVE_MODULE_PA "passivemodulepa"

/obj/item/pa_module
	name = "circuit board"
	icon = 'icons/obj/module.dmi'
	icon_state = "circuit_map"
	inhand_icon_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/class_type = MAIN_MODULE_PA
	var/actions_modules = list()
	var/zone = null

/obj/item/pa_module/minimap
	name = "Circuit board minimap"
	zone = BODY_ZONE_HEAD

