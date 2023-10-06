//Decorative and flavor/fluff things.

//street//

/obj/structure/filingcabinet/ms13/mail
	name = "postbox"
	desc = "Last pickup, October 22nd, 2077."
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_hollow_2.wav'
	icon_state = "mailbox"
	pixel_y = 12
	projectile_passchance = 50

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
	projectile_passchance = 65

/obj/structure/ms13/storage/trashcan/Initialize()
	. = ..()
	if(prob(25))
		icon_state = "[initial(icon_state)]-[rand(1,3)]"
		return

//signs/flags//

/obj/structure/ms13
	name = "fluff ms13 basetype"
	desc = "CALL A CODER. CALL A CODER. But not for me. :reachforthesky:"
	icon = 'mojave/icons/structure/64x64_misc.dmi'
	icon_state = "base_class"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/ms13/mammoth_sign
	name = "\improper Mammoth Lakes sign"
	desc = "Welcome to Mammoth Lakes: the town where it's always winter!"
	icon = 'mojave/icons/structure/64x64_misc.dmi'
	icon_state = "mammoth_sign"

/obj/structure/ms13/largencrbanner
	name = "\improper NCR Banner"
	desc = "A large banner stretched along a somewhat sturdy metal pole. It bears the insignia of a bear, representative of the New California Republic."
	icon = 'mojave/icons/objects/flags32x64.dmi'
	icon_state = "ncrflag"
	max_integrity = 600

/obj/structure/ms13/ncrflag
	name = "\improper NCR flagpole"
	desc = "A very tall flag pole, You can almost see the NCR's flag up there!"
	icon = 'mojave/icons/structure/largeflags.dmi'
	icon_state = "ncrflag"
	pixel_x = -32
	layer = 4.9
	plane = ABOVE_GAME_PLANE

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
	density = FALSE

/obj/structure/ms13/turfdecor/drought //this shit looks whack af right now
	icon = 'mojave/icons/structure/turf_decor.dmi'
	icon_state = "drought_1"

/obj/structure/ms13/turfdecor/drought/Initialize()
	. = ..()
	icon_state = "drought_[rand(1,32)]"

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
	density = TRUE
	projectile_passchance = 95 // occasional dink off a pole or somethin...

// Skeletons //

/obj/structure/ms13/skeleton
	name = "skeleton"
	desc = "The dust swept remains of a peoples long gone."
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "skeleton"
	density = FALSE
	anchored = TRUE

// Barrels //

/obj/structure/ms13/barrel
	name = "barrel"
	desc = "A sealed canister of mystery, closed to time."
	icon = 'mojave/icons/structure/barrels.dmi'
	max_integrity = 400
	anchored = TRUE
	density = TRUE
	var/icon_type = null
	var/amount = 3 //used for icon randomisation amount
	var/unique = FALSE //used to set if the icon is randomised or not
	projectile_passchance = 65

/obj/structure/ms13/barrel/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap(loc, 3)
		new /obj/item/stack/sheet/ms13/scrap_steel(loc, 2)
	qdel(src)

/obj/structure/ms13/barrel/Initialize()
	. = ..()
	if(!unique)
		icon_state = "[icon_type]_[rand(1, amount)]"

/obj/structure/ms13/barrel/single

/obj/structure/ms13/barrel/single/grey
	icon_state = "grey_1"
	icon_type = "grey"

/obj/structure/ms13/barrel/single/grey/one
	icon_state = "grey_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/grey/two
	icon_state = "grey_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/grey/three
	icon_state = "grey_3"
	unique = TRUE

/obj/structure/ms13/barrel/single/red
	icon_state = "red_1"
	icon_type = "red"

/obj/structure/ms13/barrel/single/red/one
	icon_state = "red_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/red/two
	icon_state = "red_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/red/three
	icon_state = "red_3"
	unique = TRUE

/obj/structure/ms13/barrel/single/yellow
	icon_state = "yellow_1"
	icon_type = "yellow"

/obj/structure/ms13/barrel/single/yellow/one
	icon_state = "yellow_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/yellow/two
	icon_state = "yellow_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/yellow/three
	icon_state = "yellow_3"
	unique = TRUE

/obj/structure/ms13/barrel/single/label
	icon_state = "label_1"
	icon_type = "label"

/obj/structure/ms13/barrel/single/label/one
	icon_state = "label_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/label/two
	icon_state = "label_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/label/three
	icon_state = "label_3"
	unique = TRUE

/obj/structure/ms13/barrel/single/hazard
	icon_state = "hazard_1"
	icon_type = "hazard"

/obj/structure/ms13/barrel/single/hazard/one
	icon_state = "hazard_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/hazard/two
	icon_state = "hazard_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/hazard/three
	icon_state = "hazard_3"
	unique = TRUE

/obj/structure/ms13/barrel/single/redalt
	icon_state = "red_alt_1"
	icon_type = "red_alt"

/obj/structure/ms13/barrel/single/redalt/one
	icon_state = "red_alt_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/redalt/two
	icon_state = "red_alt_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/redalt/three
	icon_state = "red_alt_3"
	unique = TRUE

/obj/structure/ms13/barrel/single/toxic
	icon_state = "toxic_1"
	icon_type = "toxic"
	amount = 4
	light_range = 1.5
	light_color = "#4ba54f"

/obj/structure/ms13/barrel/single/toxic/Initialize()
	. = ..()
	AddElement(/datum/element/radioactive)

/obj/structure/ms13/barrel/single/toxic/one
	icon_state = "toxic_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/toxic/two
	icon_state = "toxic_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/toxic/three
	icon_state = "toxic_3"
	unique = TRUE

/obj/structure/ms13/barrel/single/toxic/four
	icon_state = "toxic_4"
	unique = TRUE

/obj/structure/ms13/barrel/single/waste
	icon_state = "waste_1"
	icon_type = "waste"

/obj/structure/ms13/barrel/single/waste/one
	icon_state = "waste_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/waste/two
	icon_state = "waste_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/waste/three
	icon_state = "waste_3"
	unique = TRUE

/obj/structure/ms13/barrel/single/flammable
	icon_state = "flammable_1"
	icon_type = "flammable"

/obj/structure/ms13/barrel/single/flammable/one
	icon_state = "flammable_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/flammable/two
	icon_state = "flammable_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/flammable/three
	icon_state = "flammable_3"
	unique = TRUE

/obj/structure/ms13/barrel/single/warning
	icon_state = "warning_1"
	icon_type = "warning"

/obj/structure/ms13/barrel/single/warning/one
	icon_state = "warning_1"
	unique = TRUE

/obj/structure/ms13/barrel/single/warning/two
	icon_state = "warning_2"
	unique = TRUE

/obj/structure/ms13/barrel/single/warning/three
	icon_state = "warning_3"
	unique = TRUE

/obj/structure/ms13/barrel/double
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."
	amount = 2

/obj/structure/ms13/barrel/double/grey
	icon_state = "double_grey_1"
	icon_type = "double_grey"

/obj/structure/ms13/barrel/double/grey/one
	icon_state = "double_grey_1"
	unique = TRUE

/obj/structure/ms13/barrel/double/grey/two
	icon_state = "double_grey_2"
	unique = TRUE

/obj/structure/ms13/barrel/double/red
	icon_state = "double_red_1"
	icon_type = "double_red"

/obj/structure/ms13/barrel/double/red/one
	icon_state = "double_red_1"
	unique = TRUE

/obj/structure/ms13/barrel/double/red/two
	icon_state = "double_red_2"
	unique = TRUE

/obj/structure/ms13/barrel/double/yellow
	icon_state = "double_yellow_1"
	icon_type = "double_yellow"

/obj/structure/ms13/barrel/double/yellow/one
	icon_state = "double_yellow_1"
	unique = TRUE

/obj/structure/ms13/barrel/double/yellow/two
	icon_state = "double_yellow_2"
	unique = TRUE

/obj/structure/ms13/barrel/double/waste
	icon_state = "double_waste_1"
	icon_type = "double_waste"
	amount = 1

/obj/structure/ms13/barrel/triple
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."

/obj/structure/ms13/barrel/triple/grey
	icon_state = "triple_grey_1"
	icon_type = "triple_grey"

/obj/structure/ms13/barrel/triple/grey/one
	icon_state = "triple_grey_1"
	unique = TRUE

/obj/structure/ms13/barrel/triple/grey/two
	icon_state = "triple_grey_2"
	unique = TRUE

/obj/structure/ms13/barrel/triple/grey/three
	icon_state = "triple_grey_3"
	unique = TRUE

/obj/structure/ms13/barrel/triple/red
	icon_state = "triple_red_1"
	icon_type = "triple_red"
	amount = 2

/obj/structure/ms13/barrel/triple/red/one
	icon_state = "triple_red_1"
	unique = TRUE

/obj/structure/ms13/barrel/triple/red/two
	icon_state = "triple_red_2"
	unique = TRUE

/obj/structure/ms13/barrel/triple/yellow
	icon_state = "triple_yellow_1"
	icon_type = "triple_yellow"

/obj/structure/ms13/barrel/triple/yellow/one
	icon_state = "triple_yellow_1"
	unique = TRUE

/obj/structure/ms13/barrel/triple/yellow/two
	icon_state = "triple_yellow_2"
	unique = TRUE

/obj/structure/ms13/barrel/triple/yellow/three
	icon_state = "triple_yellow_3"
	unique = TRUE

/obj/structure/ms13/barrel/triple/waste
	icon_state = "triple_waste_1"
	icon_type = "triple_waste"
	amount = 2

/obj/structure/ms13/barrel/triple/waste/one
	icon_state = "triple_waste_1"
	unique = TRUE

/obj/structure/ms13/barrel/triple/waste/two
	icon_state = "triple_waste_2"
	unique = TRUE

/obj/structure/ms13/barrel/quadruple
	name = "barrels"
	desc = "Sealed canisters of mystery, closed to time."
	amount = 1

/obj/structure/ms13/barrel/quadruple/grey
	icon_state = "quad_grey_1"
	icon_type = "quad_grey"

/obj/structure/ms13/barrel/quadruple/grey/one
	icon_state = "quad_grey_1"
	unique = TRUE

/obj/structure/ms13/barrel/quadruple/red
	icon_state = "quad_red_1"
	icon_type = "quad_red"
	amount = 2

/obj/structure/ms13/barrel/quadruple/red/one
	icon_state = "quad_red_1"
	unique = TRUE

/obj/structure/ms13/barrel/quadruple/red/two
	icon_state = "quad_red_2"
	unique = TRUE

/obj/structure/ms13/barrel/quadruple/yellow
	icon_state = "quad_yellow_1"
	icon_type = "quad_yellow"

/obj/structure/ms13/barrel/quadruple/yellow/one
	icon_state = "quad_yellow_1"
	unique = TRUE

/obj/structure/ms13/barrel/quadruple/waste
	icon_state = "quad_waste_1"
	icon_type = "quad_waste"

/obj/structure/ms13/barrel/quadruple/waste/one
	icon_state = "quad_waste_1"
	unique = TRUE

// Wooden Pallets //

/obj/structure/ms13/pallet
	name = "wooden pallet"
	desc = "A wooden pallet. You could get some good wood off that, probably."
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "pallet"
	max_integrity = 100
	anchored = TRUE
	density = FALSE

/obj/structure/ms13/pallet/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
		else
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, 1)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
	qdel(src)

/obj/structure/ms13/pallet/crowbar_act_secondary(mob/living/user, obj/item/tool)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	user.visible_message("<span class='notice'>[user] starts to break \the [src].</span>", \
		"<span class='notice'>You start to break \the [src].</span>", \
		"<span class='hear'>You hear splitting wood.</span>")
	tool.play_tool_sound(src)
	if(do_after(user, 4 SECONDS * tool.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		playsound(src.loc, 'mojave/sound/ms13effects/wood_deconstruction.ogg', 50, TRUE)
		user.visible_message("<span class='notice'>[user] pries \the [src] into pieces.</span>", \
			"<span class='notice'>You pry \the [src] into pieces.</span>", \
			"<span class='hear'>You hear splitting wood.</span>")
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/ms13/pallet/stack
	name = "pallet stack"
	desc = "A stack of wooden pallets. Some good planks in there, still."
	icon_state = "pallet_stack"
	max_integrity = 250
	density = TRUE
	projectile_passchance = 65

/obj/structure/ms13/pallet/stack/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/wood/plank(loc, 3)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 2)
		else
			new /obj/item/stack/sheet/ms13/wood/plank(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 1)
	qdel(src)

// brix.... //

/obj/structure/ms13/brickstack
	name = "brick stack"
	desc = "A stack of bricks. They're all stuck together... Great."
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "brickpile"
	max_integrity = 600
	density = TRUE
	anchored = TRUE
	projectile_passchance = 35

/obj/structure/ms13/brickstack/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/ms13/brick(loc, rand(1,3))
	qdel(src)


// TRASH.... //
/obj/structure/ms13/trash
	name = "Base type MS13 TRASH"
	desc = "Who the hell littered this here? Call a mapper!"
	icon = 'mojave/icons/structure/miscellaneous.dmi'

/obj/structure/ms13/trash/papers
	name = "scattered pages"
	desc = "Some scattered paper pages. They look mostly ruined."
	icon_state = "scattered_papers"

/obj/structure/ms13/trash/papers/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	to_chat(user, span_notice("You begin salvaging through the pile for a paper."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(15))
			user.visible_message(span_notice("[user] successfully recovers paper from the [src]."), \
				span_notice("You recover some paper from the [src]"))
			new /obj/item/paper/ms13(loc)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to find any usable paper"), \
				span_notice("You fail to find any usable paper within the [src]."))
			if(prob(70)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/ms13/trash/papers/one
	name = "scattered papers"
	desc = "Some scattered papers. All sorts of stuff, from pages to envelopes."
	icon_state = "papers_1"

/obj/structure/ms13/trash/papers/two
	name = "scattered papers"
	desc = "Some scattered papers. All sorts of stuff, from pages to envelopes."
	icon_state = "papers_2"

/obj/structure/ms13/trash/papers/three
	name = "scattered papers"
	desc = "Some scattered papers. All sorts of stuff, from pages to envelopes."
	icon_state = "papers_3"

/obj/structure/ms13/trash/books
	name = "ruined stack of books"
	desc = "A small stack of ruined books. A librarian's worst nightmare."
	icon_state = "bookstack_1"

/obj/structure/ms13/trash/books/Initialize(mapload)
	. = ..()
	icon_state = pick("bookstack_1","bookstack_2","bookstack_3")

/obj/structure/ms13/trash/books/attack_hand(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	to_chat(user, span_notice("You begin salvaging through the books for some paper."))
	if(do_after(user, 8 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] successfully recovers paper from [src]."), \
				span_notice("You recover some paper from [src]"))
			new /obj/item/paper/ms13(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to find any usable paper"), \
				span_notice("You fail to find any usable paper within [src]."))
			if(prob(50)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/ms13/trash/books/pile
	name = "pile of books"
	desc = "A large, messy pile of ruined books. Would make any intellectual cry."
	icon_state = "bookpile_1"

/obj/structure/ms13/trash/books/pile/Initialize(mapload)
	. = ..()
	icon_state = pick("bookpile_1","bookpile_2","bookpile_3")

/obj/structure/ms13/trash/books/pile_alt
	name = "pile of books"
	desc = "A large, messy pile of ruined books. Would make any intellectual cry."
	icon_state = "bookpile_5"

/obj/structure/ms13/trash/books/pile_alt/Initialize(mapload)
	. = ..()
	icon_state = pick("bookpile_4","bookpile_5","bookpile_6")

/obj/structure/ms13/trash/cardboard
	name = "scattered cardboard"
	desc = "Old cardboard boxes... Thrown all over the place. What a mess."
	icon_state = "cardboard"

/obj/structure/ms13/trash/cardboard/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	to_chat(user, span_notice("You begin salvaging through the [src]."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(20))
			user.visible_message(span_notice("[user] successfully recovers paper from the [src]."), \
				span_notice("You recover some paper from the [src]"))
			new /obj/item/paper/ms13(loc, rand(1,2))
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to find any usable paper"), \
				span_notice("You fail to find any usable paper within the [src]."))
			qdel(src)

/obj/structure/ms13/trash/bricks
	name = "brick rubble"
	desc = "A bunch of old bricks. Perhaps you can still find a few that will hold up."
	icon_state = "brickrubble"

/obj/structure/ms13/trash/bricks/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	to_chat(user, span_notice("You begin salvaging through the rubble for some bricks."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(20))
			user.visible_message(span_notice("[user] begins to sift through the [src] for usable bricks."), \
				span_notice("You begin to dig through the [src] for usable bricks."))
			new /obj/item/ms13/brick(loc, rand(1,2))
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to find a usable brick."), \
				span_notice("You fail to find a usable brick from the [src]"))
			if(prob(50)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/ms13/trash/wood
	name = "scrap wood"
	desc = "A bunch of scrap wood. You could probably get a few loose pieces."
	icon_state = "woodscrap"

/obj/structure/ms13/trash/wood/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to sift through the [src] for usable pieces."), \
		span_notice("You begin to dig through the [src] for some wood."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(90)) // It's... scrap wood already.
			user.visible_message(span_notice("[user] gathers up the [src]."), \
				span_notice("You gather up all the [src]."))
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, rand(1,2))
			qdel(src)
		else
			user.visible_message(span_notice("[user] somehow messes up gathering the [src]. It melts before their very eyes into nothingness."), \
				span_notice("You somehow manage to mess up gathering the perfectly fine scrap wood. It melts away before your very eyes..."))
			qdel(src)

/obj/structure/ms13/trash/food
	name = "DO NOT USE ME - base type food trash"
	desc = "I am a base type and if you see me in the map someone made a mistake."
	icon_state = "foodstuff_1"

/obj/structure/ms13/trash/food/dinner
	name = "decrepit dinnerware"
	desc = "A small, moldy, and disgusting collection of old silverware, plates, and similar dining utensils. Perhaps the truly desperate could still find some use out of this."
	icon_state = "foodstuff_1"

/obj/structure/ms13/trash/food/dinner/Initialize(mapload)
	. = ..()
	icon_state = pick("foodstuff_1","foodstuff_5")

/obj/structure/ms13/trash/food/dinner/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through the [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] gathers up materials from the [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/ms13/ceramic(loc, 1)
			new /obj/item/stack/sheet/ms13/scrap(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from the [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(65)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/ms13/trash/food/glass
	name = "empty bottle and can"
	desc = "An empty glass bottle and an aluminum can picked clean, with some utensils nearby."
	icon_state = "foodstuff_4"

/obj/structure/ms13/trash/food/glass/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(40))
			user.visible_message(span_notice("[user] gathers up materials from the [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/ms13/glass(loc, 1)
			new /obj/item/stack/sheet/ms13/scrap_alu(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from the [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(75)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/ms13/trash/food/misc
	name = "old eating utensils"
	desc = "Moldy silverware, empty cans, and similar utensils. The remnants of a feast no doubt."
	icon_state = "foodstuff_6"

/obj/structure/ms13/trash/food/misc/Initialize(mapload)
	. = ..()
	icon_state = pick("foodstuff_2","foodstuff_3", "foodstuff_6")

/obj/structure/ms13/trash/food/misc/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] gathers up materials from [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/ms13/scrap(loc, 1)
			new /obj/item/stack/sheet/ms13/scrap_steel(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from the [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(65)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/ms13/trash/glass
	name = "DO NOT USE ME - base type glass trash"
	desc = "I am a base type and if you see me in the map someone made a mistake."
	icon_state = "glass_1"

/obj/structure/ms13/trash/glass/cans
	name = "empty bottles and cans"
	desc = "Some empty glass bottles and aluminum cans. You just might be able to make something out of this."
	icon_state = "glass_1"

/obj/structure/ms13/trash/glass/cans/Initialize(mapload)
	. = ..()
	icon_state = pick("glass_1","glass_2")

/obj/structure/ms13/trash/glass/cans/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through the [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] gathers up materials from the [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/ms13/glass(loc, 1)
			new /obj/item/stack/sheet/ms13/scrap_alu(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(75)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/ms13/trash/glass/plate
	name = "glass bottles and dinnerware"
	desc = "Some empty glass bottles and a broken dinner plate. You just might be able to make something out of this."
	icon_state = "glass_6"

/obj/structure/ms13/trash/glass/plate/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] gathers up materials from [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/ms13/glass(loc, 1)
			new /obj/item/stack/sheet/ms13/ceramic(loc, 1)
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(75)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

/obj/structure/ms13/trash/glass/basic
	name = "empty glass bottles"
	desc = "A collection of empty glass bottles and broken pieces of some. Someone either had a very good or a very bad time here."
	icon_state = "glass_4"

/obj/structure/ms13/trash/glass/basic/Initialize(mapload)
	. = ..()
	icon_state = pick("glass_3","glass_4", "glass_5")

/obj/structure/ms13/trash/glass/basic/attack_hand_secondary(mob/living/user, list/modifiers)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return
	user.visible_message(span_notice("[user] begins to search through [src] for usable materials."), \
		span_notice("You begin to search through [src] for some materials."))
	if(do_after(user, 5 SECONDS, src))
		if(prob(35))
			user.visible_message(span_notice("[user] gathers up materials from [src]."), \
				span_notice("You gather up some materials from [src]."))
			new /obj/item/stack/sheet/ms13/glass(loc, rand(1,4))
			qdel(src)
		else
			user.visible_message(span_notice("[user] fails to gather anything useful from [src]."), \
				span_notice("You don't manage to find anything useful from [src]."))
			if(prob(80)) // SO YOU'RE TELLING ME THERE'S A CHANCE...
				qdel(src)

// Cave Decor

/obj/structure/ms13/cave_decor
	icon = 'mojave/icons/structure/cave_decor.dmi'

/obj/structure/ms13/cave_decor/stalagmite
	name = "stalagmite"
	desc = "A column of rock formed over many years by minerals in water solidifying."
	icon_state = "stalagmite"
	max_integrity = 120
	anchored = TRUE
	density = TRUE

/obj/structure/ms13/cave_decor/stalagmite/Initialize()
	. = ..()
	icon_state = pick("stalagmite", "stalagmite1", "stalagmite2", "stalagmite3", "stalagmite4", "stalagmite5")

/obj/structure/ms13/cave_decor/minecart
	name = "minecart"
	desc = "Looks like it's been tipped over and left to rust."
	icon_state = "minecart_fallen"
	max_integrity = 160
	anchored = TRUE
	density = TRUE

/obj/structure/ms13/cave_decor/sign_left
	name = "sign"
	desc = "A sign, pointing left. But why?"
	icon_state = "sign_left"
	max_integrity = 80
	anchored = TRUE
	density = FALSE

/obj/structure/ms13/cave_decor/sign_left/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, 2)
		else
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc)
	qdel(src)

/obj/structure/ms13/cave_decor/sign_left/sign_right
	name = "sign"
	desc = "A sign pointing right. Well, it's right, so it must be right."
	icon_state = "sign_right"

// Board walkway bullshit

/obj/structure/ms13/cave_decor/boards
	name = "boards"
	desc = "Boards of wood for walking on, how convenient."
	anchored = TRUE
	density = FALSE
	max_integrity = 100
	var/boards = 1

/obj/structure/ms13/cave_decor/sign_left/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/wood/plank(loc)
		else
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc)
	qdel(src)

/obj/structure/ms13/cave_decor/boards/Initialize(mapload)
	. = ..()
	var/turf/my_turf = get_turf(loc)
	if(my_turf)
		ADD_TRAIT(my_turf, TRAIT_REMOVE_SLOWDOWN, BOARDS_ON_TURF)

/obj/structure/ms13/cave_decor/boards/Destroy()
	var/turf/my_turf = get_turf(loc)
	if(my_turf)
		REMOVE_TRAIT(my_turf, TRAIT_REMOVE_SLOWDOWN, BOARDS_ON_TURF)
	return ..()

/obj/structure/ms13/cave_decor/boards/mammoth/northsouth
	icon_state = "boards_mammoth_ns-1"

/obj/structure/ms13/cave_decor/boards/mammoth/northsouth/Initialize(mapload)
	. = ..()
	boards = rand(1,6)
	icon_state = "boards_mammoth_ns-[boards]"

/obj/structure/ms13/cave_decor/boards/mammoth/westeast
	icon_state = "boards_mammoth_we-1"

/obj/structure/ms13/cave_decor/boards/mammoth/westeast/Initialize(mapload)
	. = ..()
	boards = rand(1,6)
	icon_state = "boards_mammoth_we-[boards]"

/obj/structure/ms13/cave_decor/boards/drought/northsouth
	icon_state = "boards_drought_ns-1"

/obj/structure/ms13/cave_decor/boards/drought/northsouth/Initialize(mapload)
	. = ..()
	boards = rand(1,6)
	icon_state = "boards_drought_ns-[boards]"

/obj/structure/ms13/cave_decor/boards/drought/westeast
	icon_state = "boards_drought_we-1"

/obj/structure/ms13/cave_decor/boards/drought/westeast/Initialize(mapload)
	. = ..()
	boards = rand(1,6)
	icon_state = "boards_drought_we-[boards]"

// this sucked
// Mineshaft supports

/obj/structure/ms13/cave_decor/support
	name = "support beam"
	desc = "A support beam, to stabilize the roof of the mineshaft."
	icon_state = "support"
	anchored = TRUE
	density = FALSE
	pixel_y = 28

/obj/structure/ms13/cave_decor/support/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/wood/plank(loc, 4)
		else
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc, 3)
	qdel(src)

/obj/structure/ms13/cave_decor/support/beams
	name = "support beams"
	desc = "A couple of upright beams, supporting the roof of the mineshaft."
	icon_state = "support_beams"

/obj/structure/ms13/cave_decor/support/wall
	name = "supports and braces"
	desc = "A couple of support beams, and planks inbetween to brace it."
	icon_state = "support_wall"

/obj/structure/ms13/cave_decor/support/wall/broken
	name = "supports and braces"
	desc = "It looks like this support didn't stand the test of time, it's falling apart."
	icon_state = "support_wall_broken"

// Maybe make it so you can strap long-fuse/timed/remote-detonated dynamite to this at a later date
// to collapse a part of a mineshaft, easy escape or trap or ambush, it'd be cool maybe yeah
