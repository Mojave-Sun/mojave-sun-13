//Children of base TG stack medical items should go here

/obj/item/stack/medical/suture/ms13
    name = "suture"
    singular_name = "use" //This is so that examine text says "X uses left in the stack" instead of "X SUTURES left in the stack"
    desc = "A medical suture. Safety of usage is not guarenteed for something like this with questionable sterility."
    icon = 'mojave/icons/objects/medical/medical_world.dmi'
    icon_state = "suture"
    w_class = WEIGHT_CLASS_SMALL
    full_w_class = WEIGHT_CLASS_SMALL
    max_amount = 12
    amount = 12
    self_delay = 35
    other_delay = 20
    gender = NEUTER //So examine text says "This is a suture" instead of "These are some suture"

/obj/item/stack/medical/suture/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/stack/medical/suture/ms13/half
    amount = 6

/obj/item/stack/medical/ointment/ms13
    name = "ointment"
    desc = "A bottle of cream meant to be applied to burn wounds. Sanitizes and aids in the healing process of burn related injuries."
    singular_name = "burn cream"
    icon = 'mojave/icons/objects/medical/medical_world.dmi'
    lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
    righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
    icon_state = "ointment"
    inhand_icon_state = "ointment"
    amount = 10
    max_amount = 10
    repeating = TRUE
    self_delay = 30
    other_delay = 15
    heal_burn = 15
    flesh_regeneration = 2
    sanitization = 1.25

/obj/item/stack/medical/ointment/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/stack/medical/ointment/ms13/half
	amount = 5
	max_amount = 5

/obj/item/stack/medical/ointment/ms13/aloe
    name = "aloe limb"
    desc = "A section of Aloe Vera, a highly sought plant for its healing properties. The end is slightly pulped to promote transfer of its gel to the skin as applied."
    icon_state = "aloe"
    inhand_icon_state = "aloe"
    heal_burn = 8

/obj/item/stack/medical/ointment/ms13/cream
    name = "burn cream"
    desc = "Some mediocre healing cream. it is able to mend burns decently. Don't count too much on it alone, though."
    icon_state = "burncream"
    inhand_icon_state = "burncream"
    amount = 12
    max_amount = 12
    self_delay = 35
    other_delay = 20
    heal_burn = 10
    sanitization = 0.35

/obj/item/stack/medical/gauze/ms13
    name = "bandage"
    desc = "A roll of cloth intended for soaking up blood from bleeding wounds, or mildly supporting a broken bone."
    singular_name = "rolls of gauze"
    icon = 'mojave/icons/objects/medical/medical_world.dmi'
    lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
    righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
    icon_state = "bandage"
    inhand_icon_state = "bandage"
    self_delay = 35
    other_delay = 20
    max_amount = 16
    amount = 16
    absorption_rate = 0.2
    absorption_capacity = 4
    splint_factor = 0.5

/obj/item/stack/medical/gauze/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/medical/medical_inventory.dmi')

/obj/item/stack/medical/gauze/ms13/half
    amount = 8

/obj/item/stack/medical/gauze/ms13/military
    name = "military dressing"
    desc = "A sterile and elastic roll of gauze with a handle used to help pin the dressing down. Very good at soaking up blood from wounds and can be used as a splint for a broken bone."
    icon_state = "bandage_m"
    inhand_icon_state = "bandage_m"
    absorption_rate = 0.3
    absorption_capacity = 6
    splint_factor = 0.4 //Lower = better
