//////////////////////////////////////////////////////////////////////////////
//CONTAINS MS13 STACKS AND MINERAL/ORES, also sheet crafting for ease :) //
//////////////////////////////////////////////////////////////////////////////

/obj/item/stack/sheet/ms13
	icon = 'mojave/icons/objects/crafting/materials_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	force = 2
	throwforce = 2
	merge_type = /obj/item/stack/sheet/ms13
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ms13/component/cell/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/crafting/materials_inventory.dmi')

//MISC. SCRAP//

/obj/item/stack/sheet/ms13/scrap
	name = "scrap metal"
	desc = "Assorted metal junk that has since become an indistinguishable clump of various old and corroded metals."
	singular_name = "scrap metal piece"
	icon_state = "scrap"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap
	max_amount = 15
	walltype = /turf/closed/wall/ms13/craftable/scrap

GLOBAL_LIST_INIT(scrap_recipes, list ( \
	new/datum/stack_recipe("rebar struts", /obj/structure/girder/ms13/bars, 5, time = 30 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
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

/obj/item/stack/sheet/ms13/scrap_parts
	name = "scrap parts"
	desc = "Assorted parts like nuts, bolts, screws, and springs."
	singular_name = "scrap part"
	icon_state = "scrap_parts"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_parts
	max_amount = 20
	w_class = WEIGHT_CLASS_SMALL

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
	max_amount = 20

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
	max_amount = 25

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
	max_amount = 20

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
	max_amount = 20
	w_class = WEIGHT_CLASS_SMALL

/datum/material/ms13/glass
	name = "glass shards"
	desc = "Shards and pieces of glass."
	color = "#bbb3b1"
	sheet_type = /obj/item/stack/sheet/ms13/glass
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
	max_amount = 15
	walltype = /turf/closed/wall/ms13/craftable/scrap

GLOBAL_LIST_INIT(scrap_steel_recipes, list ( \
	new/datum/stack_recipe("rebar struts", /obj/structure/girder/ms13/bars, 3, time = 30 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
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
	max_amount = 10

/datum/material/ms13/refined_steel
	name = "refined steel"
	desc = "Quality, refined steel."
	color = "#bbb2ac"
	sheet_type = /obj/item/stack/sheet/ms13/refined_steel
	beauty_modifier = 0
	strength_modifier = 1

//LEAD//

/obj/item/stack/sheet/ms13/scrap_lead
	name = "scrap lead"
	desc = "Scrap pieces of lead. Dense and dull."
	singular_name = "scrap lead piece"
	icon_state = "scrap_lead"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_lead
	max_amount = 15

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
	icon_state = "lead_ingot"
	merge_type = /obj/item/stack/sheet/ms13/refined_lead
	max_amount = 10

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
	max_amount = 30
	w_class = WEIGHT_CLASS_SMALL

/obj/item/stack/sheet/ms13/hq_bullets
	name = "high quality bullets"
	desc = "Good quality bullets made from refined lead."
	singular_name = "high quality bullet"
	icon_state = "bullets"
	merge_type = /obj/item/stack/sheet/ms13/hq_bullets
	max_amount = 30
	w_class = WEIGHT_CLASS_SMALL

//BRASS//

/obj/item/stack/sheet/ms13/scrap_brass
	name = "scrap brass"
	desc = "Lightweight and somewhat shiny pieces of scrap brass."
	singular_name = "scrap brass piece"
	icon_state = "scrap_brass"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_brass
	max_amount = 15

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
	icon_state = "brass_ingot"
	merge_type = /obj/item/stack/sheet/ms13/refined_brass
	max_amount = 10

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
	max_amount = 30
	w_class = WEIGHT_CLASS_SMALL

/obj/item/stack/sheet/ms13/hq_casings
	name = "high quality bullet casings"
	desc = "Good quality bullet casings made from refined brass."
	singular_name = "high quality bullet casing"
	icon_state = "casings"
	merge_type = /obj/item/stack/sheet/ms13/hq_casings
	max_amount = 30
	w_class = WEIGHT_CLASS_SMALL

//ALUMINUM//

/obj/item/stack/sheet/ms13/scrap_alu
	name = "scrap aluminum"
	desc = "Scrap pieces of aluminum. Through all the dirt, they don't look too bad."
	singular_name = "scrap aluminum piece"
	icon_state = "scrap_aluminum"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_alu
	max_amount = 15

/datum/material/ms13/scrap_alu
	name = "scrap aluminum"
	desc = "Steel scrap metal."
	color = "#5e5b59"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_alu
	beauty_modifier = 0
	strength_modifier = 1

/obj/item/stack/sheet/ms13/refined_alu
	name = "refined aluminum"
	desc = "Malleable aluminum ingots."
	singular_name = "refined aluminum ingot"
	icon_state = "ingot_aluminum"
	merge_type = /obj/item/stack/sheet/ms13/refined_alu
	max_amount = 10

/datum/material/ms13/refined_alu
	name = "refined aluminum"
	desc = "Malleable refined aluminum."
	color = "#bbb2ac"
	sheet_type = /obj/item/stack/sheet/ms13/refined_alu
	beauty_modifier = 0
	strength_modifier = 1

//SILVER//

/obj/item/stack/sheet/ms13/scrap_silver
	name = "scrap silver"
	desc = "Scrap pieces of silver that still have quite a bit of shine to them."
	singular_name = "scrap silver piece"
	icon_state = "scrap_silver"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/scrap_silver
	max_amount = 15

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
	max_amount = 10

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
	max_amount = 15

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
	max_amount = 10

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
	max_amount = 15

/datum/material/ms13/scrap_copper
	name = "copper wire"
	desc = "Conductive copper wire."
	color = "#8f731a"
	sheet_type = /obj/item/stack/sheet/ms13/scrap_copper
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
	max_amount = 15

/obj/item/stack/sheet/ms13/circuits
	name = "circuits"
	desc = "Scavenged circuits that can hopefully still be used for something."
	singular_name = "circuit board"
	icon_state = "circuits"
	inhand_icon_state = "scrap"
	merge_type = /obj/item/stack/sheet/ms13/circuits
	max_amount = 15

//WOOD//

/obj/item/stack/sheet/ms13/log
	name = "logs"
	desc = "Sturdy wood logs."
	singular_name = "log"
	icon_state = "log"
	merge_type = /obj/item/stack/sheet/ms13/log
	max_amount = 4
	w_class = WEIGHT_CLASS_BULKY
	walltype = /turf/closed/wall/ms13/craftable/wood

/obj/item/stack/sheet/ms13/scrap_wood
	name = "scrap wood"
	desc = "Various scrap, low quality pieces of wood."
	singular_name = "scrap wood piece"
	icon_state = "scrap_wood"
	merge_type = /obj/item/stack/sheet/ms13/scrap_wood
	max_amount = 15

/obj/item/stack/sheet/ms13/plank
	name = "wood planks"
	desc = "Robust wood planks. Perfect for crafting."
	singular_name = "wood plank"
	icon_state = "plank"
	merge_type = /obj/item/stack/sheet/ms13/plank
	max_amount = 8

//CLOTH-RELATED//

/obj/item/stack/sheet/ms13/leather
	name = "leather"
	desc = "Tough pieces of leather. Classic material for light armors."
	singular_name = "leather piece"
	icon_state = "leather"
	merge_type = /obj/item/stack/sheet/ms13/leather
	max_amount = 15

/obj/item/stack/sheet/ms13/mil_fiber
	name = "military fiber"
	desc = "Lightweight but very durable military grade fiber. Has a variety of applications."
	singular_name = "military fiber piece"
	icon_state = "militaryfiber"
	merge_type = /obj/item/stack/sheet/ms13/mil_fiber
	max_amount = 15

/obj/item/stack/sheet/ms13/thread
	name = "thread"
	desc = "A spool of thread. Plenty of uses in the post apocalypse."
	singular_name = "thread piece"
	icon_state = "thread"
	merge_type = /obj/item/stack/sheet/ms13/thread
	max_amount = 20
	w_class = WEIGHT_CLASS_SMALL

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

//HAY//
GLOBAL_LIST_INIT(hay_recipes, list ( \
	new/datum/stack_recipe("rice hat", /obj/item/clothing/head/rice_hat, 4, time = 5, one_per_turf = FALSE, on_floor = FALSE), \
))
//TODO - Thread/Rope for tailoring from hay fibres
/obj/item/stack/sheet/hay
	name = "hay"
	desc = "A bundle of hay. Food for livestock, and useful for weaving. Hail the Wickerman."
	singular_name = "hay stalk"
	icon = 'mojave/icons/objects/materials.dmi'
	icon_state = "sheet-hay_3" //Holy someone made this sprite so tiny and having to pixel hunt for, i'll just leave it at the big sprite
	inhand_icon_state = "sheet-hay_3"
	force = 1
	throwforce = 1
	throw_speed = 1
	throw_range = 2
	merge_type = /obj/item/stack/sheet/hay
	max_amount = 50
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0,  "fire" = 50, "acid" = 0)
	resistance_flags = FLAMMABLE
	attack_verb_continuous = list("thrashes")
	attack_verb_simple = list("thrash")

/obj/item/stack/sheet/hay/Initialize(mapload, new_amount, merge = TRUE)
	recipes = GLOB.hay_recipes
	return ..()

/obj/item/stack/sheet/hay/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins shoving hay up [user.p_their()] arse! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	addtimer(CALLBACK(user, /mob/living/proc/gib), 30) //fancy callback bullshit
	return BRUTELOSS

/obj/item/stack/sheet/hay/fifty
	amount = 50

/obj/item/stack/sheet/hay/twenty
	amount = 20

/obj/item/stack/sheet/hay/ten
	amount = 10

/obj/item/stack/sheet/hay/five
	amount = 5
