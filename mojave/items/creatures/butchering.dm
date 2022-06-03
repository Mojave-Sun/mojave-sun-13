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

/obj/item/ms13/hide/attackby(obj/item/W, mob/user, params)
	if(W.tool_behaviour == TOOL_KNIFE)
		user.show_message(span_notice("You begin turning [src] into leather."), MSG_VISUAL)
		if(do_after(user, 15 SECONDS * W.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_LEATHER)) 
			user.show_message(span_notice("You make leather out of [src]!"), MSG_VISUAL)
			new /obj/item/stack/sheet/ms13/leather(user.loc, 1 * leather_amount)
			qdel(src)

/obj/item/ms13/hide/examine(mob/user)
	. = ..()
	. += span_notice("You could use a <b>knife</b> to turn [src] into leather.")

/obj/item/ms13/hide/gecko
	name = "gecko hide"
	desc = "A skinned gecko hide."
	icon_state = "gecko_hide"
	inhand_icon_state = "gecko_hide"
	leather_amount = 4

/obj/item/ms13/hide/gecko/ice
	icon_state = "icegecko_hide"
	inhand_icon_state = "icegecko_hide"

/obj/item/ms13/hide/gecko/sand
	icon_state = "sandgecko_hide"
	inhand_icon_state = "sandgecko_hide"

/obj/item/ms13/hide/wolf
	name = "wolf hide"
	desc = "A skinned wolf hide."
	icon_state = "wolf_hide"
	inhand_icon_state = "wolf_hide"
	leather_amount = 4

/obj/item/ms13/hide/mongrel
	name = "mongrel hide"
	desc = "A skinned mongrel hide."
	icon_state = "mongrel_hide"
	inhand_icon_state = "mongrel_hide"
	throw_range = 4

/obj/item/ms13/hide/molerat
	name = "molerat hide"
	desc = "A skinned molerat hide."
	icon_state = "molerat_hide"
	inhand_icon_state = "molerat_hide"
	leather_amount = 3

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
	leather_amount = 8
	grid_height = 96
	grid_width = 128

/obj/item/ms13/hide/radstag
	name = "radstag hide"
	desc = "A skinned radstag hide."
	icon_state = "radstag_hide"
	inhand_icon_state = "radstag_hide"
	throw_range = 2
	leather_amount = 6
	grid_height = 96
	grid_width = 128

/obj/item/ms13/hide/brahmiluff
	name = "brahmiluff hide"
	desc = "A skinned brahmiluff hide."
	icon_state = "brahmiluff_hide"
	inhand_icon_state = "brahmiluff_hide"
	throw_range = 2
	leather_amount = 10
	grid_height = 96
	grid_width = 128

/obj/item/ms13/hide/tunneler
	name = "tunneler hide"
	desc = "A skinned tunneler hide."
	icon_state = "tunneler_hide"
	inhand_icon_state = "tunneler_hide"
	throw_range = 2

/obj/item/ms13/hide/nightstalker
	name = "nightstalker hide"
	desc = "A skinned nightstalker hide."
	icon_state = "nightstalker_hide"
	inhand_icon_state = "nightstalker_hide"
	throw_range = 2

/obj/item/ms13/hide/slepnir
	name = "slepnir hide"
	desc = "A skinned slepnir hide."
	icon_state = "slepnir_hide"
	inhand_icon_state = "slepnir_hide"
	throw_range = 2
	leather_amount = 8
	grid_height = 96
	grid_width = 128

/obj/item/ms13/hide/large/yaoguai
	name = "yaoguai hide"
	desc = "A skinned yaoguai hide."
	icon_state = "yaoguai_hide"
	inhand_icon_state = "yaoguai_hide"
	throw_range = 2
	w_class = WEIGHT_CLASS_HUGE
	leather_amount = 12
	grid_height = 128
	grid_width = 128

/obj/item/ms13/hide/large/hellpig
	name = "hellpig hide"
	desc = "A skinned hellpig hide."
	icon_state = "hellpig_hide"
	inhand_icon_state = "hellpig_hide"
	throw_range = 2
	w_class = WEIGHT_CLASS_HUGE
	leather_amount = 15
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

/obj/item/food/meat/slab/ms13/carcass/proc/harvest(mob/living/user) //used for extra objects etc. in butchering
	return

/obj/item/food/meat/slab/ms13/carcass/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/meat/slab, meat_amount, 40 SECONDS * toolspeed)

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
	meat_amount = 4
	grid_height = 96
	grid_width = 64

/obj/item/food/meat/slab/ms13/carcass/wolf
	name = "wolf carcass"
	desc = "A skinned body of a wolf."
	icon_state = "dog_carcass"
	inhand_icon_state = "dog_carcass"
	meat_amount = 4
	grid_height = 64
	grid_width = 96

/obj/item/food/meat/slab/ms13/carcass/mongrel
	name = "mongrel carcass"
	desc = "A skinned body of a mongrel."
	icon_state = "dog_carcass"
	inhand_icon_state = "dog_carcass"
	meat_amount = 4
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
	meat_amount = 4
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
	meat_amount = 6
	grid_height = 64
	grid_width = 160

/obj/item/food/meat/slab/ms13/carcass/large/tunneller
	name = "tunneler carcass"
	desc = "A skinned body of a tunneler."
	icon_state = "tunneller_carcass"
	inhand_icon_state = "tunneller_carcass"
	meat_amount = 4

/obj/item/food/meat/slab/ms13/carcass/large/nightstalker
	name = "nightstalker carcass"
	desc = "A skinned body of a nightstalker."
	icon_state = "nightstalker_carcass"
	inhand_icon_state = "nightstalker_carcass"
	meat_amount = 4

/obj/item/food/meat/slab/ms13/carcass/large/brahmiluff
	name = "brahmiluff carcass"
	desc = "A skinned body of a brahmiluff."
	icon_state = "brahmiluff_carcass"
	inhand_icon_state = "brahmiluff_carcass"
	meat_amount = 6
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
	meat_amount = 4

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

/obj/item/ms13/animalitem/brahmin/tongue
	name = "brahmin tongue"
	desc = "The tongue of a brahmin, a tasty morsel and provider of hyper-condensed coagulant"
	icon_state = "brahmin_tongue"
	grind_results = null

/obj/item/ms13/animalitem/brahmin/horns
	name = "brahmin horn"
	desc = "A sturdy brahmin horn, slightly valuable."
	icon_state = "brahmin_horn"
	grind_results = null

/obj/item/ms13/animalitem/brahmiluff/tongue
	name = "brahmiluff tongue"
	desc = "The tongue of a brahmiluff, more nutritious than its hairless cousins."
	icon_state = "brahmin_tongue"
	grind_results = null

/obj/item/ms13/animalitem/brahmiluff/horns
	name = "brahmiluff horn"
	desc = "A valued brahmiluff horn, catches a good price."
	icon_state = "brahmiluff_horn"

/obj/item/ms13/animalitem/clucker/feather
	name = "clucker feather"
	desc = "A singular clucker feather, rare commodities in a post-feather society."
	icon_state = "clucker_feather"
	throw_range = 2

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
	desc = "A molerats tooth, laden with disease."
	icon_state = "molerat_tooth"
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

/obj/item/ms13/animalitem/wolf/teeth
	name = "wolf tooth"
	desc = "A valuable and sacred wolf tooth."
	icon_state = "wolf_tooth"
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
