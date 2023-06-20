//////////////////////////////////////////////////////////////////////////////////////////////
//CONTAINS MS13 BASE STACK TYPE AND NON-METAL STACKS, metal stacks are in metal_materials.dm//
//////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/stack/sheet/ms13
	icon = 'mojave/icons/objects/crafting/materials_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	force = 0
	throwforce = 0
	merge_type = /obj/item/stack/sheet/ms13
	w_class = WEIGHT_CLASS_SMALL
	grid_width = 64
	grid_height = 32
	novariants = TRUE
/*
/obj/item/stack/sheet/ms13/update_icon_state()
	if(novariants)
		return ..()
	if(amount <= (max_amount * (1/3)))
		grid_width = 64
		grid_height = 32
		return ..()
	if (amount <= (max_amount * (2/3)))
		grid_width = 96
		grid_height = 64
		return ..()
	grid_width = 126
	grid_height = 96
	return ..()
*/
/obj/item/stack/sheet/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/crafting/materials_inventory.dmi')
	update_icon_state()

//MISC. MATERIALS//

/obj/item/stack/sheet/ms13/scrap_parts
	name = "scrap parts"
	desc = "Assorted parts like nuts, bolts, screws, and springs."
	singular_name = "scrap part"
	icon_state = "scrap_parts"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_parts
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY
	novariants = FALSE

/obj/item/stack/sheet/ms13/scrap_parts/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap_parts/five
	amount = 5

/obj/item/stack/sheet/ms13/scrap_parts/ten
	amount = 10

/datum/material/ms13/scrap_parts
	name = "scrap parts"
	desc = "Assorted scrap parts."
	color = "#817e7e"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_parts
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/rubber
	name = "rubber"
	desc = "Resilient pieces of rubber."
	singular_name = "rubber piece"
	icon_state = "rubber"
	merge_type = /obj/item/stack/sheet/ms13/rubber
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/rubber/two
	amount = 2

/datum/material/ms13/rubber
	name = "rubber"
	desc = "Pieces of rubber."
	color = "#131212"
	sheet_type = /obj/item/stack/sheet/ms13/rubber
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/plastic
	name = "plastic"
	desc = "Bright bits and pieces of plastic. Probably a choking hazard."
	singular_name = "plastice piece"
	icon_state = "plastic"
	merge_type = /obj/item/stack/sheet/ms13/plastic
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/plastic/two
	amount = 2

/datum/material/ms13/plastic
	name = "plastic"
	desc = "Pieces of plastic."
	color = "#d3dd43"
	sheet_type = /obj/item/stack/sheet/ms13/plastic
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/ceramic
	name = "ceramic shards"
	desc = "Sharp shards and pieces of ceramic. Handle with care."
	singular_name = "ceramic shard"
	icon_state = "ceramic"
	merge_type = /obj/item/stack/sheet/ms13/ceramic
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY
	novariants = FALSE

/obj/item/stack/sheet/ms13/ceramic/two
	amount = 2

/datum/material/ms13/ceramic
	name = "ceramic shards"
	desc = "Sharp pieces of ceramic."
	color = "#501a0a"
	sheet_type = /obj/item/stack/sheet/ms13/ceramic
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/glass
	name = "glass shards"
	desc = "Shiny, sharp shards of glass. Be careful!"
	singular_name = "glass shard"
	icon_state = "scrap_glass"
	merge_type = /obj/item/stack/sheet/ms13/glass
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY
	novariants = FALSE
	grind_results = list(
		/datum/reagent/toxin/ms13/fiberglass = 10,
	)

/obj/item/stack/sheet/ms13/glass/Initialize()
	. = ..()
	var/static/list/food_results = list(
		/datum/reagent/toxin/ms13/fiberglass = 10,
	)
	AddComponent(/datum/component/edible,\
				initial_reagents = food_results,\
				foodtypes = GROSS,\
				after_eat = CALLBACK(src, .proc/on_bite), \
				volume = INFINITY)

/// Called when someone bites this food, subtract one from our stack
/obj/item/stack/sheet/ms13/glass/proc/on_bite(mob/eater)
	use(1)

/obj/item/stack/sheet/ms13/glass/two
	amount = 2

/datum/material/ms13/glass
	name = "glass shards"
	desc = "Shards and pieces of glass."
	color = "#bbb3b1"
	sheet_type = /obj/item/stack/sheet/ms13/glass
	beauty_modifier = 0
	strength_modifier = 1

//ELECTRONICS//

/obj/item/stack/sheet/ms13/scrap_electronics
	name = "scrap electronics"
	desc = "Various pieces of electronic parts. Some still useable, others not. Figure it out."
	singular_name = "scrap electronic piece"
	icon_state = "scrap_electronic"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_electronics
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY
	novariants = FALSE

/obj/item/stack/sheet/ms13/scrap_electronics/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap_electronics/five
	amount = 5

/obj/item/stack/sheet/ms13/scrap_electronics/ten
	amount = 10

/obj/item/stack/sheet/ms13/circuits
	name = "circuits"
	desc = "Scavenged circuits that can hopefully still be used for something."
	singular_name = "circuit board"
	icon_state = "circuits"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/circuits
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY
	novariants = FALSE

/obj/item/stack/sheet/ms13/circuits/two
	amount = 2

/obj/item/stack/sheet/ms13/circuits/eight
	amount = 8

//WOOD//

/obj/item/stack/sheet/ms13/wood
	name = "of any type of wood" //This makes it so crafting recipes state "2 of any type of wood". This base path is used so we can have crafting recipes, as the name implies, take any kind of wood.
	desc = "I am a crafting parent type placeholder."

/obj/item/stack/sheet/ms13/wood/log
	name = "logs"
	desc = "Sturdy wood logs."
	singular_name = "log"
	icon_state = "log"
	merge_type = /obj/item/stack/sheet/ms13/wood/log
	amount = 1
	max_amount = 6
	grid_width = 96
	grid_height = 64

GLOBAL_LIST_INIT(log_recipes, list ( \
	new/datum/stack_recipe("crude log wall", /turf/closed/wall/ms13/craftable/wood, 4, time = 40 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
))

/obj/item/stack/sheet/ms13/wood/log/get_main_recipes()
	. = ..()
	. += GLOB.log_recipes

/obj/item/stack/sheet/ms13/wood/log/attackby(obj/item/W, mob/user, params)
	if(W.sharpness & SHARP_AXE)
		if(amount > 1)
			user.show_message(span_notice("You can only chop one log at a time!"), MSG_VISUAL)
			return
		user.show_message(span_notice("You begin chopping \the [src] into wood planks!"), MSG_VISUAL)
		if(do_after(user, 4 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_MAKEPLANKS))
			user.show_message(span_notice("You make wood planks out of \the [src]!"), MSG_VISUAL)
			new /obj/item/stack/sheet/ms13/wood/plank/two(user.loc)
			qdel(src)

/obj/item/stack/sheet/ms13/wood/scrap_wood
	name = "scrap wood"
	desc = "Various scrap, low quality pieces of wood."
	singular_name = "scrap wood piece"
	icon_state = "scrap_wood"
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/wooden_pickup.ogg'
	merge_type = /obj/item/stack/sheet/ms13/wood/scrap_wood
	amount = 1
	max_amount = 10

/obj/item/stack/sheet/ms13/wood/scrap_wood/two
	amount = 2

/obj/item/stack/sheet/ms13/wood/scrap_wood/five
	amount = 5

GLOBAL_LIST_INIT(scrap_wood_recipes, list ( \
	new/datum/stack_recipe("crude scrap wood table", /obj/structure/table/ms13/wood/constructed/cobbled, 8, time = 20 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("wood bed", /obj/structure/bed/ms13/bedframe/wood, 5, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("campfire", /obj/structure/bonfire/ms13/campfire, 5, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
))

/obj/item/stack/sheet/ms13/wood/scrap_wood/get_main_recipes()
	. = ..()
	. += GLOB.scrap_wood_recipes

/obj/item/stack/sheet/ms13/wood/plank
	name = "wood planks"
	desc = "Robust wood planks. Perfect for crafting."
	singular_name = "wood plank"
	icon_state = "plank"
	force = 10 //funny bonk
	hitsound = list('mojave/sound/ms13weapons/meleesounds/wooden_hit1.ogg', 'mojave/sound/ms13weapons/meleesounds/wooden_hit2.ogg', 'mojave/sound/ms13weapons/meleesounds/wooden_hit3.ogg')
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/wooden_pickup.ogg'
	merge_type = /obj/item/stack/sheet/ms13/wood/plank
	amount = 1
	max_amount = 8
	grid_width = 96
	grid_height = 32
	novariants = FALSE

/obj/item/stack/sheet/ms13/wood/plank/two
	amount = 2

/obj/item/stack/sheet/ms13/wood/plank/four
	amount = 4

GLOBAL_LIST_INIT(plank_recipes, list ( \
	new/datum/stack_recipe("crude wood table", /obj/structure/table/ms13/wood/constructed, 4, time = 20 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("wood barricade", /obj/structure/ms13/barricade, 4, time = 15 SECONDS, one_per_turf = FALSE, on_floor = TRUE), \
	new/datum/stack_recipe("wood bed", /obj/structure/bed/ms13/bedframe/wood, 3, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("campfire", /obj/structure/bonfire/ms13/campfire, 3, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
))

/obj/item/stack/sheet/ms13/wood/plank/get_main_recipes()
	. = ..()
	. += GLOB.plank_recipes

//CLOTH-RELATED//

/obj/item/stack/sheet/ms13/cloth
	name = "cloth"
	desc = "Pieces of cloth that can be used for many things. Clothing, armor, weapons, medical supplies. Even making some gauze on the fly!"
	singular_name = "cloth piece"
	icon_state = "cloth"
	merge_type = /obj/item/stack/sheet/ms13/cloth
	max_amount = 10
	amount = 1
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/cloth/two
    amount = 2

/obj/item/stack/sheet/ms13/cloth/five
    amount = 5

GLOBAL_LIST_INIT(ms13cloth_recipes, list ( \
	new/datum/stack_recipe("roll of gauze", /obj/item/stack/medical/gauze/ms13/one, 2, time = 3 SECONDS, one_per_turf = FALSE, on_floor = FALSE), \
))

/obj/item/stack/sheet/ms13/cloth/get_main_recipes()
	. = ..()
	. += GLOB.ms13cloth_recipes

/obj/item/stack/sheet/ms13/leather
	name = "leather"
	desc = "Tough pieces of leather. Classic material for light armors."
	singular_name = "leather piece"
	icon_state = "leather"
	merge_type = /obj/item/stack/sheet/ms13/leather
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/leather/two
	amount = 2

/obj/item/stack/sheet/ms13/leather/five
	amount = 5

/obj/item/stack/sheet/ms13/mil_fiber
	name = "military fiber"
	desc = "Lightweight but very durable military grade fiber. Has a variety of applications."
	singular_name = "military fiber piece"
	icon_state = "militaryfiber"
	merge_type = /obj/item/stack/sheet/ms13/mil_fiber
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/mil_fiber/two
	amount = 2

/obj/item/stack/sheet/ms13/thread
	name = "thread"
	desc = "A spool of thread. Plenty of uses in the post apocalypse."
	singular_name = "thread piece"
	icon_state = "thread"
	merge_type = /obj/item/stack/sheet/ms13/thread
	amount = 1
	max_amount = 12
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/thread/two
	amount = 2

/obj/item/stack/sheet/ms13/thread/six
	amount = 6

//Old Stuff Below, Be Warned//

//COTTON//

/obj/item/stack/sheet/cotton/ms13
	name = "raw cotton bundle"
	desc = "A bundle of raw cotton ready to be spun on the loom."
	singular_name = "raw cotton ball"
	icon = 'mojave/icons/objects/materials.dmi'
	icon_state = "sheet-cotton"
	resistance_flags = FLAMMABLE
	force = 0
	throwforce = 0
	merge_type = /obj/item/stack/sheet/cotton
	max_amount = 30
	loom_result = /obj/item/stack/sheet/cloth //ms13
	grind_results = list(/datum/reagent/cellulose = 20)

/obj/item/stack/sheet/cotton/ms13/ten
	amount = 10

/obj/item/stack/sheet/cotton/ms13/twenty
	amount = 20

/obj/item/stack/sheet/cotton/ms13/thirty
	amount = 30
