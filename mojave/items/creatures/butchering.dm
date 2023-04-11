/////////////////////////////////////////////////////////////
///////////////// MOJAVE SUN BUTCHERING PRODUCE /////////////
/////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////
////////////////////////// HIDES ////////////////////////////
/////////////////////////////////////////////////////////////

/obj/item/ms13/hide
	name = "hide"
	desc = "A hide-n bug."
	icon = 'mojave/icons/mob/skinning.dmi'
	icon_state = null
	inhand_icon_state = null
	lefthand_file = 'mojave/icons/mob/inhands/misc/butchering_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/misc/butchering_righthand.dmi'
	throw_range = 3
	w_class = WEIGHT_CLASS_BULKY
	grid_height = 96
	grid_width = 96
	drop_sound = 'sound/items/handling/cloth_drop.ogg'
	pickup_sound =  'sound/items/handling/cloth_pickup.ogg'
	var/leather_amount = 2 //How much leather you get from skinning the hide

/obj/item/ms13/hide/Initialize(mapload)
	. = ..()
	register_context()
	AddElement(/datum/element/item_scaling, 0.6, 1)

/obj/item/ms13/hide/attackby(obj/item/W, mob/user, params)
	if(W.tool_behaviour == TOOL_KNIFE)
		user.show_message(span_notice("You begin turning [src] into leather."), MSG_VISUAL)
		if(do_after(user, 15 SECONDS * W.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_LEATHER))
			user.show_message(span_notice("You make leather out of [src]!"), MSG_VISUAL)
			new /obj/item/stack/sheet/ms13/leather(user.loc, 1 * leather_amount)
			qdel(src)

/obj/item/ms13/hide/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_KNIFE)
			context[SCREENTIP_CONTEXT_LMB] = "Turn into leather"
			return CONTEXTUAL_SCREENTIP_SET

/obj/item/ms13/hide/examine(mob/user)
	. = ..()
	. += span_notice("You could use a <b>knife</b> to turn [src] into leather.")

/obj/item/ms13/hide/pigrat
	name = "pigrat hide"
	desc = "A skinned pigrat hide."
	icon_state = "pigrat_hide"
	inhand_icon_state = "pigrat_hide"
	leather_amount = 4

/obj/item/ms13/hide/brahmin
	name = "brahmin hide"
	desc = "A skinned brahmin hide."
	icon_state = "brahmin_hide"
	inhand_icon_state = "brahmin_hide"
	throw_range = 2
	leather_amount = 10
	grid_height = 96
	grid_width = 128

/obj/item/ms13/hide/radstag
	name = "radstag hide"
	desc = "A skinned radstag hide."
	icon_state = "radstag_hide"
	inhand_icon_state = "radstag_hide"
	throw_range = 2
	leather_amount = 8
	grid_height = 96
	grid_width = 128

/obj/item/ms13/hide/brahmiluff
	name = "brahmiluff hide"
	desc = "A skinned brahmiluff hide."
	icon_state = "brahmiluff_hide"
	inhand_icon_state = "brahmiluff_hide"
	throw_range = 2
	leather_amount = 12
	grid_height = 96
	grid_width = 128

/obj/item/ms13/hide/slepnir
	name = "slepnir hide"
	desc = "A skinned slepnir hide."
	icon_state = "slepnir_hide"
	inhand_icon_state = "slepnir_hide"
	throw_range = 2
	leather_amount = 10
	grid_height = 96
	grid_width = 128

/obj/item/ms13/hide/large/yaoguai
	name = "yaoguai hide"
	desc = "A skinned yaoguai hide."
	icon_state = "yaoguai_hide"
	inhand_icon_state = "yaoguai_hide"
	throw_range = 2
	w_class = WEIGHT_CLASS_HUGE
	leather_amount = 15
	grid_height = 128
	grid_width = 128

/obj/item/ms13/hide/large/hellpig
	name = "hellpig hide"
	desc = "A skinned hellpig hide."
	icon_state = "hellpig_hide"
	inhand_icon_state = "hellpig_hide"
	throw_range = 2
	w_class = WEIGHT_CLASS_HUGE
	leather_amount = 20
	grid_height = 128
	grid_width = 128

/obj/item/ms13/hide/large/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)

/////////////////////////////////////////////////////////////
//////////////////////// CARCASSES //////////////////////////
/////////////////////////////////////////////////////////////

/obj/item/food/meat/slab/ms13/carcass
	name = "carcass"
	desc = "A meaty error :)."
	icon = 'mojave/icons/mob/skinning.dmi'
	icon_state = null
	inhand_icon_state = null
	lefthand_file = 'mojave/icons/mob/inhands/misc/butchering_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/misc/butchering_righthand.dmi'
	throw_range = 2
	w_class = WEIGHT_CLASS_BULKY
	food_reagents = null
	eat_time = null
	var/item_butcher_results = list(/obj/item/food/meat/slab = 4) //placeholder meat
	var/butcher_difficulty = 0
	var/meat_amount = 1 //For determining how much meat you get after butchering the carcass
	drop_sound = 'mojave/sound/ms13items/ms13handling/meat_drop.ogg'
	pickup_sound =  'mojave/sound/ms13items/ms13handling/meat_pickup.ogg'
	var/meat_type = /obj/item/food/meat/slab/ms13/animal

/obj/item/food/meat/slab/ms13/carcass/Initialize(mapload)
	. = ..()
	register_context()
	AddElement(/datum/element/item_scaling, 0.6, 1)

/obj/item/food/meat/slab/ms13/carcass/proc/harvest(mob/living/user) //used for extra objects etc. in butchering
	return

/obj/item/food/meat/slab/ms13/carcass/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  meat_type, meat_amount, 40 SECONDS * toolspeed)

/obj/item/food/meat/slab/ms13/carcass/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_KNIFE)
			context[SCREENTIP_CONTEXT_LMB] = "Butcher"
			return CONTEXTUAL_SCREENTIP_SET

//small/medium

/obj/item/food/meat/slab/ms13/carcass/clucker
	name = "clucker carcass"
	desc = "A de-feathered body of a clucker."
	icon_state = "clucker_carcass"
	inhand_icon_state = "clucker_carcass"
	throw_range = 4
	w_class = WEIGHT_CLASS_NORMAL
	meat_amount = 2
	grid_height = 64
	grid_width = 64

/obj/item/food/meat/slab/ms13/carcass/gecko
	name = "gecko carcass"
	desc = "A skinned body of a gecko."
	icon_state = "gecko_carcass"
	inhand_icon_state = "gecko_carcass"
	meat_amount = 3
	grid_height = 96
	grid_width = 64
	meat_type = /obj/item/food/meat/slab/ms13/animal/gecko

/obj/item/food/meat/slab/ms13/carcass/gecko/desert
	meat_type = /obj/item/food/meat/slab/ms13/animal/gecko/desert

/obj/item/food/meat/slab/ms13/carcass/gecko/golden
	name = "golden gecko carcass"
	desc = "A skinned body of a golden gecko."
	meat_type = /obj/item/food/meat/slab/ms13/animal/gecko/golden

/obj/item/food/meat/slab/ms13/carcass/wolf
	name = "wolf carcass"
	desc = "A skinned body of a wolf."
	icon_state = "dog_carcass"
	inhand_icon_state = "dog_carcass"
	meat_amount = 3
	grid_height = 64
	grid_width = 96

/obj/item/food/meat/slab/ms13/carcass/mongrel
	name = "mongrel carcass"
	desc = "A skinned body of a mongrel."
	icon_state = "dog_carcass"
	inhand_icon_state = "dog_carcass"
	meat_amount = 3
	grid_height = 64
	grid_width = 96

/obj/item/food/meat/slab/ms13/carcass/molerat
	name = "molerat carcass"
	desc = "A skinned body of a molerat."
	icon_state = "rat_carcass"
	inhand_icon_state = "rat_carcass"
	meat_amount = 3
	grid_height = 64
	grid_width = 96

/obj/item/food/meat/slab/ms13/carcass/molerat/pig
	name = "pigrat carcass"
	desc = "A skinned body of a pigrat."
	meat_amount = 2
	grid_height = 64
	grid_width = 96

//large

/obj/item/food/meat/slab/ms13/carcass/large
	w_class = WEIGHT_CLASS_HUGE
	throw_range = 1

/obj/item/food/meat/slab/ms13/carcass/large/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)

/obj/item/food/meat/slab/ms13/carcass/large/radstag
	name = "radstag carcass"
	desc = "A skinned body of a radstag."
	icon_state = "radstag_carcass"
	inhand_icon_state = "radstag_carcass"
	meat_amount = 5
	grid_height = 64
	grid_width = 160

/obj/item/food/meat/slab/ms13/carcass/large/brahmiluff
	name = "brahmiluff carcass"
	desc = "A skinned body of a brahmiluff."
	icon_state = "brahmiluff_carcass"
	inhand_icon_state = "brahmiluff_carcass"
	meat_amount = 5
	grid_height = 96
	grid_width = 128

/obj/item/food/meat/slab/ms13/carcass/large/brahmiluff/front
	icon_state = "cowbeastfront_carcass"
	inhand_icon_state = "cowbeastfront_carcass"

/obj/item/food/meat/slab/ms13/carcass/large/brahmiluff/back
	icon_state = "cowbeastback_carcass"
	inhand_icon_state = "cowbeastback_carcass"

/obj/item/food/meat/slab/ms13/carcass/large/brahmin
	name = "brahmin carcass"
	desc = "A skinned body of a brahmin."
	icon_state = "brahmin_carcass"
	inhand_icon_state = "brahmin_carcass"
	meat_amount = 4
	grid_height = 96
	grid_width = 128

/obj/item/food/meat/slab/ms13/carcass/large/brahmin/front
	icon_state = "cowbeastfront_carcass"
	inhand_icon_state = "cowbeastfront_carcass"

/obj/item/food/meat/slab/ms13/carcass/large/brahmin/back
	icon_state = "cowbeastback_carcass"
	inhand_icon_state = "cowbeastback_carcass"

/obj/item/food/meat/slab/ms13/carcass/large/yaoguai
	name = "yaoguai carcass"
	desc = "A skinned body section of a yaoguai."
	meat_amount = 8
	grid_height = 128
	grid_width = 128

/obj/item/food/meat/slab/ms13/carcass/large/yaoguai/front
	icon_state = "yaoguaifront_carcass"
	inhand_icon_state = "yaoguaifront_carcass"

/obj/item/food/meat/slab/ms13/carcass/large/yaoguai/back
	icon_state = "yaoguaiback_carcass"
	inhand_icon_state = "yaoguaiback_carcass"

/obj/item/food/meat/slab/ms13/carcass/large/slepnir
	name = "slepnir carcass"
	desc = "A skinned body section of a slepnir."
	meat_amount = 3

/obj/item/food/meat/slab/ms13/carcass/large/slepnir/front
	icon_state = "slepnirfront_carcass"
	inhand_icon_state = "slepnirfront_carcass"
	grid_height = 64
	grid_width = 160

/obj/item/food/meat/slab/ms13/carcass/large/slepnir/back
	icon_state = "slepnirback_carcass"
	inhand_icon_state = "slepnirback_carcass"
	grid_height = 96
	grid_width = 96

/obj/item/food/meat/slab/ms13/carcass/large/hellpig
	name = "hellpig carcass"
	desc = "A skinned body section of a hellpig."
	meat_amount = 5
	grid_height = 128
	grid_width = 128

/obj/item/food/meat/slab/ms13/carcass/large/hellpig/front
	icon_state = "hellpigfront_carcass"
	inhand_icon_state = "hellpigfront_carcass"

/obj/item/food/meat/slab/ms13/carcass/large/hellpig/back
	icon_state = "hellpigback_carcass"
	inhand_icon_state = "hellpigback_carcass"

/obj/item/food/meat/slab/ms13/carcass/large/hellpig/leg
	name = "hellpig leg"
	icon_state = "hellpigleg_carcass"
	inhand_icon_state = "hellpigleg_carcass"
	w_class = WEIGHT_CLASS_BULKY
	meat_amount = 3
	grid_height = 128
	grid_width = 96

/////////////////////////////////////////////////////////////
////////////////////////// ITEMS ////////////////////////////
/////////////////////////////////////////////////////////////

/obj/item/ms13/animalitem
	name = "animal item"
	desc = "Default Item, wtf!!!"
	icon = 'mojave/icons/mob/animalproduce.dmi'
	icon_state = null
	inhand_icon_state = null
	lefthand_file = 'mojave/icons/mob/inhands/misc/butchering_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/misc/butchering_righthand.dmi'
	throw_range = 5
	w_class = WEIGHT_CLASS_NORMAL
	grid_height = 64
	grid_width = 64

/obj/item/ms13/animalitem/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/item_scaling, 0.6, 1)

/obj/item/ms13/animalitem/brahmin/tongue
	name = "brahmin tongue"
	desc = "The tongue of a brahmin, a tasty morsel and provider of hyper-condensed coagulant"
	icon_state = "brahmin_tongue"
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 32
	grid_width = 64
	grind_results = null

/obj/item/ms13/animalitem/brahmin/horns
	name = "brahmin horn"
	desc = "A sturdy brahmin horn, slightly valuable."
	icon_state = "brahmin_horn"
	grind_results = null

/obj/item/ms13/animalitem/brahmiluff/horns
	name = "brahmiluff horn"
	desc = "A valued brahmiluff horn."
	icon_state = "brahmiluff_horn"
	grid_height = 128
	grid_width = 32

/obj/item/ms13/animalitem/clucker/feather
	name = "clucker feather"
	desc = "A singular clucker feather, rare commodities in a post-feather society."
	icon_state = "clucker_feather"
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	grid_height = 32
	grid_width = 32

/obj/item/ms13/animalitem/slepnir/hooves
	name = "slepnir hoof"
	desc = "A slepnirs Hoof, known for its ability to create natural adhesive."
	icon_state = "slepnir_hoof"
	grind_results = null

/obj/item/ms13/animalitem/pigrat/snout
	name = "pigrat snout"
	desc = "A pigrats snout, a laden fine delicacy."
	icon_state = "pigrat_snout"

/obj/item/ms13/animalitem/molerat/teeth
	name = "molerat tooth"
	desc = "A grimy, disease laden molerat tooth."
	icon_state = "molerat_tooth"
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 64
	grid_width = 32
/*
/obj/item/ms13/animalitem/radroach/innards
	name = ""
	desc = ""
	icon_state =
*/
/obj/item/ms13/animalitem/gecko/claws
	name = "gecko claw"
	desc = "A lucky gecko paw, only slightly deadly."
	icon_state = "gecko_claw"

/obj/item/ms13/animalitem/nightstalker/teeth
	name = "nightstalker fang"
	desc = "A nightstalker fang, still dripping with potent venom."
	icon_state = "nightstalker_tooth"
/*
/obj/item/ms13/animalitem/radscorpion/stinger
	name = ""
	desc = ""
	icon_state =
*/
/obj/item/ms13/animalitem/radstag/antlers
	name = "radstag antler"
	desc = "A valuable and sturdy radstag antler."
	icon_state = "radstag_antler"
	grid_height = 64
	grid_width = 96

/obj/item/ms13/animalitem/wolf/teeth
	name = "wolf tooth"
	desc = "A valuable and sacred wolf tooth."
	icon_state = "wolf_tooth"

/////////////////////////////////////////////////////////////
////////////////////////// MEAT /////////////////////////////
/////////////////////////////////////////////////////////////

/obj/item/food/meat/slab/ms13/animal
	name = "raw meat"
	desc = "Raw, uncooked meat. You should probably try cooking this, but if you're really desperate...."
	grid_height = 32
	grid_width = 64
	w_class = WEIGHT_CLASS_SMALL
	var/steak_type = /obj/item/food/meat/steak/ms13/animal

/obj/item/food/meat/slab/ms13/animal/MakeProcessable()
	return

/obj/item/food/meat/slab/ms13/animal/MakeGrillable()
	AddComponent(/datum/component/grillable, steak_type, rand(40 SECONDS, 75 SECONDS), TRUE, TRUE)

/obj/item/food/meat/steak/ms13/animal
	name = "grilled meat"
	desc = "Deliciously juicy grilled meat. Yum!"
	icon = 'mojave/icons/objects/food/meat.dmi'
	icon_state = "meat_roasted"
	grid_height = 32
	grid_width = 64
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/meat/steak/ms13/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/item_scaling, 0.50, 1)

/obj/item/food/meat/slab/ms13/animal/gecko
	name = "gecko meat"
	desc = "Raw meat from a gecko. A common source of protein in the wastes."
	icon_state = "icegecko"
	steak_type = /obj/item/food/meat/steak/ms13/animal/gecko

/obj/item/food/meat/steak/ms13/animal/gecko
	name = "grilled gecko"
	desc = "A piece of grilled gecko meat."
	icon_state = "icegecko_roasted"

/obj/item/food/meat/slab/ms13/animal/gecko/desert
	icon_state = "silvergecko"
	steak_type = /obj/item/food/meat/steak/ms13/animal/gecko/desert

/obj/item/food/meat/steak/ms13/animal/gecko/desert
	icon_state = "silvergecko_roasted"

/obj/item/food/meat/slab/ms13/animal/gecko/golden
	name = "golden gecko meat"
	desc = "Raw meat from a golden gecko. Considered to be highly nutritious, once cooked."
	icon_state = "goldengecko"
	steak_type = /obj/item/food/meat/steak/ms13/animal/gecko/golden

/obj/item/food/meat/steak/ms13/animal/gecko/golden
	name = "grilled golden gecko"
	desc = "A piece of grilled golden gecko meat. Something of a desert delicacy."
	icon_state = "goldengecko_roasted"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 10, /datum/reagent/consumable/nutriment/vitamin = 1)

/obj/item/food/meat/slab/ms13/animal/radroach
	name = "radroach meat"
	desc = "Disgusting, uncooked radroach meat. Only the truly impoverished would consider eating this."
	icon_state = "radroach"
	steak_type = /obj/item/food/meat/steak/ms13/animal/radroach
	tastes = list("gross" = 4, "meat" = 1)
	foodtypes = MEAT | GROSS

/obj/item/food/meat/steak/ms13/animal/radroach
	name = "grilled radroach"
	desc = "Well cooked, seared radroach. Will only help it taste just a bit better."
	icon_state = "radroach_roasted"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6)
	tastes = list("gross" = 2, "meat" = 1)
	foodtypes = MEAT | GROSS

/obj/item/food/meat/slab/ms13/animal/glowroach
	name = "glowroach meat"
	desc = "Irradiated radroach meat. You shouldn't even touch this, let alone eat it."
	icon_state = "glowroach"
	steak_type = /obj/item/food/meat/steak/ms13/animal/glowroach
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4, /datum/reagent/uranium = 3)
	tastes = list("disgusting" = 4, "radiation" = 4)
	foodtypes = MEAT | GROSS | TOXIC

/obj/item/food/meat/steak/ms13/animal/glowroach
	name = "grilled glowroach"
	desc = "Grilled glowroach meat. You really still should not eat this."
	icon_state = "glowroach_roasted"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/uranium = 2)
	tastes = list("disgusting" = 3, "radiation" = 3)
	foodtypes = MEAT | GROSS | TOXIC

/obj/item/food/meat/slab/ms13/animal/ant
	name = "ant meat"
	desc = "An uncooked chunk of meat from a giant ant."
	icon_state = "fatty"
	steak_type = /obj/item/food/meat/steak/ms13/animal/ant
	tastes = list("gross" = 4, "protein" = 1)
	foodtypes = MEAT | GROSS

/obj/item/food/meat/steak/ms13/animal/ant
	name = "grilled ant meat"
	desc = "A grilled piece of ant meat. Quite nutritious, even if not very tasty."
	icon_state = "fatty_roasted"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 10, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("gross" = 2, "protein" = 1)
	foodtypes = MEAT | GROSS

/obj/item/food/meat/slab/ms13/animal/mirelurk
	name = "mirelurk claw"
	desc = "The claw of a mirelurk. Said to contain very tasty meat inside once cooked."
	icon_state = "mirelurk"
	steak_type = /obj/item/food/meat/steak/ms13/animal/mirelurk

/obj/item/food/meat/steak/ms13/animal/mirelurk
	name = "grilled mirelurk claw"
	desc = "A mirelurk claw that has been grilled. Your delicious reward awaits!"
	icon_state = "mirelurk_roasted"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 12, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("succulent" = 3, "meat" = 2)

/obj/item/food/meat/slab/ms13/animal/radlurk
	name = "radlurk claw"
	desc = "A radlurk claw. Quite the triumph to be able to claim this, makes for a nice trophy."
	icon_state = "radlurk"
	steak_type = /obj/item/food/meat/steak/ms13/animal/radlurk
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/uranium = 6)
	tastes = list("disgusting" = 4, "radiation" = 4)
	foodtypes = MEAT | GROSS | TOXIC

/obj/item/food/meat/steak/ms13/animal/radlurk
	name = "grilled radlurk claw"
	desc = "A cooked radlurk claw. You aren't considering eating this, are you?"
	icon_state = "radlurk_roasted"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 12, /datum/reagent/uranium = 4)
	tastes = list("disgusting" = 3, "radiation" = 3)
	foodtypes = MEAT | GROSS | TOXIC

/obj/item/food/meat/slab/ms13/animal/bark_scorp
	name = "bark scorpion meat"
	desc = "An raw chunk of meat from a bark scorpion's tail. Probably not safe to eat it like this."
	icon_state = "barkscorpiontail"
	steak_type = /obj/item/food/meat/steak/ms13/animal/bark_scorp
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/toxin = 3)
	foodtypes = MEAT | GROSS | TOXIC

/obj/item/food/meat/steak/ms13/animal/bark_scorp
	name = "grilled bark scorpion meat"
	desc = "A grilled piece of a bark scorpion tail. Tastier than it looks."
	icon_state = "barkscorpiontail_roasted"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 9, /datum/reagent/consumable/nutriment/vitamin = 1)

/obj/item/food/meat/slab/ms13/animal/rad_scorp
	name = "rad scorpion meat"
	desc = "Raw rad scorpion meat. Properly cooked and prepared, this can make a fine meal."
	icon_state = "scorpiontail"
	steak_type = /obj/item/food/meat/steak/ms13/animal/rad_scorp
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/toxin = 6)
	foodtypes = MEAT | GROSS | TOXIC

/obj/item/food/meat/steak/ms13/animal/rad_scorp
	name = "grilled rad scorpion meat"
	desc = "A finely cooked piece of rad scorpion tail. A delicious wasteland treat."
	icon_state = "scorpiontail_roasted"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 12, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("succulent" = 3, "meat" = 2)



/*
/obj/item/ms13/animalitem/tunneler/spike
	name = "tunneller_spike"
	desc = "A razor sharp spear like protusion found on tunnellers."
	icon_state = "tunneller_spike"

/obj/item/ms13/animalitem/yaoguai/claw
	name = ""
	desc = ""
	icon_state =

/obj/item/ms13/animalitem/yaoguai/teeth
	name = ""
	desc = ""
	icon_state =

/obj/item/ms13/animalitem/hellpig/tusk
	name = ""
	desc = ""
	icon_state =
*/
/////////////////////////////////////////////////////////////
/////////////////// ITEM BUTCHER COMPONENT //////////////////
/////////////////////////////////////////////////////////////

//This is commented out for now because it simultaneously does not work and is more or less not needed because of the processable element

/*/datum/component/itembutchering
	var/speed = 1.5 MINUTES //time in deciseconds taken to butcher something
	var/effectiveness = 80 //percentage effectiveness; numbers above 100 yield extra drops
	var/bonus_modifier = 0 //percentage increase to bonus item chance
	var/butcher_sound = 'sound/effects/butcher.ogg' //sound played when butchering

/datum/component/itembutchering/Initialize(_speed, _effectiveness, _butcher_sound)
	if(_speed)
		speed = _speed
	if(_effectiveness)
		effectiveness = _effectiveness
	if(_butcher_sound)
		butcher_sound = _butcher_sound
	if(isitem(parent))
		RegisterSignal(parent, COMSIG_ITEM_ATTACK_OBJ, .proc/onItemAttack)

/datum/component/itembutchering/proc/onItemAttack(obj/item/source, atom/movable/target, mob/living/user)
	SIGNAL_HANDLER

	if(user.combat_mode != TRUE)
		return
	if(istype(target, /obj/item/ms13/carcass))
		if(source.get_sharpness())
			INVOKE_ASYNC(src, .proc/startCutting, source, target, user)
			return COMPONENT_CANCEL_ATTACK_CHAIN

/datum/component/itembutchering/proc/startCutting(obj/item/source, obj/item/ms13/carcass/M, mob/living/user)
	to_chat(user, "<span class='notice'>You begin to butcher [M]...</span>")
	playsound(M.loc, butcher_sound, 50, TRUE, -1)
	if(do_after(user, M, speed) && M.Adjacent(source))
		itemButcher(user, M)

/datum/component/itembutchering/proc/itemButcher(mob/living/U, obj/item/ms13/carcass/E)
	var/turf/T = E.drop_location()
	var/final_effectiveness = effectiveness - E.butcher_difficulty //previous butchering code was wack, this just means that if you dont have the correct butchering tools you botch the harvest.
	for(var/V in E.item_butcher_results)
		var/obj/item/food/meat/slab/meatamount = V
		if(final_effectiveness < 80)
			to_chat(U, "<span class='warning'>You botch the harvest of the [initial(meatamount.name)] from [E].</span>")
		else
			to_chat(U, "<span class='info'>You harvest some extra [initial(meatamount.name)] from [E]!</span>")
			new meatamount (T)
		U.visible_message("<span class='notice'>[U] butchers [E].</span>", \
								"<span class='notice'>You butcher [E].</span>")
	ButcherEffects(E)
	E.harvest(U)
	new /obj/effect/gibspawner/generic(get_turf(E), E)

/datum/component/itembutchering/proc/ButcherEffects(obj/item/ms13/carcass/meat) //extra effects called on butchering, override this via subtypes
	return

/obj/item/ComponentInitialize()
	. = ..()
	if(sharpness)
		. = ..()
		AddComponent(/datum/component/itembutchering, 80 * toolspeed)

/obj/item/knife/ComponentInitialize() //basically currently only knives can be used to butcher without destroying the meat (unless its small game)
	. = ..()
	AddComponent(/datum/component/itembutchering, 70 + force, 100, force - 10)*/
