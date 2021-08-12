//////////////////////////////////////////////////////////////////////////////
//CONTAINS MS13 STACKS AND MINERAL/ORES, also sheet crafting for ease :) //
//////////////////////////////////////////////////////////////////////////////

/obj/item/stack/sheet/ms13
	icon = 'mojave/icons/objects/materials.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	merge_type = /obj/item/stack/sheet/ms13

//SCRAP//

/obj/item/stack/sheet/ms13/scrap
	name = "scrap"
	desc = "A head of assorted metal junk, pre-war and old, the lifeblood of any scavenger."
	singular_name = "scrap piece"
	icon_state = "sheet-scrap"
	inhand_icon_state = "scrap"
	force = 2
	throwforce = 4
	mats_per_unit = list(/datum/material/ms13/scrap = MINERAL_MATERIAL_AMOUNT * 0.5)
	custom_materials = list(/datum/material/ms13/scrap = MINERAL_MATERIAL_AMOUNT * 0.5)
	merge_type = /obj/item/stack/sheet/ms13/scrap
	matter_amount = 4
	max_amount = 50
	walltype = /turf/closed/wall/ms13/craftable/scrap

/obj/item/stack/sheet/ms13/scrap/five
	amount = 5

/obj/item/stack/sheet/ms13/scrap/ten
	amount = 10

/obj/item/stack/sheet/ms13/scrap/twentyfive
	amount = 25

/obj/item/stack/sheet/ms13/scrap/fifty
	amount = 50

//ma44 mojave edit: UNCOMMENT WHEN STRUCTURES PORTED
/*
GLOBAL_LIST_INIT(scrap_recipes, list ( \
	new/datum/stack_recipe("rebar struts", /obj/structure/girder/ms13/bars, 2, time = 10 SECONDS, one_per_turf = TRUE, on_floor = TRUE), \
))
*/

/obj/item/stack/sheet/ms13/scrap/get_main_recipes()
	. = ..()
	. += GLOB.scrap_recipes

/datum/material/ms13/scrap
	name = "scrap"
	desc = "Common scrap parts found amongst the wasteland."
	color = "#967662"
	sheet_type = /obj/item/stack/sheet/ms13/scrap
	beauty_modifier = -0.4
	strength_modifier = 0.5

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
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)
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
