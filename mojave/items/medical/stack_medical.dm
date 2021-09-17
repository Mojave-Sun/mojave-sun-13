//Children of base TG stack medical items should go here

/obj/item/stack/medical/suture/ms13
    name = "suture"
    singular_name = "use" //This is so that examine text says "X uses left in the stack" instead of "X SUTURES left in the stack"
    desc = "A medical suture. Used to mend bleeding wounds and tend brute related injuries."
    icon = 'mojave/icons/objects/medical/medical_world.dmi'
    icon_state = "suture"
    max_amount = 12
    amount = 12
    self_delay = 4 SECONDS
    other_delay = 2 SECONDS
    heal_brute = 8
    stop_bleeding = 0.65
    gender = NEUTER //So examine text says "This is a suture" instead of "These are some suture"
    merge_type = /obj/item/stack/medical/suture/ms13

/obj/item/stack/medical/suture/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/stack/medical/suture/ms13/four
    amount = 4

/obj/item/stack/medical/suture/ms13/eight
    amount = 8

/obj/item/stack/medical/ointment/ms13
    name = "bottle of ointment"
    desc = "A high quality bottle of ointment meant to be applied to burn wounds. Sanitizes and greatly aids in the healing process of burn related injuries."
    singular_name = "use" //This is so that examine text says "X uses left in the stack" instead of "X OINTMENTS left in the stack"
    icon = 'mojave/icons/objects/medical/medical_world.dmi'
    lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
    righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
    icon_state = "ointment"
    inhand_icon_state = "ointment"
    amount = 12
    max_amount = 12
    repeating = TRUE
    self_delay = 2.5 SECONDS
    other_delay = 1.5 SECONDS
    heal_burn = 8
    flesh_regeneration = 3
    sanitization = 1.25
    gender = NEUTER //So examine text says "This is a bottle of ointment" instead of "These are some bottle of ointment"
    merge_type = /obj/item/stack/medical/ointment/ms13

/obj/item/stack/medical/ointment/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/stack/medical/ointment/ms13/aloe
    name = "aloe"
    desc = "Some aloe vera that has been prepared for easier application of it's burn healing properties."
    singular_name = "aloe limb"
    icon_state = "aloe"
    inhand_icon_state = "aloe"
    amount = 10
    max_amount = 10
    heal_burn = 4
    flesh_regeneration = 1.5
    sanitization = 0.5
    gender = PLURAL
    merge_type = /obj/item/stack/medical/ointment/ms13/aloe

/obj/item/stack/medical/ointment/ms13/cream
    name = "burn cream"
    desc = "A small container of healing cream meant for burn related injuries."
    icon_state = "burncream"
    inhand_icon_state = "burncream"
    heal_burn = 6
    flesh_regeneration = 2
    sanitization = 0.75
    gender = PLURAL
    merge_type = /obj/item/stack/medical/ointment/ms13/cream

/obj/item/stack/medical/ointment/ms13/cream/half
    amount = 6

/obj/item/stack/medical/gauze/ms13
    name = "gauze"
    desc = "A roll of cloth intended for soaking up blood from bleeding wounds, or mildly supporting a broken bone."
    singular_name = "rolls of gauze"
    icon = 'mojave/icons/objects/medical/medical_world.dmi'
    lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
    righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
    icon_state = "bandage"
    inhand_icon_state = "bandage"
    self_delay = 3 SECONDS
    other_delay = 1.5 SECONDS
    max_amount = 12
    amount = 12
    absorption_rate = 0.13
    absorption_capacity = 4 //Capacity plus rate should mean this lasts about 30 seconds on average
    splint_factor = 0.5
    merge_type = /obj/item/stack/medical/gauze/ms13

/obj/item/stack/medical/gauze/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/stack/medical/gauze/ms13/half
    amount = 6

/obj/item/stack/medical/gauze/ms13/three
    amount = 3

/obj/item/stack/medical/gauze/ms13/military
    name = "military gauze"
    desc = "A sterile and elastic roll of gauze with a handle used to help pin the dressing down. Very good at soaking up blood from wounds and can be used as a splint for a broken bone."
    icon_state = "bandage_m"
    inhand_icon_state = "bandage_m"
    absorption_rate = 0.2
    absorption_capacity = 6 //Capacity plus rate should mean this lasts about 30 seconds on average
    splint_factor = 0.4 //Lower = better
    merge_type = /obj/item/stack/medical/gauze/ms13/military
