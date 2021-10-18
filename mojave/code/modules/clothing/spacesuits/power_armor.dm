//Generic power armor helmet
/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor
	name = "Generic Power Armor Helmet"
	desc = "Don't ever use this in the video game please."
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	icon_state = "null"
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	worn_icon_state = "null"
	strip_delay = 15 SECONDS
	max_integrity = 500
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 80, BULLET = 80, LASER = 80, ENERGY = 80, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25) //Make the armor the same as the hardsuit one for consistancy
	actions_types = null //No lights my dude, sorry
	worn_x_dimension = 32
	worn_y_dimension = 48
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | BLOCKS_SHOVE_KNOCKDOWN

//No touchy
/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/Initialize()
	. = ..()
	interaction_flags_item &= ~INTERACT_ITEM_ATTACK_HAND_PICKUP
	ADD_TRAIT(src, TRAIT_NODROP, STICKY_NODROP) //Somehow it's stuck to your body, no questioning.

//Generic power armor based off of the hardsuit
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor
	name = "Generic Power Armor"
	desc = "Don't ever use this in the video game please."
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	icon_state = "frame"
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	worn_icon_state = "frame"
	allowed = list(/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	density = TRUE //It's a suit of armor man
	anchored = TRUE
	strip_delay = 15 SECONDS
	max_integrity = 500
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 80, BULLET = 80, LASER = 80, ENERGY = 80, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 25) //Make the armor the same as the hardsuit one for consistancy
	actions_types = null //No helmet toggle, sorry dude
	worn_x_dimension = 32
	worn_y_dimension = 20
	helmettype = null //no helmet; default PA is frame = /obj/item/clothing/head/helmet/space/hardsuit/power_armor
	var/footstep = 1
	var/mob/listeningTo
	clothing_traits = list(TRAIT_SILENT_FOOTSTEPS) //No playing regular footsteps over power armor footsteps
	item_flags = NO_PIXEL_RANDOM_DROP
	clothing_flags = LARGE_WORN_ICON | STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | BLOCKS_SHOVE_KNOCKDOWN

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/examine(mob/user)
	. = ..()
	. += "You can alt+left click this power armor to get into and out of it!"

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/Initialize()
	. = ..()
	interaction_flags_item &= ~INTERACT_ITEM_ATTACK_HAND_PICKUP
	ADD_TRAIT(src, TRAIT_NODROP, STICKY_NODROP) //Somehow it's stuck to your body, no questioning.
	RegisterSignal(src, COMSIG_ATOM_CAN_BE_PULLED, .proc/reject_pulls)

//We want to be able to strip the PA as usual but also have the benefits of NO_DROP to disallow stuff like drag clicking PA into hand slot
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/canStrip(mob/stripper, mob/owner)
	return !(item_flags & ABSTRACT)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/doStrip(mob/stripper, mob/owner)
	GetOutside(owner)
	return TRUE

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/hit_reaction(owner, hitby, attack_text, final_block_chance, damage, attack_type)
	if((damage > 10) && prob(35)) //SPARK
		do_sparks(2, FALSE, src)

//Hardcode goes brrr; borrowed from ancient hardsuits
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/on_mob_move()
	SIGNAL_HANDLER
	var/mob/living/carbon/human/H = loc
	if(!istype(H) || H.wear_suit != src)
		return
	if(footstep >= 1)
		playsound(src, 'sound/mecha/mechstep.ogg', 100, TRUE)
		footstep = 0
	else
		footstep++

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/equipped(mob/user, slot)
	. = ..()
	if(slot != ITEM_SLOT_OCLOTHING)
		if(listeningTo)
			UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
		return
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
	RegisterSignal(user, COMSIG_MOVABLE_MOVED, .proc/on_mob_move)
	listeningTo = user
	user.base_pixel_y = user.base_pixel_y + 6
	user.pixel_y = user.base_pixel_y
	ADD_TRAIT(user, TRAIT_FORCED_STANDING, "power_armor") //It's a suit of armor, it ain't going to fall over just because the pilot is dead
	ADD_TRAIT(user, TRAIT_NOSLIPALL, "power_armor")
	ADD_TRAIT(user, TRAIT_STUNIMMUNE, "power_armor")
	ADD_TRAIT(user, TRAIT_NOMOBSWAP, "power_armor")
	RegisterSignal(user, COMSIG_ATOM_CAN_BE_PULLED, .proc/reject_pulls)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/reject_pulls(datum/source, mob/living/puller)
	SIGNAL_HANDLER
	if(puller != loc) // != the wearer
		to_chat(puller, span_warning("The power armor resists your attempt at pulling it!"))
		return COMSIG_ATOM_CANT_PULL

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/dropped(mob/user)
	. = ..()
	user.base_pixel_y = user.base_pixel_y - 6
	user.pixel_y = user.base_pixel_y
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
	listeningTo = null
	REMOVE_TRAIT(user, TRAIT_FORCED_STANDING, "power_armor") //It's a suit of armor, it ain't going to fall over just because the pilot is dead
	REMOVE_TRAIT(user, TRAIT_NOSLIPALL, "power_armor")
	REMOVE_TRAIT(user, TRAIT_STUNIMMUNE, "power_armor")
	REMOVE_TRAIT(user, TRAIT_NOMOBSWAP, "power_armor")
	UnregisterSignal(user, COMSIG_ATOM_CAN_BE_PULLED)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/Destroy()
	listeningTo = null
	UnregisterSignal(src, COMSIG_ATOM_CAN_BE_PULLED)
	return ..()

//No helmet toggles for now when helmet is up
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/ToggleHelmet()
	if(hood_up || (helmettype == null))
		return
	return ..()

//Let's get into the power armor (or not)
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/AltClick(mob/living/carbon/human/user)
	if(!istype(user))
		return FALSE
	else
		if(user.wear_suit == src)
			to_chat(user, "You begin exiting the [src].")
			if(do_after(user, 8 SECONDS, target = user))
				if(get_dist(user, src) > 1) //Anti-afterimage check
					return FALSE
			if(do_after(user, 8 SECONDS, target = user) && density != TRUE)
				GetOutside(user)
				return TRUE
			return FALSE

	if(!CheckEquippedClothing(user) || get_dist(user, src) > 1)
		return FALSE
	to_chat(user, "You begin entering the [src].")
	if(do_after(user, 8 SECONDS, target = user) && CheckEquippedClothing(user) && density == TRUE)
		GetInside(user)
		return TRUE
	return FALSE

//A proc that checks if the user is already wearing clothing that obstructs the equipping of the power armor
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/CheckEquippedClothing(mob/living/carbon/human/user)
	if(user.head && (user.head != helmet) || user.wear_suit && (user.wear_suit != src) || user.back || user.belt)
		to_chat(user, span_warning("You're unable to climb into the [src] due to already having a helmet, backpack, belt or outer suit equipped!"))
		return FALSE
	return TRUE

//Let's actually get into the power armor
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/GetInside(mob/living/carbon/human/user)
	if(!istype(user))
		return

	//Nothing can possibly go wrong
	user.dna.species.no_equip += ITEM_SLOT_BACK
	user.dna.species.no_equip += ITEM_SLOT_BELT

	density = FALSE
	anchored = FALSE
	user.visible_message("<span class='warning'>[user] enters the [src]!</span>")
	user.forceMove(get_turf(src))
	user.equip_to_slot_if_possible(src, ITEM_SLOT_OCLOTHING)
	if(helmettype)
		ToggleHelmet()

//Nevermind let's get out
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/GetOutside(mob/living/carbon/human/user)
	user.visible_message("<span class='warning'>[user] exits from the [src].</span>")
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, TRUE)
	user.dropItemToGround(src, force = TRUE)
	density = TRUE
	anchored = TRUE
	//Nothing can possibly go wrong
	user.dna.species.no_equip -= ITEM_SLOT_BACK
	user.dna.species.no_equip -= ITEM_SLOT_BELT

//TODO for later involving integrity and ricochets
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(prob(50))
		var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread
		spark_system.start()
	..()

/* t45 sprite unimpleneted

//For now the t45 is just a new subtype
/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t45
	name = "T45 Power Armor Helmet"
	desc = "A beefy helmet attached to a suit of power armor."

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t45
	name = "T45 Power Armor Suit"
	desc = "Supposedly the first power armor to be deployed in the Great War. While it does have it's flaws, it still represents a very robust piece of armor that can withstand great punishment."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/power_armor/t45
*/

/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t51
	name = "T51 Power Armor Helmet"
	desc = "A more advanced helmet for a more advanced piece of power armor."
	armor = list(MELEE = 80, BULLET = 80, LASER = 75, ENERGY = 80, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 20) //Make the armor the same as the hardsuit one for consistancy
	icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	icon_state = "t51_helmet"
	worn_icon_state = "t51_helmet"

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t51
	name = "T51B Power Armor Suit"
	desc = "The last widely developed and distributed power armor prior to the nuclear winter, even after all of these years it still outperforms it's previous model iteration."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t51
	armor = list(MELEE = 80, BULLET = 80, LASER = 75, ENERGY = 80, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 20) //Make the armor the same as the hardsuit one for consistancy
	icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	icon_state = "t51_armor"
	worn_icon_state = "t51_armor"
	slowdown = 1
