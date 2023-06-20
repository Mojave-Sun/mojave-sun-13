//Children of base TG stack medical items should go here

/obj/item/stack/medical/ms13
	name = "generic MS13 healing stack"
	desc = "wow. cool. woo-ee. AHHHHHHHHHHHHHH"
	icon = 'mojave/icons/objects/medical/medical_inventory.dmi'

/obj/item/stack/medical
	grid_width = 32
	grid_height = 32

/*
/obj/item/stack/medical/update_icon_state()
	if(novariants)
		return ..()
	if(amount <= (max_amount * (1/3)))
		grid_width = 32
		grid_height = 32
		return ..()
	if (amount <= (max_amount * (2/3)))
		grid_width = 64
		grid_height = 32
		return ..()
	grid_width = 64
	grid_height = 64
	return ..()
*/
/obj/item/stack/medical/suture/ms13
	name = "suture"
	singular_name = "use" //This is so that examine text says "X uses left in the stack" instead of "X SUTURES left in the stack"
	desc = "A medical suture. Used to mend bleeding wounds and tend brute related injuries."
	icon = 'mojave/icons/objects/medical/medical_inventory.dmi'
	icon_state = "suture"
	max_amount = 12
	amount = 12
	self_delay = 3.5 SECONDS
	other_delay = 2 SECONDS
	repeating = FALSE
	heal_brute = 5
	stop_bleeding = 0.75
	gender = NEUTER //So examine text says "This is a suture" instead of "These are some suture"
	merge_type = /obj/item/stack/medical/suture/ms13

/obj/item/stack/medical/suture/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.60, 1)

/obj/item/stack/medical/suture/ms13/four
	amount = 4

/obj/item/stack/medical/suture/ms13/eight
	amount = 8

/obj/item/stack/medical/ointment/ms13
	name = "bottle of ointment"
	desc = "A basic bottle of ointment meant to be applied to burn wounds."
	singular_name = "use" //This is so that examine text says "X uses left in the stack" instead of "X OINTMENTS left in the stack"
	icon = 'mojave/icons/objects/medical/medical_inventory.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	icon_state = "ointment"
	inhand_icon_state = "ointment"
	amount = 12
	max_amount = 12
	repeating = FALSE
	self_delay = 2.5 SECONDS
	other_delay = 1.5 SECONDS
	heal_burn = 8
	flesh_regeneration = 2.25
	sanitization = 0.5
	gender = NEUTER //So examine text says "This is a bottle of ointment" instead of "These are some bottle of ointment"
	merge_type = /obj/item/stack/medical/ointment/ms13

/obj/item/stack/medical/ointment/ms13/half
	amount = 6

/obj/item/stack/medical/ointment/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.55, 1)

/obj/item/stack/medical/ointment/ms13/dressing
	name = "burn dressing"
	desc = "Some high quality burn dressings meant to be applied to burns to aid in the healing process."
	singular_name = "dressing"
	icon_state = "burndress"
	inhand_icon_state = null
	heal_burn = 12
	flesh_regeneration = 3
	sanitization = 1
	gender = PLURAL
	merge_type = /obj/item/stack/medical/ointment/ms13/dressing

/obj/item/stack/medical/ointment/ms13/dressing/half
	amount = 6

/obj/item/stack/medical/gauze/ms13
	name = "gauze"
	desc = "A roll of cloth intended for soaking up blood from bleeding wounds or making sure burn wounds stay clean."
	singular_name = "rolls of gauze"
	icon = 'mojave/icons/objects/medical/medical_inventory.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	icon_state = "bandage"
	inhand_icon_state = "bandage"
	self_delay = 2 SECONDS
	other_delay = 1 SECONDS
	max_amount = 12
	amount = 12
	novariants = TRUE
	burn_cleanliness_bonus = 0.5
	merge_type = /obj/item/stack/medical/gauze/ms13
	gauze_type = /datum/bodypart_aid/gauze/ms13

/obj/item/stack/medical/gauze/ms13/attackby(obj/item/I, mob/user, params)
	return

/obj/item/stack/medical/gauze/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.45, 1)

/obj/item/stack/medical/gauze/ms13/half
	amount = 6

/obj/item/stack/medical/gauze/ms13/three
	amount = 3

/obj/item/stack/medical/gauze/ms13/one
	amount = 1

/obj/item/stack/medical/gauze/ms13/military
	name = "military gauze"
	desc = "A sterile and elastic roll of gauze with a handle used to help pin the dressing down. Very good at soaking up blood from wounds."
	icon_state = "bandage_m"
	inhand_icon_state = "bandage_m"
	burn_cleanliness_bonus = 0.3 //Lower = better
	merge_type = /obj/item/stack/medical/gauze/ms13/military
	gauze_type = /datum/bodypart_aid/gauze/ms13/military

// Splints //

/obj/item/stack/medical/splint/ms13
	name = "metal splint"
	desc = "A medical grade metal splint designed to fasten a limb with ease, perfect for stabilizing broken bones and torn muscles. "
	icon = 'mojave/icons/objects/medical/medical_inventory.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	singular_name = "medical splint"
	icon_state = "splint_metal"
	self_delay = 5 SECONDS
	other_delay = 3 SECONDS
	max_amount = 1
	amount = 1
	merge_type = /obj/item/stack/medical/splint/ms13
	splint_type = /datum/bodypart_aid/splint/ms13
	novariants = TRUE
	w_class = WEIGHT_CLASS_SMALL
	grid_width = 64
	grid_height = 32

/obj/item/stack/medical/splint/ms13/attackby(obj/item/I, mob/user, params)
	return

/obj/item/stack/medical/splint/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.55, 1)

/obj/item/stack/medical/splint/ms13/wooden
	name = "wooden splint"
	desc = "A crude wooden splint, used to hold broken bones together to the best of their ability."
	singular_name = "wooden splint"
	icon_state = "splint_wood"
	self_delay = 6 SECONDS
	other_delay = 4 SECONDS
	merge_type = /obj/item/stack/medical/splint/ms13/wooden
	splint_type = /datum/bodypart_aid/splint/ms13/wooden

// Healing Powder //

/obj/item/stack/medical/ms13/healing_powder
	name = "healing powder"
	desc = "A bag of healing powder, comprised of a mixture of broc flower and xander root."
	singular_name = "bag of healing powder"
	icon_state = "healing_powder"
	self_delay = 2.5 SECONDS
	other_delay = 2 SECONDS
	amount = 5
	max_amount = 5
	heal_brute = 10
	heal_burn = 3
	novariants = TRUE
	merge_type = /obj/item/stack/medical/ms13/healing_powder

/obj/item/stack/medical/ms13/healing_powder/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.45, 1)

/obj/item/stack/medical/ms13/healing_powder/is_zero_amount(delete_if_zero = TRUE)
    if(amount < 1)
        new /obj/item/stack/sheet/ms13/cloth/two(get_turf(loc))
    return ..()

/obj/item/stack/medical/ms13/healing_powder/poultice
	name = "healing poultice"
	desc = "A potent poultice containing a mixture of various plants."
	singular_name = "poultice"
	icon_state = "healing_poultice"
	amount = 5
	max_amount = 5
	heal_brute = 15
	heal_burn = 8
	merge_type = /obj/item/stack/medical/ms13/healing_powder/poultice

/obj/item/stack/medical/ms13/healing_powder/burn
	name = "burn powder"
	desc = "A bag of burn powder, comprised of a mixture of ashrose and aster flower."
	singular_name = "bag of burn powder"
	icon_state = "burn_powder"
	amount = 5
	max_amount = 5
	heal_burn = 12
	flesh_regeneration = 1.5
	sanitization = 0.35
	merge_type = /obj/item/stack/medical/ms13/healing_powder/burn

/obj/item/stack/medical/ms13/balm
	name = "balm pouch"
	desc = "A potent healing balm pouch, containing a mixture of various chemicals. The back says something about danger and keeping it away from the eyes."
	singular_name = "balm pouch"
	icon_state = "balm"
	self_delay = 2.5 SECONDS
	other_delay = 2 SECONDS
	amount = 8
	max_amount = 8
	heal_brute = 12
	heal_burn = 12
	flesh_regeneration = 1.5
	sanitization = 0.15
	merge_type = /obj/item/stack/medical/ms13/balm
	novariants = TRUE

/obj/item/stack/medical/ms13/balm/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.55, 1)
