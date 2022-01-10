// Basetype component //

/obj/item/ms13/component
	name = "generic MS13 component"
	desc = "I don't think you can assemble stuff with this!"
	icon = 'mojave/icons/objects/crafting/components_world.dmi'
	icon_state = "fusion_cell"

// Fusion cells //

/obj/item/ms13/component/cell
	name = "fusion cell"
	desc = "A ultra-portable fusion cell, used for all of your power needs!"
	icon_state = "fusion_cell"
	force = 1
	throwforce = 5
	w_class = WEIGHT_CLASS_SMALL

/obj/item/ms13/component/cell/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/crafting/components_inventory.dmi')

// Light items (bulbs and stuff) //

/obj/item/light/ms13
	icon = 'mojave/icons/objects/crafting/components_world.dmi'
	force = 2
	throwforce = 5

/obj/item/light/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/crafting/components_inventory.dmi')

/obj/item/light/ms13/tube
	name = "light tube"
	desc = "A tube used for lighting."
	icon_state = "ltube"
	base_state = "ltube"
	inhand_icon_state = "c_tube"
	brightness = 7

/obj/item/light/ms13/tube/broken
	status = LIGHT_BROKEN

/obj/item/light/ms13/tube/burned
	status = LIGHT_BURNED

/obj/item/light/ms13/bulb
	name = "light bulb"
	desc = "A light bulb that can be screwed into a fixture."
	icon_state = "lbulb"
	base_state = "lbulb"
	inhand_icon_state = "contvapour"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	brightness = 4.5

/obj/item/light/ms13/bulb/broken
	status = LIGHT_BROKEN

/obj/item/light/ms13/bulb/burned
	status = LIGHT_BURNED
