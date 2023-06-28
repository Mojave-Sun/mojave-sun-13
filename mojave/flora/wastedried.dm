////////////////MOJAVE SUN DRIED PLANTS STORAGE/////////////////

//dried stuff

/obj/item/ms13/dried
	name = "generic dried object"
	desc = "You dry as hell boy."
	icon = 'mojave/icons/hydroponics/harvest/harvest_world.dmi'
	inhand_icon_state = "plant"
	lefthand_file = 'mojave/icons/mob/inhands/equipment/hydroponics_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/equipment/hydroponics_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	grid_height = 32
	grid_width = 32
	var/can_dry = FALSE //idk maybe future drying stages or something
	var/indentifier

/obj/item/ms13/dried/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/hydroponics/harvest/harvest_inventory.dmi')

/obj/item/ms13/dried/xander
	name = "dried xander"
	desc = "A rock-hard handful of xander root, brittle and cracked. It smells earthy."
	icon_state = "cut_xander_dried"
	indentifier = "x"

/obj/item/ms13/dried/broc
	name = "dried broc flower"
	desc = "A crisp and delicate head of a once orange flower. It smells bitter and fruity."
	icon_state = "brocflower_dried"
	indentifier = "b"

/obj/item/ms13/dried/tobacco
	name = "dried tobacco"
	desc = "A crisp bundle of brown leaves. It smells sweet and smoky."
	icon_state = "tobacco_dried"
	indentifier = "t"

//drying process

/obj/item/food/grown/ms13/proc/dry(obj/structure/ms13/drying_rack/S)
	var/obj/item/result
	result = new dried_type(S)
	result.place_slot = place_slot
	S.drying_check(result)
	if(S.slot_1 == src) // HELP
		S.slot_1 = result
		qdel(src)
		S.cut_overlay(S.slot_1m)
		S.slot_1m = mutable_appearance(S.icon, "[S.slot_1.icon_state]_1", layer + 1)
		S.add_overlay(S.slot_1m)
		return
	if(S.slot_2 == src)
		S.slot_2 = result
		qdel(src)
		S.cut_overlay(S.slot_2m)
		S.slot_2m = mutable_appearance(S.icon, "[S.slot_2.icon_state]_2", layer + 1)
		S.add_overlay(S.slot_2m)
		return
	if(S.slot_3 == src)
		S.slot_3 = result
		qdel(src)
		S.cut_overlay(S.slot_3m)
		S.slot_3m = mutable_appearance(S.icon, "[S.slot_3.icon_state]_3", layer + 1)
		S.add_overlay(S.slot_3m)
		return
	if(S.slot_4 == src)
		S.slot_4 = result
		qdel(src)
		S.cut_overlay(S.slot_4m)
		S.slot_4m = mutable_appearance(S.icon, "[S.slot_4.icon_state]_4", layer + 1)
		S.add_overlay(S.slot_4m)
		return
	if(S.slot_5 == src)
		S.slot_5 = result
		qdel(src)
		S.cut_overlay(S.slot_5m)
		S.slot_5m = mutable_appearance(S.icon, "[S.slot_5.icon_state]_5", layer + 1)
		S.add_overlay(S.slot_5m)
		return
	if(S.slot_6 == src)
		S.slot_6 = result
		qdel(src)
		S.cut_overlay(S.slot_6m)
		S.slot_6m = mutable_appearance(S.icon, "[S.slot_6.icon_state]_6", layer + 1)
		S.add_overlay(S.slot_6m)
		return
	if(S.slot_7 == src)
		S.slot_7 = result
		qdel(src)
		S.cut_overlay(S.slot_7m)
		S.slot_7m = mutable_appearance(S.icon, "[S.slot_7.icon_state]_7", layer + 1)
		S.add_overlay(S.slot_7m)
		return
	if(S.slot_8 == src)
		S.slot_8 = result
		qdel(src)
		S.cut_overlay(S.slot_8m)
		S.slot_8m = mutable_appearance(S.icon, "[S.slot_8.icon_state]_8", layer + 1)
		S.add_overlay(S.slot_8m)
		return
