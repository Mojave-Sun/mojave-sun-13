//Generic power armor helmet
/obj/item/clothing/head/helmet/space/hardsuit/power_armor
	name = "Generic Power Armor Helmet"
	desc = "Don't ever use this in the video game please."
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	icon_state = "null"
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	worn_icon_state = "null"
	strip_delay = 200
	max_integrity = 500
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 80, BULLET = 80, LASER = 80, ENERGY = 80, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100) //Make the armor the same as the hardsuit one for consistancy
	actions_types = null //No lights my dude, sorry
	worn_x_dimension = 32
	worn_y_dimension = 48
	clothing_flags = LARGE_WORN_ICON

//No touchy
/obj/item/clothing/head/helmet/space/hardsuit/power_armor/Initialize()
	. = ..()
	interaction_flags_item &= ~INTERACT_ITEM_ATTACK_HAND_PICKUP
	ADD_TRAIT(src, TRAIT_NODROP, STICKY_NODROP) //Somehow it's stuck to your body, no questioning.

//Generic power armor based off of the hardsuit
/obj/item/clothing/suit/space/hardsuit/power_armor
	name = "Generic Power Armor"
	desc = "Don't ever use this in the video game please."
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	icon_state = "frame"
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	worn_icon_state = "frame"
	density = TRUE //It's a suit of armor man
	anchored = TRUE
	strip_delay = 200
	max_integrity = 500
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 80, BULLET = 80, LASER = 80, ENERGY = 80, BOMB = 80, BIO = 100, RAD = 100, FIRE = 100, ACID = 100) //Make the armor the same as the hardsuit one for consistancy
	actions_types = null //No helmet toggle, sorry dude
	worn_x_dimension = 32
	worn_y_dimension = 20
	helmettype = null //no helmet; default PA is frame = /obj/item/clothing/head/helmet/space/hardsuit/power_armor
	var/footstep = 1
	var/mob/listeningTo

/obj/item/clothing/suit/space/hardsuit/power_armor/Initialize()
	. = ..()
	interaction_flags_item &= ~INTERACT_ITEM_ATTACK_HAND_PICKUP
	ADD_TRAIT(src, TRAIT_NODROP, STICKY_NODROP) //Somehow it's stuck to your body, no questioning.

//Hardcode goes brrr; borrowed from ancient hardsuits
/obj/item/clothing/suit/space/hardsuit/power_armor/proc/on_mob_move()
	SIGNAL_HANDLER
	var/mob/living/carbon/human/H = loc
	if(!istype(H) || H.wear_suit != src)
		return
	if(footstep > 1)
		playsound(src, 'sound/mecha/mechstep.ogg', 100, TRUE)
		footstep = 0
	else
		footstep++

/obj/item/clothing/suit/space/hardsuit/power_armor/equipped(mob/user, slot)
	. = ..()
	ADD_TRAIT(user, TRAIT_FORCED_STANDING, "power_armor") //It's a suit of armor, it ain't going to fall over just because the pilot is dead
	if(slot != ITEM_SLOT_OCLOTHING)
		if(listeningTo)
			UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
		return
	if(listeningTo == user)
		return
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)
	RegisterSignal(user, COMSIG_MOVABLE_MOVED, .proc/on_mob_move)
	listeningTo = user

/obj/item/clothing/suit/space/hardsuit/power_armor/dropped(mob/user)
	. = ..()
	if(listeningTo)
		UnregisterSignal(listeningTo, COMSIG_MOVABLE_MOVED)

/obj/item/clothing/suit/space/hardsuit/power_armor/Destroy()
	listeningTo = null
	return ..()

//No helmet toggles for now when helmet is up
/obj/item/clothing/suit/space/hardsuit/power_armor/ToggleHelmet()
	if(suittoggled || (helmettype == null))
		return
	return ..()

//Let's get into the power armor (or not)
/obj/item/clothing/suit/space/hardsuit/power_armor/AltClick(mob/living/carbon/human/user)
	if(!istype(user))
		return FALSE

	if(user.head && user.head != helmet || user.wear_suit && user.wear_suit != src)
		to_chat(user, "You're unable to climb into the [src] due to already having a helmet or suit equipped!")
		return FALSE

	else
		if(user.wear_suit == src)
			to_chat(user, "You begin exiting the [src].")
			if(do_after(user, 6 SECONDS, target = user) && user.wear_suit == src)
				GetOutside(user)
				return TRUE
			else
				return FALSE

	to_chat(user, "You begin entering the [src].")
	if(do_after(user, 6 SECONDS, target = user) && user.wear_suit != src)
		GetInside(user)
		return TRUE

	return FALSE

//Let's actually get into the power armor
/obj/item/clothing/suit/space/hardsuit/power_armor/proc/GetInside(mob/living/carbon/human/user)
	if(!istype(user))
		return

	density = FALSE
	anchored = FALSE
	user.visible_message("<span class='warning'>[user] enters the [src]!</span>")
	user.forceMove(get_turf(src))
	user.equip_to_slot_if_possible(src, ITEM_SLOT_OCLOTHING)
	if(helmettype)
		ToggleHelmet()

//Nevermind let's get out
/obj/item/clothing/suit/space/hardsuit/power_armor/proc/GetOutside(mob/living/carbon/human/user)
	user.visible_message("<span class='warning'>[user] exits from the [src].</span>")
	playsound(src.loc, 'sound/mecha/mechmove03.ogg', 50, TRUE)
	user.dropItemToGround(src, force = TRUE)
	density = TRUE
	anchored = TRUE

//TODO for later involving integrity and ricochets
/obj/item/clothing/suit/space/hardsuit/power_armor/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(prob(50))
		var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread
		spark_system.start()
	..()

/* t45 sprite unimpleneted

//For now the t45 is just a new subtype
/obj/item/clothing/head/helmet/space/hardsuit/power_armor/t45
	name = "T45 Power Armor Helmet"
	desc = "A beefy helmet attached to a suit of power armor."

/obj/item/clothing/suit/space/hardsuit/power_armor/t45
	name = "T45 Power Armor Suit"
	desc = "Supposedly the first power armor to be deployed in the Great War. While it does have it's flaws, it still represents a very robust piece of armor that can withstand great punishment."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/power_armor/t45
*/

/obj/item/clothing/head/helmet/space/hardsuit/power_armor/t51
	name = "T51 Power Armor Helmet"
	desc = "A more advanced helmet for a more advanced piece of power armor."
	armor = list(MELEE = 90, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 90, BIO = 100, RAD = 100, FIRE = 100, ACID = 100) //Make the armor the same as the hardsuit one for consistancy
	icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	icon_state = "t51_helmet"
	worn_icon_state = "t51_helmet"

/obj/item/clothing/suit/space/hardsuit/power_armor/t51
	name = "T51B Power Armor Suit"
	desc = "The last widely developed and distributed power armor prior to the nuclear winter, even after all of these years it still outperforms it's previous model iteration."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/power_armor/t51
	armor = list(MELEE = 90, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 90, BIO = 100, RAD = 100, FIRE = 100, ACID = 100) //Make the armor the same as the hardsuit one for consistancy
	icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	icon_state = "t51_armor"
	worn_icon_state = "t51_armor"
