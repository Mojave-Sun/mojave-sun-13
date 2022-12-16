//Generic power armor helmet
/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor
	name = "Generic Power Armor Helmet"
	desc = "Don't ever use this in the video game please."
	icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/head.dmi'
	icon_state = "null"
	basestate = "helmet"
	strip_delay = 15 SECONDS
	max_integrity = 500
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 0, ACID = 0, WOUND = 0)
	worn_x_dimension = 32
	worn_y_dimension = 48
	worn_y_offset = 2
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | BLOCKS_SHOVE_KNOCKDOWN
	var/obj/item/radio/headset/ms13/powerarmor/radio //Instantiated radio
	var/radiotype = /obj/item/radio/headset/ms13/powerarmor //Typepath of the radio
	actions_types = list(/datum/action/item_action/toggle_helmet_light) //New ability to modify the radio's settings

//No touchy
/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/Initialize()
	. = ..()
	interaction_flags_item &= ~INTERACT_ITEM_ATTACK_HAND_PICKUP
	ADD_TRAIT(src, TRAIT_NODROP, STICKY_NODROP) //Somehow it's stuck to your body, no questioning.
	radio = new radiotype(src)
	AddElement(/datum/element/radiation_protected_clothing)
	AddComponent(/datum/component/clothing_fov_visor, FOV_180_DEGREES)

/obj/item/radio/headset/ms13/
	force_superspace = TRUE // ignore tcoms and zlevels
/obj/item/radio/headset/ms13/powerarmor
	name = "integrated power armor headset"
	actions_types = list(/datum/action/item_action/toggle_radio)
	icon = 'mojave/icons/objects/tools/tools_inventory.dmi'
	icon_state = "handradio"
	subspace_transmission = FALSE
	freerange = TRUE

/obj/item/radio/headset/ms13/powerarmor/Initialize()
	. = ..()
	interaction_flags_item &= ~INTERACT_ITEM_ATTACK_HAND_PICKUP

/obj/item/radio/headset/ms13/powerarmor/attackby(obj/item/W, mob/user, params)
	return

/obj/item/radio/headset/ms13/powerarmor/ui_action_click(mob/user, action)
    if(istype(action, /datum/action/item_action/toggle_radio))
        ui_interact(user)

/obj/item/radio/headset/ms13/powerarmor/t45
    name = "integrated T-45D power armor radio"
    desc = "A mediocre quality radio internally attached to a T-45D power armor helmet."
    radio_broadcast = RADIOSTATIC_MEDIUM

/obj/item/radio/headset/ms13/powerarmor/t51
    name = "integrated T-51B power armor radio"
    desc = "A high quality radio internally attached to a T-51B power armor helmet."
    radio_broadcast = RADIOSTATIC_LIGHT

//Click the ability to access the settings of the integrated radio
/datum/action/item_action/toggle_radio
	name = "Toggle Internal Radio Settings"

//Generic power armor based off of the hardsuit
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor
	name = "Generic Power Armor"
	desc = "Don't ever use this in the video game please."
	icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	icon_state = "frame"
	worn_icon_state = "frame"
	allowed = list(/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	density = TRUE //It's a suit of armor man
	anchored = TRUE
	strip_delay = 15 SECONDS
	max_integrity = 500
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 0, ACID = 0, WOUND = 0)
	actions_types = null //No helmet toggle, sorry dude
	worn_x_dimension = 32
	worn_y_dimension = 20
	helmettype = null //no helmet; default PA is frame = /obj/item/clothing/head/helmet/space/hardsuit/power_armor
	clothing_traits = list(TRAIT_SILENT_FOOTSTEPS) //No playing regular footsteps over power armor footsteps
	item_flags = NO_PIXEL_RANDOM_DROP
	ms13_flags_1 = LOCKABLE_1
	clothing_flags = LARGE_WORN_ICON | STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | BLOCKS_SHOVE_KNOCKDOWN
	slowdown = 1.35
	/// Literally just whether or not we allow fatties to wear this power armor
	var/no_fatties = TRUE
	var/footstep = 1
	var/mob/listeningTo

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/Initialize()
	. = ..()
	interaction_flags_item &= ~INTERACT_ITEM_ATTACK_HAND_PICKUP
	ADD_TRAIT(src, TRAIT_NODROP, STICKY_NODROP) //Somehow it's stuck to your body, no questioning.
	AddElement(/datum/element/radiation_protected_clothing)
	RegisterSignal(src, COMSIG_ATOM_CAN_BE_PULLED, .proc/reject_pulls)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/Destroy()
	listeningTo = null
	UnregisterSignal(src, COMSIG_ATOM_CAN_BE_PULLED)
	return ..()

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/examine(mob/user)
	. = ..()
	. += "Alt+left click this power armor to get into and out of it."
	var/mob/living/carbon/carbon_user = user
	if(istype(carbon_user) && (carbon_user.fatness == FATNESS_OBESE))
		. += span_warning("Your fat ass probably won't fit inside.")

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/examine(mob/user)
	. = ..()
	. += "Alt+left click this power armor to get into and out of it."
	var/mob/living/carbon/carbon_user = user
	if(istype(carbon_user) && (carbon_user.fatness == FATNESS_OBESE))
		. += span_warning("Your fat ass probably won't fit inside.")

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning, bypass_equip_delay_self)
	if((slot == ITEM_SLOT_OCLOTHING) && no_fatties && iscarbon(M))
		var/mob/living/carbon/carbon_fatass = M
		if(carbon_fatass.fatness == FATNESS_OBESE)
			return FALSE
	return ..()

//We want to be able to strip the PA as usual but also have the benefits of NO_DROP to disallow stuff like drag clicking PA into hand slot
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/canStrip(mob/stripper, mob/owner)
	return !(item_flags & ABSTRACT)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/doStrip(mob/stripper, mob/owner)
	GetOutside(owner)
	return TRUE

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/hit_reaction(owner, hitby, attack_text, final_block_chance, damage, attack_type)
	if((damage > 10) && prob(35)) //SPARK
		do_sparks(2, FALSE, src)

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
	ADD_TRAIT(user, TRAIT_PUSHIMMUNE, "power_armor")
	RegisterSignal(user, COMSIG_ATOM_CAN_BE_PULLED, .proc/reject_pulls)

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
	REMOVE_TRAIT(user, TRAIT_PUSHIMMUNE, "power_armor")
	UnregisterSignal(user, COMSIG_ATOM_CAN_BE_PULLED)

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

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/reject_pulls(datum/source, mob/living/puller)
	SIGNAL_HANDLER
	if(puller != loc) // != the wearer
		to_chat(puller, span_warning("The power armor resists your attempt at pulling it!"))
		return COMSIG_ATOM_CANT_PULL

//No helmet toggles for now when helmet is up
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/ToggleHelmet()
	if(helmet_on || (helmettype == null))
		return
	return ..()

//Let's get into the power armor (or not)
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/AltClick(mob/living/carbon/human/user)
	if(.)
		return
	if(ms13_flags_1 & LOCKABLE_1 && lock_locked)
		to_chat(user, span_warning("The [name] is locked."))
		playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 50, TRUE)
		return
	if(!istype(user))
		return FALSE
	else
		if(user.wear_suit == src)
			to_chat(user, "You begin exiting the [src].")
			if(do_after(user, 8 SECONDS, target = user) && density != TRUE && (get_dist(user, src) <= 1))
				GetOutside(user)
				return TRUE
			return FALSE

	if(!CheckEquippedClothing(user) || get_dist(user, src) > 1)
		return FALSE
	if(user.fatness == FATNESS_OBESE)
		to_chat(user, span_warning("Your fat ass is too huge to fit in."))
		return FALSE
	to_chat(user, "You begin entering the [src].")
	if(do_after(user, 8 SECONDS, target = user) && CheckEquippedClothing(user) && density == TRUE)
		GetInside(user)
		return TRUE
	return FALSE

//A proc that checks if the user is already wearing clothing that obstructs the equipping of the power armor
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/CheckEquippedClothing(mob/living/carbon/human/user)
	if(user.head && (user.head != helmet) || user.wear_suit && (user.wear_suit != src) || user.back || user.belt || user.ears)
		to_chat(user, span_warning("You're unable to climb into the [src] due to already having a helmet, backpack, belt, ear accessories or outer suit equipped!"))
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
		var/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/helmet2 = helmet
		if(helmet2.radio)
			user.equip_to_slot(helmet2.radio, ITEM_SLOT_EARS)
			for(var/X in helmet2.radio.actions)
				var/datum/action/A = X
				A.Grant(user)

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
	var/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/helmet2 = helmet
	if(helmet2.radio)
		user.transferItemToLoc(helmet2.radio, helmet)
		for(var/X in helmet2.radio.actions)
			var/datum/action/A = X
			A.Remove(user)

//TODO for later involving integrity and ricochets
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK)
	if(prob(50))
		var/datum/effect_system/spark_spread/spark_system = new /datum/effect_system/spark_spread
		spark_system.start()
	return ..()

// T-51 PA set //
/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t51
	name = "T-51B Power Armor Helmet"
	desc = "A more advanced helmet for a more advanced piece of power armor. Comes with a high quality headlamp and integrated radio."
	icon_state = "helmet0-t51"
	hardsuit_type = "t51" //Determines used sprites: hardsuit[on]-[type]
	light_range = 4.20
	light_power = 0.9
	light_color = "#d1c58d"
	radiotype = /obj/item/radio/headset/ms13/powerarmor/t51
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS5_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS5_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS5_LASER, \
                ENERGY = CLASS4_PLASMA, \
                FIRE = CLASS5_FIRE)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t51
	name = "T-51B Power Armor Suit"
	desc = "The last widely developed and distributed power armor prior to the nuclear winter, even after all of these years it still outperforms it's previous model iteration."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t51
	icon_state = "t51_armor"
	worn_icon_state = "t51_armor"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS5_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS5_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS5_LASER, \
                ENERGY = CLASS4_PLASMA, \
                FIRE = CLASS5_FIRE)

// T-45 PA set //
/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t45
	name = "T-45D Power Armor Helmet"
	desc = "The helmet to a T-45 powered combat armor suit. Stare your foe down as they can only scrape your paint. Comes with a decent quality headlamp and integrated radio."
	icon_state = "helmet0-t45"
	hardsuit_type = "t45"
	light_range = 4
	light_power = 0.8
	light_color = "#dabc7c"
	radiotype = /obj/item/radio/headset/ms13/powerarmor/t45
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS5_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS5_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS4_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS5_FIRE)


/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t45
	name = "T-45D Power Armor Suit"
	desc = "Supposedly the first power armor to be deployed in the Great War. While it does have it's flaws, it still represents a very robust piece of armor that can withstand great punishment."
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t45
	icon_state = "t45_armor"
	worn_icon_state = "t45_armor"
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS5_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS5_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS4_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS5_FIRE)
