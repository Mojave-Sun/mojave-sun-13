// Basetype component //

/obj/item/ms13/component
	name = "generic MS13 component"
	desc = "I don't think you can assemble stuff with this!"
	icon = 'mojave/icons/objects/crafting/components_world.dmi'
	icon_state = "fusion_cell"
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
	grid_width = 32
	grid_height = 32

/obj/item/ms13/component/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/crafting/components_inventory.dmi')

// Components //

/obj/item/ms13/component/cell
	name = "fission battery"
	desc = "A small fission battery. Used both before and after the war for all kinds of power needs."
	icon_state = "fusion_cell"
	grid_width = 32
	grid_height = 32

/obj/item/ms13/component/fusion
	name = "fusion core"
	desc = "A fusion core. Careful not to drop it!"
	icon_state = "fusion_core"

/obj/item/ms13/component/vacuum_tube
	name = "vacuum tube"
	desc = "A vacuum tube. An important component in many electrical gadgets."
	icon_state = "vacuumtube"
	grid_width = 64
	grid_height = 32

/obj/item/ms13/component/plasma_battery
	name = "plasma battery"
	desc = "A dangerous looking battery containing superheated plasma. Practically just waiting to be used for something lethal."
	icon_state = "plasma_battery"
	grid_width = 32
	grid_height = 64

/obj/item/ms13/component/gunpowder
	name = "high quality gunpowder"
	desc = "High quality, refined gunpowder. Can be used to make standard quality ammunition."
	icon_state = "gunpowder"
	grid_width = 32
	grid_height = 32


/obj/item/ms13/component/gunpowder/lq
	name = "low quality gunpowder"
	desc = "Low quality, impure, and probably dangerous gunpowder. Can be used to make junk ammunition."

// Light items (bulbs and stuff) //

/obj/item/light/ms13
	icon = 'mojave/icons/objects/crafting/components_world.dmi'
	force = 2
	throwforce = 5

/obj/item/light/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/crafting/components_inventory.dmi')

/obj/item/light/ms13/tube
	name = "light tube"
	desc = "A tube used for lighting."
	icon_state = "ltube"
	base_state = "ltube"
	inhand_icon_state = "c_tube"
	brightness = 7
	grid_width = 64
	grid_height = 32


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
	grid_width = 32
	grid_height = 32


/obj/item/light/ms13/bulb/broken
	status = LIGHT_BROKEN

/obj/item/light/ms13/bulb/burned
	status = LIGHT_BURNED
