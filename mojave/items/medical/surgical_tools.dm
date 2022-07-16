//For surgical tools and similar medical items

/obj/item/hemostat/ms13
	name = "hemostat"
	desc = "A surgical tool primarily used for clamping and grasping during surgery."
	icon = 'mojave/icons/objects/medical/medical-tools_world.dmi'
	icon_state = "hemostat"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	inhand_icon_state = "clamps" //Going to use placeholder TG in-hands for now, Infra didn't provide any - Hekzder

/obj/item/hemostat/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/medical/medical-tools_inventory.dmi')

/obj/item/retractor/ms13
	name = "retractor"
	desc = "A surgical tool normally used for holding open a wound or incision."
	icon = 'mojave/icons/objects/medical/medical-tools_world.dmi'
	icon_state = "retractor"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	inhand_icon_state = "clamps" //Going to use placeholder TG in-hands for now, Infra didn't provide any - Hekzder

/obj/item/retractor/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/medical/medical-tools_inventory.dmi')

/obj/item/ms13/handsaw/bone
	name = "bone saw"
	desc = "A pre-war bone saw. Useful for amputations or cutting open a rib cage."
	icon = 'mojave/icons/objects/medical/medical-tools_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	icon_state = "bonesaw"
	inhand_icon_state = "handsaw" //Placeholder handsaw in-hand for now, Infra didn't provide a bonesaw in-hand - Hekzder
	force = 15
	wound_bonus = 0
	bare_wound_bonus = 5
	sharpness = SHARP_EDGED
	toolspeed = 1.75

/obj/item/ms13/handsaw/bone/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/medical/medical-tools_inventory.dmi')

/obj/item/cautery/ms13
	name = "cautery"
	desc = "A cautery used for stopping bleeding or closing wounds."
	icon = 'mojave/icons/objects/medical/medical-tools_world.dmi'
	icon_state = "cautery"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	inhand_icon_state = "cautery" //Going to use placeholder TG in-hands for now, Infra didn't provide any - Hekzder

/obj/item/cautery/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/medical/medical-tools_inventory.dmi')

/obj/item/scalpel/ms13
	name = "scalpel"
	desc = "A sharp surgical tool used for making incisions."
	icon = 'mojave/icons/objects/medical/medical-tools_world.dmi'
	icon_state = "scalpel"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	inhand_icon_state = "scalpel" //Going to use placeholder TG in-hands for now, Infra didn't provide any - Hekzder
	wound_bonus = 5
	bare_wound_bonus = 5

/obj/item/scalpel/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/medical/medical-tools_inventory.dmi')

//Consumables below

/obj/item/stack/medical/bone_gel/ms13
	name = "bone gel"
	singular_name = "use" //This is so that examine text says "X uses left in the stack" instead of "X BONE GELS left in the stack"
	desc = "An advanced medical gel used to treat and help to repair broken bones. Direct application possible but not advised."
	icon = 'mojave/icons/objects/medical/medical-tools_inventory.dmi'
	icon_state = "bone_gel"
	lefthand_file = null
	righthand_file = null //No in-hand for now, the TG bone gel looks way too different to justify it as a placeholder - Hekzder
	amount = 4
	max_amount = 4
	self_delay = 3 SECONDS
	other_delay = 2 SECONDS
	gender = NEUTER //So examine text says "This is bone gel" instead of "These are some bone gels"
	merge_type = /obj/item/stack/medical/bone_gel/ms13

/obj/item/stack/medical/bone_gel/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.50, 1)

/obj/item/stack/sticky_tape/surgical/ms13
	name = "surgical tape"
	singular_name = "use" //This is so that examine text says "X uses left in the stack" instead of "X SURGICAL TAPES left in the stack"
	desc = "Surgical sticky tape made mostly for treating broken bones."
	icon = 'mojave/icons/objects/medical/medical-tools_inventory.dmi'
	icon_state = "surgical_tape"
	prefix = "surgical"
	conferred_embed = null
	merge_type = /obj/item/stack/sticky_tape/surgical/ms13

/obj/item/stack/sticky_tape/surgical/ms13/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.50, 1)
