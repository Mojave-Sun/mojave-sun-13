//Decorative and flavor/fluff things.

//street//

/obj/structure/filingcabinet/ms13/mail
	name = "postbox"
	desc = "Last pickup, October 22nd, 2077."
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "mailbox"
	pixel_y = 12

/obj/structure/filingcabinet/ms13/mail/old
	icon_state = "mailbox_old"

/obj/structure/ms13/storage/trashcan
	name = "trash can"
	desc = "An old trash can, used for getting the filth anywhere other than the street. Not that people care about that much, these days."
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "trashbin"
	anchored = FALSE
	pixel_y = 10
	materialtype = /obj/item/stack/sheet/ms13/scrap

/obj/structure/ms13/storage/trashcan/Initialize()
	. = ..()
	if(prob(25))
		icon_state = "[initial(icon_state)]-[rand(1,3)]"
		return

//signs/flags//

/obj/structure/fluff/ms13/
	name = "fluff ms13 basetype"
	desc = "CALL A CODER. CALL A CODER. But not for me. :reachforthesky:"
	icon = 'mojave/icons/structure/64x64_misc.dmi'
	icon_state = "base_class"

/obj/structure/fluff/ms13/mammoth_sign
	name = "\improper Mammoth Lakes sign"
	desc = "Welcome to Mammoth Lakes: the town where it's always winter!"
	icon = 'mojave/icons/structure/64x64_misc.dmi'
	icon_state = "mammoth_sign"

/obj/structure/fluff/ms13/largencrbanner
	name = "\improper NCR Banner"
	desc = "A large banner stretched along a somewhat sturdy metal pole. It bears the insignia of a bear, representative of the New California Republic."
	icon = 'mojave/icons/objects/flags32x64.dmi'
	icon_state = "ncrflag"

/obj/structure/fluff/ms13/ncrflag
	name = "\improper NCR flagpole"
	desc = "A very tall flag pole, You can almost see the NCR's flag up there!"
	icon = 'mojave/icons/structure/largeflags.dmi'
	icon_state = "ncrflag"
	pixel_x = -32

//Decorative Cable, functional WYCI//

/obj/structure/ms13/cable
	name = "cable"
	icon = 'mojave/icons/objects/cables.dmi'
	density = FALSE

/obj/structure/ms13/cable/red
	icon_state = "cable_red_straight"

/obj/structure/ms13/cable/red/curve
	icon_state = "cable_red_curved"

/obj/structure/ms13/cable/red/intersection
	icon_state = "cable_red_intersect"

/obj/structure/ms13/cable/red/connector
	icon_state = "cable_red_connector"

/obj/structure/ms13/cable/red/splice
	icon_state = "cable_red_spliced"

/obj/structure/ms13/cable/blue
	icon_state = "cable_blue_straight"

/obj/structure/ms13/cable/blue/curve
	icon_state = "cable_blue_curved"

/obj/structure/ms13/cable/blue/intersection
	icon_state = "cable_blue_intersect"

/obj/structure/ms13/cable/blue/connector
	icon_state = "cable_blue_connector"

/obj/structure/ms13/cable/blue/splice
	icon_state = "cable_blue_spliced"

/obj/structure/ms13/cable/green
	icon_state = "cable_green_straight"

/obj/structure/ms13/cable/green/curve
	icon_state = "cable_green_curved"

/obj/structure/ms13/cable/green/intersection
	icon_state = "cable_green_intersect"

/obj/structure/ms13/cable/green/connector
	icon_state = "cable_green_connector"

/obj/structure/ms13/cable/green/splice
	icon_state = "cable_green_spliced"

/obj/structure/ms13/cable/black
	icon_state = "cable_black_straight"

/obj/structure/ms13/cable/black/curve
	icon_state = "cable_black_curved"

/obj/structure/ms13/cable/black/intersection
	icon_state = "cable_black_intersect"

/obj/structure/ms13/cable/black/connector
	icon_state = "cable_black_connector"

/obj/structure/ms13/cable/black/splice
	icon_state = "cable_black_spliced"

//Turf Decor//

/obj/structure/ms13/turfdecor
	invisibility = INVISIBILITY_MAXIMUM

/obj/structure/ms13/turfdecor/drought
	icon = 'mojave/icons/structure/turf_decor.dmi'
	icon_state = "drought_1"

/obj/structure/ms13/turfdecor/drought/Initialize()
	. = ..()
	icon_state = "drought_[rand(1,31)]"

	switch(icon_state)
		if("drought_31")
			name = "skull"
		else
			name = "rocks"

	var/matrix/M = new
	M.Translate(rand(-5,5),rand(-5,5))
	transform = M

// Medical Decoration //

/obj/structure/ms13/medical_curtain
	name = "medical curtain"
	desc = "A vision blocker, used to shield eyes of the innocent from the sights of the deathly. These ones are secured firmly in the ground."
	icon = 'mojave/icons/structure/medical.dmi'
	icon_state = "curtain"
	layer = ABOVE_OBJ_LAYER
	max_integrity = 100
	anchored = TRUE // If they're to be unanchored, you might as well make them toppleable. Go ahead, codersprite it...
	pixel_y = 12
	opacity = TRUE


// Skeletons //

/obj/structure/ms13/skeleton
	name = "skeleton"
	desc = "The dust swept remains of a peoples long gone."
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "skeleton"
	density = FALSE
	anchored = TRUE

// Barrels //

/obj/structure/fluff/ms13/barrel
	name = "barrel"
	desc = "A sealed canister of mystery, closed to time."
	icon = 'mojave/icons/structure/barrels.dmi'
	max_integrity = 350
	armor = list("melee" = 20, "bullet" = 25, "laser" = 10, "energy" = 15, "bomb" = 15, "bio" = 0, "fire" = 100, "acid" = 100)
	anchored = TRUE
	density = TRUE
	var/icon_type = null
	var/amount = 3 //used for icon randomisation amount
	var/unique = FALSE //used to set if the icon is randomised or not

/obj/structure/fluff/ms13/barrel/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap/two(loc)
		new /obj/item/stack/sheet/ms13/scrap_steel(loc)
	qdel(src)

/obj/structure/fluff/ms13/barrel/Initialize()
	. = ..()
	if(!unique)
		icon_state = "[icon_type]_[rand(1, amount)]"

/obj/structure/fluff/ms13/barrel/single

/obj/structure/fluff/ms13/barrel/single/grey
	icon_state = "grey_1"
	icon_type = "grey"

/obj/structure/fluff/ms13/barrel/single/grey/one
	icon_state = "grey_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/grey/two
	icon_state = "grey_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/grey/three
	icon_state = "grey_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/red
	icon_state = "red_1"
	icon_type = "red"

/obj/structure/fluff/ms13/barrel/single/red/one
	icon_state = "red_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/red/two
	icon_state = "red_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/red/three
	icon_state = "red_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/yellow
	icon_state = "yellow_1"
	icon_type = "yellow"

/obj/structure/fluff/ms13/barrel/single/yellow/one
	icon_state = "yellow_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/yellow/two
	icon_state = "yellow_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/yellow/three
	icon_state = "yellow_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/label
	icon_state = "label_1"
	icon_type = "label"

/obj/structure/fluff/ms13/barrel/single/label/one
	icon_state = "label_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/label/two
	icon_state = "label_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/label/three
	icon_state = "label_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/hazard
	icon_state = "hazard_1"
	icon_type = "hazard"

/obj/structure/fluff/ms13/barrel/single/hazard/one
	icon_state = "hazard_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/hazard/two
	icon_state = "hazard_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/hazard/three
	icon_state = "hazard_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/redalt
	icon_state = "red_alt_1"
	icon_type = "red_alt"

/obj/structure/fluff/ms13/barrel/single/redalt/one
	icon_state = "red_alt_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/redalt/two
	icon_state = "red_alt_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/redalt/three
	icon_state = "red_alt_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/toxic
	icon_state = "toxic_1"
	icon_type = "toxic"
	amount = 4

/obj/structure/fluff/ms13/barrel/single/toxic/Initialize()
	. = ..()
	AddElement(/datum/element/radioactive)

/obj/structure/fluff/ms13/barrel/single/toxic/one
	icon_state = "toxic_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/toxic/two
	icon_state = "toxic_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/toxic/three
	icon_state = "toxic_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/toxic/four
	icon_state = "toxic_4"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/waste
	icon_state = "waste_1"
	icon_type = "waste"

/obj/structure/fluff/ms13/barrel/single/waste/one
	icon_state = "waste_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/waste/two
	icon_state = "waste_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/waste/three
	icon_state = "waste_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/flammable
	icon_state = "flammable_1"
	icon_type = "flammable"

/obj/structure/fluff/ms13/barrel/single/flammable/one
	icon_state = "flammable_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/flammable/two
	icon_state = "flammable_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/flammable/three
	icon_state = "flammable_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/warning
	icon_state = "warning_1"
	icon_type = "warning"

/obj/structure/fluff/ms13/barrel/single/warning/one
	icon_state = "warning_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/warning/two
	icon_state = "warning_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/single/warning/three
	icon_state = "warning_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/double
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."
	amount = 2

/obj/structure/fluff/ms13/barrel/double/grey
	icon_state = "double_grey_1"
	icon_type = "double_grey"

/obj/structure/fluff/ms13/barrel/double/grey/one
	icon_state = "double_grey_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/double/grey/two
	icon_state = "double_grey_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/double/red
	icon_state = "double_red_1"
	icon_type = "double_red"

/obj/structure/fluff/ms13/barrel/double/red/one
	icon_state = "double_red_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/double/red/two
	icon_state = "double_red_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/double/yellow
	icon_state = "double_yellow_1"
	icon_type = "double_yellow"

/obj/structure/fluff/ms13/barrel/double/yellow/one
	icon_state = "double_yellow_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/double/yellow/two
	icon_state = "double_yellow_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/double/waste
	icon_state = "double_waste_1"
	icon_type = "double_waste"
	amount = 1

/obj/structure/fluff/ms13/barrel/triple
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."

/obj/structure/fluff/ms13/barrel/triple/grey
	icon_state = "triple_grey_1"
	icon_type = "triple_grey"

/obj/structure/fluff/ms13/barrel/triple/grey/one
	icon_state = "triple_grey_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/triple/grey/two
	icon_state = "triple_grey_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/triple/grey/three
	icon_state = "triple_grey_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/triple/red
	icon_state = "triple_red_1"
	icon_type = "triple_red"
	amount = 2

/obj/structure/fluff/ms13/barrel/triple/red/one
	icon_state = "triple_red_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/triple/red/two
	icon_state = "triple_red_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/triple/yellow
	icon_state = "triple_yellow_1"
	icon_type = "triple_yellow"

/obj/structure/fluff/ms13/barrel/triple/yellow/one
	icon_state = "triple_yellow_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/triple/yellow/two
	icon_state = "triple_yellow_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/triple/yellow/three
	icon_state = "triple_yellow_3"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/triple/waste
	icon_state = "triple_waste_1"
	icon_type = "triple_waste"
	amount = 2

/obj/structure/fluff/ms13/barrel/triple/waste/one
	icon_state = "triple_waste_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/triple/waste/two
	icon_state = "triple_waste_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/quadruple
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."
	amount = 1

/obj/structure/fluff/ms13/barrel/quadruple/grey
	icon_state = "quad_grey_1"
	icon_type = "quad_grey"

/obj/structure/fluff/ms13/barrel/quadruple/grey/one
	icon_state = "quad_grey_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/quadruple/red
	icon_state = "quad_red_1"
	icon_type = "quad_red"
	amount = 2

/obj/structure/fluff/ms13/barrel/quadruple/red/one
	icon_state = "quad_red_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/quadruple/red/two
	icon_state = "quad_red_2"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/quadruple/yellow
	icon_state = "quad_yellow_1"
	icon_type = "quad_yellow"

/obj/structure/fluff/ms13/barrel/quadruple/yellow/one
	icon_state = "quad_yellow_1"
	unique = TRUE

/obj/structure/fluff/ms13/barrel/quadruple/waste
	icon_state = "quad_waste_1"
	icon_type = "quad_waste"

/obj/structure/fluff/ms13/barrel/quadruple/waste/one
	icon_state = "quad_waste_1"
	unique = TRUE

/obj/structure/fluff/ms13/trash
	name = "Base type MS13 TRASH"
	desc = "Who the hell littered this here? Call a mapper!"
	icon = 'mojave/icons/structure/miscellaneous.dmi'

/obj/structure/fluff/ms13/trash/papers
	name = "scattered papers"
	desc = "Some scattered papers. They look mostly ruined."
	icon_state = "scattered_papers"

/obj/structure/fluff/ms13/trash/papers/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	to_chat(user, span_notice("You begin salvaging through the pile for a paper."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(20))
			to_chat(user, span_notice("You successfully recover a page from the stack. The rest all tear away into the void."))
			new /obj/item/paper/ms13(src)
			qdel(src)
		else
			to_chat(user, span_notice("You fail to find a paper that won't dissolve in your hands. Shame."))
			qdel(src)
