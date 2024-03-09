
/// Generic tombstone structure, not to be placed
/obj/structure/ms13/tombstone
	name = "generic tombstone"
	desc = "A generic tombstone."
	icon = 'mojave/icons/structure/grave.dmi'
	icon_state = "cairn"
	max_integrity = 100
	anchored = TRUE
	density = TRUE
	projectile_passchance = 75

/// A pile of rocks, cannot be engraved
/obj/structure/ms13/tombstone/cairn
	name = "cairn"
	desc = "A human-made pile of stones raised as a burial mound."
	icon_state = "cairn"

/obj/structure/ms13/tombstone/cairn/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/ceramic(loc, 1)
	qdel(src)

/// Generic slab structure, not to be placed, can be engraved with a message
/obj/structure/ms13/tombstone/slab
	// TODO: etching mechanism for inscription

/// Wooden cross, can be engraved
/obj/structure/ms13/tombstone/slab/cross
	name = "wooden cross"
	desc = "A wooden cross haphazardly built with planks held together by rusted nails."
	icon_state = "cross"
	var/style  // Visual style of the cross

/obj/structure/ms13/tombstone/slab/cross/Initialize()
	. = ..()
	style = rand(0, 3)
	icon_state = "[icon_state]_[style]"
	register_context()

/obj/structure/ms13/tombstone/slab/cross/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	if (isnull(held_item))
		context[SCREENTIP_CONTEXT_RMB] = "Rotate"
		return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/tombstone/slab/cross/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return

	. = SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

	// Rotate the cross
	style = (style + 1) % 4
	icon_state = "[icon_state]_[style]"

/obj/structure/ms13/tombstone/slab/cross/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, 2)
	qdel(src)

/// Wooden slab, can be engraved
/obj/structure/ms13/tombstone/slab/plank
	name = "wooden slab"
	desc = "A crude wooden slab marking a burial site."
	icon_state = "plank"

/obj/structure/ms13/tombstone/slab/plank/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc)
	qdel(src)

/// Stone slab, can be engraved
/obj/structure/ms13/tombstone/slab/stone
	name = "tombstone"
	desc = "A stone slab, often placed over a grave as a memorial."
	icon_state = "tombstone"

/obj/structure/ms13/tombstone/slab/stone/Initialize()
	. = ..()
	icon_state = "[icon_state]_[rand(0, 2)]"

/obj/structure/ms13/tombstone/slab/stone/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/ceramic(loc, 1)
	qdel(src)
