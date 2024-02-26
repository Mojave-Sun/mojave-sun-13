//////////////////////////////////////////////////////////////////////////////
//CONTAINS MS13 METAL STACKS, all other stacks/materials are in materials.dm//
//////////////////////////////////////////////////////////////////////////////

//SCRAP METAL//

/obj/item/stack/sheet/ms13/scrap
	name = "scrap metal"
	desc = "Assorted metal junk that has since become an indistinguishable clump of various old and corroded metals."
	singular_name = "scrap metal piece"
	icon_state = "scrap"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap
	amount = 1
	max_amount = 10
	novariants = FALSE

/obj/item/stack/sheet/ms13/scrap/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap/five
	amount = 5

GLOBAL_LIST_INIT(scrap_recipes, list ( \
	new/datum/stack_recipe("crude scrap wall", /turf/closed/wall/ms13/craftable/scrap, 8, time = 40 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("makeshift smelter", /obj/structure/ms13/smelter, 6, time = 30 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("fire barrel", /obj/structure/bonfire/ms13/fire_barrel, 4, time = 20 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
))

/obj/item/stack/sheet/ms13/scrap/get_main_recipes()
	. = ..()
	. += GLOB.scrap_recipes

/datum/material/ms13/scrap
	name = "scrap metal"
	desc = "Assorted metal junk."
	color = "#242323"
	sheet_type = /obj/item/stack/sheet/ms13/scrap
	beauty_modifier = 0
	strength_modifier = 1

//STEEL//

/obj/item/stack/sheet/ms13/scrap_steel
	name = "scrap steel"
	desc = "Scrap pieces of steel. Still quite strong and sturdy."
	singular_name = "scrap steel piece"
	icon_state = "scrap_steel"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_steel
	amount = 1
	max_amount = 10
	novariants = FALSE

/obj/item/stack/sheet/ms13/scrap_steel/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap_steel/four
	amount = 4

/obj/item/stack/sheet/ms13/scrap_steel/five
	amount = 5

/obj/item/stack/sheet/ms13/scrap_steel/ten
	amount = 10

GLOBAL_LIST_INIT(scrap_steel_recipes, list ( \
	new/datum/stack_recipe("crude scrap wall", /turf/closed/wall/ms13/craftable/scrap, 6, time = 40 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("makeshift smelter", /obj/structure/ms13/smelter, 4, time = 30 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("crude scrap metal table", /obj/structure/table/ms13/metal/constructed/cobbled, 4, time = 20 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("fire barrel", /obj/structure/bonfire/ms13/fire_barrel, 3, time = 20 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("green scrap metal chair", /obj/structure/chair/ms13/metal/unfinished, 2, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("blue scrap metal chair", /obj/structure/chair/ms13/metal/blue/unfinished, 2, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("red scrap metal chair", /obj/structure/chair/ms13/metal/red/unfinished, 2, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
))

/obj/item/stack/sheet/ms13/scrap_steel/get_main_recipes()
	. = ..()
	. += GLOB.scrap_steel_recipes

/datum/material/ms13/scrap_steel
	name = "scrap steel"
	desc = "Steel scrap metal."
	color = "#5e5b59"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_steel
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/refined_steel
	name = "refined steel"
	desc = "Well made, refined steel ingots."
	singular_name = "refined steel ingot"
	icon_state = "ingot_steel"
	merge_type = /obj/item/stack/sheet/ms13/refined_steel
	amount = 1
	max_amount = 6
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 96
	grid_height = 32

/obj/item/stack/sheet/ms13/refined_steel/two
	amount = 2

/datum/material/ms13/refined_steel
	name = "refined steel"
	desc = "Quality, refined steel."
	color = "#bbb2ac"
	sheet_type = /obj/item/stack/sheet/ms13/refined_steel
	beauty_modifier = 0
	strength_modifier = 1

GLOBAL_LIST_INIT(refined_steel_recipes, list ( \
	new/datum/stack_recipe("crude metal table", /obj/structure/table/ms13/metal/constructed, 2, time = 20 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("green metal chair", /obj/structure/chair/ms13/metal, 1, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("blue metal chair", /obj/structure/chair/ms13/metal/blue, 1, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("red metal chair", /obj/structure/chair/ms13/metal/red, 1, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
))

/obj/item/stack/sheet/ms13/refined_steel/get_main_recipes()
	. = ..()
	. += GLOB.refined_steel_recipes

//LEAD//

/obj/item/stack/sheet/ms13/scrap_lead
	name = "scrap lead"
	desc = "Scrap pieces of lead. Dense and dull."
	singular_name = "scrap lead piece"
	icon_state = "scrap_lead"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_lead
	amount = 1
	max_amount = 10

/obj/item/stack/sheet/ms13/scrap_lead/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap_lead/four
	amount = 4

/obj/item/stack/sheet/ms13/scrap_lead/five
	amount = 5

/datum/material/ms13/scrap_lead
	name = "scrap lead"
	desc = "Lead scrap metal."
	color = "#2e2b29"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_lead
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/refined_lead
	name = "refined lead"
	desc = "Dense and heavy lead ingots."
	singular_name = "refined lead ingot"
	icon_state = "ingot_lead"
	merge_type = /obj/item/stack/sheet/ms13/refined_lead
	amount = 1
	max_amount = 6
	grid_width = 96
	grid_height = 32

/obj/item/stack/sheet/ms13/refined_lead/two
	amount = 2

/datum/material/ms13/refined_lead
	name = "refined lead"
	desc = "Heavy, refined lead."
	color = "#2e2b29"
	sheet_type = /obj/item/stack/sheet/ms13/refined_lead
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/junk_bullets
	name = "junk bullets"
	desc = "Poor quality bullets made from scrap lead."
	singular_name = "junk bullet"
	icon_state = "bullets"
	merge_type = /obj/item/stack/sheet/ms13/junk_bullets
	amount = 1
	max_amount = 20
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/junk_bullets/ten
	amount = 10

/obj/item/stack/sheet/ms13/junk_bullets/twelve
	amount = 12

/obj/item/stack/sheet/ms13/junk_bullets/twenty
	amount = 20

/obj/item/stack/sheet/ms13/hq_bullets
	name = "high quality bullets"
	desc = "Good quality bullets made from refined lead."
	singular_name = "high quality bullet"
	icon_state = "bullets"
	merge_type = /obj/item/stack/sheet/ms13/hq_bullets
	amount = 1
	max_amount = 20
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/hq_bullets/ten
	amount = 10

/obj/item/stack/sheet/ms13/hq_bullets/twenty
	amount = 20

//BRASS//

/obj/item/stack/sheet/ms13/scrap_brass
	name = "scrap brass"
	desc = "Lightweight and somewhat shiny pieces of scrap brass."
	singular_name = "scrap brass piece"
	icon_state = "scrap_brass"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_brass
	amount = 1
	max_amount = 10

/obj/item/stack/sheet/ms13/scrap_brass/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap_brass/four
	amount = 4

/obj/item/stack/sheet/ms13/scrap_brass/five
	amount = 5

/datum/material/ms13/scrap_brass
	name = "scrap brass"
	desc = "Brass scrap metal."
	color = "#cec573"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_brass
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/refined_brass
	name = "refined brass"
	desc = "Light brass ingots."
	singular_name = "refined brass ingot"
	icon_state = "ingot_brass"
	merge_type = /obj/item/stack/sheet/ms13/refined_brass
	amount = 1
	max_amount = 6
	grid_width = 96
	grid_height = 32

/obj/item/stack/sheet/ms13/refined_brass/two
	amount = 2

/datum/material/ms13/refined_brass
	name = "refined brass"
	desc = "Somewhat shiny refined brass."
	color = "#b6af73"
	sheet_type = /obj/item/stack/sheet/ms13/refined_brass
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/junk_casings
	name = "junk bullet casings"
	desc = "Poor quality bullet casings made from scrap brass."
	singular_name = "junk bullet casing"
	icon_state = "casings"
	merge_type = /obj/item/stack/sheet/ms13/junk_casings
	amount = 1
	max_amount = 20
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/junk_casings/ten
	amount = 10

/obj/item/stack/sheet/ms13/junk_casings/twelve
	amount = 12

/obj/item/stack/sheet/ms13/junk_casings/twenty
	amount = 20

/obj/item/stack/sheet/ms13/hq_casings
	name = "high quality bullet casings"
	desc = "Good quality bullet casings made from refined brass."
	singular_name = "high quality bullet casing"
	icon_state = "casings"
	merge_type = /obj/item/stack/sheet/ms13/hq_casings
	amount = 1
	max_amount = 20
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/hq_casings/ten
	amount = 10

/obj/item/stack/sheet/ms13/hq_casings/twenty
	amount = 20

//ALUMINUM//

/obj/item/stack/sheet/ms13/scrap_alu
	name = "scrap aluminum"
	desc = "Scrap pieces of aluminum. Through all the dirt, they don't look too bad."
	singular_name = "scrap aluminum piece"
	icon_state = "scrap_aluminum"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_alu
	amount = 1
	max_amount = 10

/obj/item/stack/sheet/ms13/scrap_alu/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap_alu/four
	amount = 4

/obj/item/stack/sheet/ms13/scrap_alu/five
	amount = 5

/datum/material/ms13/scrap_alu
	name = "scrap aluminum"
	desc = "Steel scrap metal."
	color = "#5e5b59"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_alu
	beauty_modifier = 0
	strength_modifier = 1

GLOBAL_LIST_INIT(scrap_alu_recipes, list ( \
	new/datum/stack_recipe("crude scrap metal table", /obj/structure/table/ms13/metal/constructed/cobbled, 4, time = 20 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("green scrap metal chair", /obj/structure/chair/ms13/metal/unfinished, 2, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("blue scrap metal chair", /obj/structure/chair/ms13/metal/blue/unfinished, 2, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("red scrap metal chair", /obj/structure/chair/ms13/metal/red/unfinished, 2, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
))

/obj/item/stack/sheet/ms13/scrap_alu/get_main_recipes()
	. = ..()
	. += GLOB.scrap_alu_recipes

/obj/item/stack/sheet/ms13/refined_alu
	name = "refined aluminum"
	desc = "Malleable aluminum ingots."
	singular_name = "refined aluminum ingot"
	icon_state = "ingot_aluminum"
	merge_type = /obj/item/stack/sheet/ms13/refined_alu
	amount = 1
	max_amount = 6
	grid_width = 96
	grid_height = 32

/obj/item/stack/sheet/ms13/refined_alu/two
	amount = 2

/datum/material/ms13/refined_alu
	name = "refined aluminum"
	desc = "Malleable refined aluminum."
	color = "#bbb2ac"
	sheet_type = /obj/item/stack/sheet/ms13/refined_alu
	beauty_modifier = 0
	strength_modifier = 1

GLOBAL_LIST_INIT(refined_alu_recipes, list ( \
	new/datum/stack_recipe("crude metal table", /obj/structure/table/ms13/metal/constructed, 2, time = 20 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("green metal chair", /obj/structure/chair/ms13/metal, 1, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("blue metal chair", /obj/structure/chair/ms13/metal/blue, 1, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
	new/datum/stack_recipe("red metal chair", /obj/structure/chair/ms13/metal/red, 1, time = 15 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
))

/obj/item/stack/sheet/ms13/refined_alu/get_main_recipes()
	. = ..()
	. += GLOB.refined_alu_recipes

//SILVER//

/obj/item/stack/sheet/ms13/scrap_silver
	name = "scrap silver"
	desc = "Scrap pieces of silver that still have quite a bit of shine to them."
	singular_name = "scrap silver piece"
	icon_state = "scrap_silver"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_silver
	amount = 1
	max_amount = 10

/obj/item/stack/sheet/ms13/scrap_silver/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap_silver/four
	amount = 4

/obj/item/stack/sheet/ms13/scrap_silver/five
	amount = 5

/datum/material/ms13/scrap_silver
	name = "scrap silver"
	desc = "Scrap silver. Still shiny."
	color = "#5e5b59"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_silver
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/refined_silver
	name = "refined silver"
	desc = "Shiny silver ingots."
	singular_name = "refined silver ingot"
	icon_state = "ingot_silver"
	merge_type = /obj/item/stack/sheet/ms13/refined_silver
	amount = 1
	max_amount = 6
	grid_width = 96
	grid_height = 32

/obj/item/stack/sheet/ms13/refined_silver/two
	amount = 2

/datum/material/ms13/refined_silver
	name = "refined silver"
	desc = "Shiny refined silver."
	color = "#bbb2ac"
	sheet_type = /obj/item/stack/sheet/ms13/refined_silver
	beauty_modifier = 0
	strength_modifier = 1

//GOLD//

/obj/item/stack/sheet/ms13/scrap_gold
	name = "scrap gold"
	desc = "Assorted pieces of bright and shining gold, waiting to be melted together into something even more beautiful."
	singular_name = "scrap gold piece"
	icon_state = "scrap_gold"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_gold
	amount = 1
	max_amount = 10

/obj/item/stack/sheet/ms13/scrap_gold/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap_gold/four
	amount = 4

/obj/item/stack/sheet/ms13/scrap_gold/five
	amount = 5

/datum/material/ms13/scrap_gold
	name = "scrap gold"
	desc = "Pieces of gold. Shining bright."
	color = "#d1d352"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_gold
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/refined_gold
	name = "refined gold"
	desc = "Bright and shining solid gold ingots."
	singular_name = "refined gold ingot"
	icon_state = "ingot_gold"
	merge_type = /obj/item/stack/sheet/ms13/refined_gold
	amount = 1
	max_amount = 6
	grid_width = 96
	grid_height = 32

/obj/item/stack/sheet/ms13/refined_gold/two
	amount = 2

/datum/material/ms13/refined_gold
	name = "refined gold"
	desc = "Solid, refined gold."
	color = "#cce731"
	sheet_type = /obj/item/stack/sheet/ms13/refined_gold
	beauty_modifier = 0
	strength_modifier = 1

//COPPER//

/obj/item/stack/sheet/ms13/scrap_copper
	name = "copper wire"
	desc = "Strands of scrap copper wire. Still could be used."
	singular_name = "copper wire piece"
	icon_state = "scrap_copper"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_copper
	amount = 1
	max_amount = 10
	grid_width = 32
	grid_height = 32
	w_class = WEIGHT_CLASS_TINY

/obj/item/stack/sheet/ms13/scrap_copper/two
	amount = 2

/obj/item/stack/sheet/ms13/scrap_copper/four
	amount = 4

/obj/item/stack/sheet/ms13/scrap_copper/five
	amount = 5

/datum/material/ms13/scrap_copper
	name = "copper wire"
	desc = "Conductive copper wire."
	color = "#8f731a"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_copper
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/refined_copper
	name = "refined copper"
	desc = "A refined copper ingot."
	singular_name = "refined copper ingot"
	icon_state = "ingot_copper"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/refined_copper
	amount = 1
	max_amount = 6
	grid_width = 96
	grid_height = 32

/obj/item/stack/sheet/ms13/refined_copper/two
	amount = 2

/datum/material/ms13/refined_copper
	name = "refined copper"
	desc = "Rare refined copper."
	color = "#8f731a"
	sheet_type = /obj/item/stack/sheet/ms13/refined_copper
	beauty_modifier = 0
	strength_modifier = 1
