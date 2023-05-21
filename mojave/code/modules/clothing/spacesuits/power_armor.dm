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

/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armour_penetration, def_zone)
	if(!uses_integrity)
		CRASH("[src] had /atom/proc/take_damage() called on it without it being a type that has uses_integrity = TRUE!")
	if(QDELETED(src))
		CRASH("[src] taking damage after deletion")
	if(atom_integrity <= 0)
		return damage_amount
	if(sound_effect)
		play_attack_sound(damage_amount, damage_type, damage_flag)
	if(resistance_flags & INDESTRUCTIBLE)
		return
	damage_amount = run_atom_subarmor(damage_amount, damage_type, damage_flag, attack_dir, armour_penetration)
	if(damage_amount < DAMAGE_PRECISION)
		return
	if(SEND_SIGNAL(src, COMSIG_ATOM_TAKE_DAMAGE, damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armour_penetration) & COMPONENT_NO_TAKE_DAMAGE)
		return

	. = damage_amount

	update_integrity(atom_integrity - damage_amount)

	//BREAKING
	if(integrity_failure && atom_integrity <= integrity_failure * max_integrity)
		atom_break(damage_flag)

	if(atom_integrity <= 0)
		atom_destruction(damage_flag)

/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/atom_break(damage_flag)
	. = ..()

/obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/atom_destruction(damage_flag)
	return

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

/obj/item/radio/headset/ms13/powerarmor/attackby(obj/item/I, mob/user, params)
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

//Frame power armor based off of the hardsuit
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor
	name = "Frame Power Armor"
	desc = "Don't ever use this in the video game please."
	icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	worn_icon = 'mojave/icons/mob/large-worn-icons/32x48/armor.dmi'
	icon_state = "frame"
	worn_icon_state = "frame"
	allowed = list(/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	density = TRUE //It's a suit of armor man
	anchored = TRUE
	strip_delay = 15 SECONDS
	integrity_failure = 0.5
	max_integrity = 500
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 0, ACID = 0, WOUND = 0)
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = CLASS2_EDGE, \
					CRUSHING = CLASS2_CRUSH, \
					CUTTING = CLASS2_CUT, \
					PIERCING = CLASS2_PIERCE, \
					IMPALING = CLASS2_STAB, \
					LASER = CLASS2_LASER, \
					ENERGY = CLASS2_PLASMA, \
					FIRE = CLASS2_FIRE)

	var/list/module_armor = list(
		BODY_ZONE_HEAD = null,
		BODY_ZONE_CHEST = null,
		BODY_ZONE_L_ARM = null,
		BODY_ZONE_R_ARM = null,
		BODY_ZONE_L_LEG = null,
		BODY_ZONE_R_LEG = null
	)
	actions_types = null //No helmet toggle, sorry dude
	worn_x_dimension = 32
	worn_y_dimension = 20
	helmettype = null //no helmet; default PA is frame = /obj/item/clothing/head/helmet/space/hardsuit/power_armor
	clothing_traits = list()
	item_flags = NO_PIXEL_RANDOM_DROP
	ms13_flags_1 = LOCKABLE_1
	clothing_flags = LARGE_WORN_ICON | STOPSPRESSUREDAMAGE | THICKMATERIAL | SNUG_FIT | BLOCKS_SHOVE_KNOCKDOWN
	slowdown = 1.35
	/// Literally just whether or not we allow fatties to wear this power armor
	var/no_fatties = TRUE
	var/mob/listeningTo
	var/obj/structure/ms13/workbench/link_to
	var/list/actions_modules = list()

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/Initialize()
	. = ..()
	interaction_flags_item &= ~INTERACT_ITEM_ATTACK_HAND_PICKUP
	ADD_TRAIT(src, TRAIT_NODROP, STICKY_NODROP) //Somehow it's stuck to your body, no questioning.
	AddElement(/datum/element/radiation_protected_clothing)
	RegisterSignal(src, COMSIG_ATOM_CAN_BE_PULLED, .proc/reject_pulls)

	for(var/i in module_armor)
		if(isnull(module_armor[i]))
			continue
		if(i == BODY_ZONE_HEAD)
			var/type = module_armor[i]
			var/obj/item/power_armor/head/H = new type(null)
			module_armor[i] = H
			helmettype = H.type_helmet
			MakeHelmet()
			continue
		var/type = module_armor[i]
		var/obj/item/power_armor/PA_part = new type(null)
		PA_part.frame = src
		module_armor[i] = PA_part
		var/icon/PA = new(icon, icon_state = PA_part.icon_state_pa)
		add_overlay(PA)

		for(var/k in PA_part.modules)
			if(isnull(PA_part.modules[k]))
				continue
			var/obj/item/pa_module/PA_m = PA_part.modules[k]
			PA_m.added_to_pa()

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/Destroy()
	. = ..()
	link_to = null
	for(var/i in module_armor)
		if(isnull(module_armor[i]))
			continue
		qdel(module_armor[i])
	actions_modules = list()
	listeningTo = null
	UnregisterSignal(src, COMSIG_ATOM_CAN_BE_PULLED)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/update_actions()
	actions_modules = null
	for(var/i in module_armor)
		if(isnull(module_armor[i]))
			continue
		var/obj/item/power_armor/PA = module_armor[i]
		if(PA.actions_modules)
			LAZYINITLIST(actions_modules)
			actions_modules |= PA.actions_modules

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/update_parts_icons()
	cut_overlays()
	for(var/i in module_armor)
		if(isnull(module_armor[i]))
			continue
		if(i == BODY_ZONE_HEAD)
			continue
		var/obj/item/power_armor/PA_part = module_armor[i]
		var/icon/PA = new(icon, icon_state = PA_part.icon_state_pa)
		add_overlay(PA)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/build_worn_icon(default_layer, default_icon_file, isinhands, femaleuniform, override_state)
	var/mutable_appearance/standing = ..()
	for(var/i in module_armor)
		if(isnull(module_armor[i]))
			continue
		if(i == BODY_ZONE_HEAD)
			continue
		var/obj/item/power_armor/PA_part = module_armor[i]
		var/icon/PA = new(icon, icon_state = PA_part.icon_state_pa)
		standing.overlays.Add(PA)

	return standing

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/examine(mob/user)
	. = ..()
	for(var/i in module_armor)
		if(isnull(module_armor[i]))
			continue
		var/obj/item/power_armor/PA = module_armor[i]
		if(PA.zone == BODY_ZONE_HEAD)
			. +=  "[PA.get_examine_string(user, TRUE, FALSE)]"
			continue
		. += "[PA.get_examine_string(user, TRUE)]"
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

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/attackby(obj/item/I, mob/user, params)
	if(I.item_flags & LOCKING_ITEM && ms13_flags_1 & LOCKABLE_1)
		if(lock_locked)
			to_chat(user, span_warning("The [name] already has a lock."))
			return
		if(!can_be_picked)
			return
		var/obj/item/ms13/lock/L = I
		if(!L.lock_open)
			to_chat(user, span_warning("The [name] is closed."))
			return
		if(!user.transferItemToLoc(L, src))
			return
		lock = I
		to_chat(user, span_notice("You attach the [lock.name] to the [name]."))
		update_appearance()
		return
	else if(I.tool_behaviour == TOOL_CROWBAR)
		toggle_spacesuit_cell(user)
		return
	else if(cell_cover_open && istype(I, /obj/item/stock_parts/cell))
		if(cell)
			to_chat(user, span_warning("[src] already has a cell installed."))
			return
		if(user.transferItemToLoc(I, src))
			cell = I
			to_chat(user, span_notice("You successfully install \the [cell] into [src]."))
			return
	else if(istype(I, /obj/item/light) && helmettype)
		if(src == user.get_item_by_slot(ITEM_SLOT_OCLOTHING))
			to_chat(user, span_warning("You cannot replace the bulb in the helmet of [src] while wearing it."))
			return
		if(helmet)
			to_chat(user, span_warning("The helmet of [src] does not require a new bulb."))
			return
		var/obj/item/light/L = I
		if(L.status)
			to_chat(user, span_warning("This bulb is too damaged to use as a replacement!"))
			return
		if(do_after(user, 5 SECONDS, src))
			qdel(I)
			helmet = new helmettype(src)
			to_chat(user, span_notice("You have successfully repaired [src]'s helmet."))
			new /obj/item/light/bulb/broken(drop_location())
			return
	else if(istype(I, /obj/item/power_armor))
		if(!link_to)
			to_chat(user, span_warning("You need connect power armor to workbench for modify!"))
			return
		var/obj/item/power_armor/PA = I
		if(module_armor[PA.zone])
			to_chat(user, span_warning("This module power armor already in power armor!"))
			return
		if(do_after(user, 5 SECONDS, target = user) && user.transferItemToLoc(I, src))
			module_armor[PA.zone] = PA
			if(PA.zone == BODY_ZONE_HEAD)
				helmettype = PA:type_helmet
				MakeHelmet()
			update_actions()
			update_parts_icons()
			PA.frame = src
			for(var/k in PA.modules)
				if(isnull(PA.modules[k]))
					continue
				var/obj/item/pa_module/PA_m = PA.modules[k]
				PA_m.added_to_pa()
			to_chat(user, span_notice("You successfully install \the [PA] into [src]."))
		return
	else if(I.tool_behaviour == TOOL_SCREWDRIVER)
		if(!link_to)
			to_chat(user, span_warning("You need connect power armor to workbench for modify!"))
			return

		var/list/radial_options = list()
		var/list/part_to_zone = list()
		for(var/i in module_armor)
			if(isnull(module_armor[i]))
				continue
			var/obj/item/power_armor/PA = module_armor[i]
			radial_options[PA.name] = image(PA.icon, PA.icon_state)
			part_to_zone[PA.name] = PA.zone

		if(!radial_options.len)
			to_chat(user, span_warning("Power armor don't have modules!"))
			return

		var/radial_result = part_to_zone[show_radial_menu(user, src, radial_options, require_near = TRUE, tooltips = TRUE)]
		var/hand = user.get_empty_held_index_for_side(LEFT_HANDS) || user.get_empty_held_index_for_side(RIGHT_HANDS)

		if(radial_result && do_after(user, 5 SECONDS, user))
			var/obj/item/power_armor/PA = module_armor[radial_result]
			if(!user.put_in_hand(PA, hand))
				PA.forceMove(user.loc)
			module_armor[radial_result] = null
			if(radial_result == BODY_ZONE_HEAD)
				RemoveHelmet()
			update_parts_icons()
			PA.frame = null
			for(var/k in PA.modules)
				if(isnull(PA.modules[k]))
					continue
				var/obj/item/pa_module/PA_m = PA.modules[k]
				PA_m.removed_from_pa()
			to_chat(user, span_notice("You successfully uninstall \the [PA] into [src]."))
		return

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armour_penetration, def_zone = BODY_ZONE_CHEST)
	if(!uses_integrity)
		CRASH("[src] had /atom/proc/take_damage() called on it without it being a type that has uses_integrity = TRUE!")
	if(QDELETED(src))
		CRASH("[src] taking damage after deletion")
	if(atom_integrity <= 0)
		return damage_amount
	if(sound_effect)
		play_attack_sound(damage_amount, damage_type, damage_flag)
	if(resistance_flags & INDESTRUCTIBLE)
		return

	if(def_zone == BODY_ZONE_PRECISE_GROIN)
		def_zone = BODY_ZONE_CHEST
	if(def_zone == BODY_ZONE_PRECISE_EYES || def_zone == BODY_ZONE_PRECISE_MOUTH)
		def_zone = BODY_ZONE_HEAD

	var/obj/item/power_armor/PA_item = module_armor[def_zone]
	if(istype(PA_item) && PA_item.get_integrity() > 0)
		if(def_zone == BODY_ZONE_HEAD)
			helmet.take_damage(damage_amount, damage_type, damage_flag, null, attack_dir, armour_penetration, def_zone)
			return 0
		else
			var/damage_to_frame = - (PA_item.get_integrity() - PA_item.take_damage(damage_amount, damage_type, damage_flag, null, attack_dir, armour_penetration, def_zone))
			if(damage_to_frame <= 0)
				return 0
			damage_amount = damage_to_frame

	damage_amount = run_atom_subarmor(damage_amount, damage_type, damage_flag, attack_dir, armour_penetration)
	if(damage_amount < DAMAGE_PRECISION)
		return
	if(SEND_SIGNAL(src, COMSIG_ATOM_TAKE_DAMAGE, damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armour_penetration) & COMPONENT_NO_TAKE_DAMAGE)
		return

	. = damage_amount

	update_integrity(atom_integrity - damage_amount)

	//BREAKING
	if(integrity_failure && atom_integrity <= integrity_failure * max_integrity)
		atom_break(damage_flag)

	if(atom_integrity <= 0)
		atom_destruction(damage_flag)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/atom_break(damage_flag)
	. = ..()
	if(prob(35)) //SPARK
		do_sparks(2, FALSE, src)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/atom_destruction(damage_flag)
	subarmor = subarmor.setRating(NONE, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	if(listeningTo)
		ADD_TRAIT(listeningTo, TRAIT_IMMOBILIZED, "power_armor")
		ADD_TRAIT(listeningTo, TRAIT_INCAPACITATED, "power_armor")

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/equipped(mob/living/carbon/human/user, slot)
	if(actions_modules)
		actions = actions_modules
	. = ..()
	if(slot != ITEM_SLOT_OCLOTHING)
		return
	user.RemoveElement(/datum/element/footstep, FOOTSTEP_MOB_HUMAN, 1, -6)
	user.AddElement(/datum/element/footstep, FOOTSTEP_PA, 1, -6, sound_vary = TRUE)
	listeningTo = user
	// How do you buckle a suit of power armor to something?
	user.can_buckle_to = FALSE
	user.base_pixel_y = user.base_pixel_y + 6
	user.pixel_y = user.base_pixel_y
	ADD_TRAIT(user, TRAIT_FORCED_STANDING, "power_armor") //It's a suit of armor, it ain't going to fall over just because the pilot is dead
	ADD_TRAIT(user, TRAIT_NOSLIPALL, "power_armor")
	ADD_TRAIT(user, TRAIT_STUNIMMUNE, "power_armor")
	ADD_TRAIT(user, TRAIT_NOMOBSWAP, "power_armor")
	ADD_TRAIT(user, TRAIT_PUSHIMMUNE, "power_armor")
	if(atom_integrity == 0)
		ADD_TRAIT(user, TRAIT_IMMOBILIZED, "power_armor")
		ADD_TRAIT(user, TRAIT_INCAPACITATED, "power_armor")
	RegisterSignal(user, COMSIG_ATOM_CAN_BE_PULLED, .proc/reject_pulls)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/dropped(mob/living/carbon/human/user)
	. = ..()
	// So that you can be buckled again on leaving the suit of armor.
	user.can_buckle_to = TRUE
	user.base_pixel_y = user.base_pixel_y - 6
	user.pixel_y = user.base_pixel_y
	user.RemoveElement(/datum/element/footstep, FOOTSTEP_PA, 1, -6, sound_vary = TRUE)
	user.AddElement(/datum/element/footstep, FOOTSTEP_MOB_HUMAN, 1, -6)
	listeningTo = null
	REMOVE_TRAIT(user, TRAIT_FORCED_STANDING, "power_armor") //It's a suit of armor, it ain't going to fall over just because the pilot is dead
	REMOVE_TRAIT(user, TRAIT_NOSLIPALL, "power_armor")
	REMOVE_TRAIT(user, TRAIT_STUNIMMUNE, "power_armor")
	REMOVE_TRAIT(user, TRAIT_NOMOBSWAP, "power_armor")
	REMOVE_TRAIT(user, TRAIT_PUSHIMMUNE, "power_armor")
	REMOVE_TRAIT(user, TRAIT_IMMOBILIZED, "power_armor")
	REMOVE_TRAIT(user, TRAIT_INCAPACITATED, "power_armor")
	UnregisterSignal(user, COMSIG_ATOM_CAN_BE_PULLED)

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
	if(ms13_flags_1 & LOCKABLE_1 && lock_locked)
		to_chat(user, span_warning("The [name] is locked."))
		playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 50, TRUE)
		return
	if(!istype(user))
		return FALSE
	else
		if(user.wear_suit == src)
			to_chat(user, "You begin exiting the [src].")
			if(do_after(user, 8 SECONDS, user, IGNORE_INCAPACITATED) && !density && (get_dist(user, src) <= 1))
				GetOutside(user)
				return TRUE
			return FALSE

	if(!CheckEquippedClothing(user) || get_dist(user, src) > 1 || link_to)
		return FALSE
	if(user.fatness == FATNESS_OBESE)
		to_chat(user, span_warning("Your fat ass is too huge to fit in."))
		return FALSE
	to_chat(user, "You begin entering the [src].")
	if(do_after(user, 8 SECONDS, user) && CheckEquippedClothing(user) && density)
		GetInside(user)
		return TRUE
	return FALSE

//A proc that checks if the user is already wearing clothing that obstructs the equipping of the power armor
/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/CheckEquippedClothing(mob/living/carbon/human/user)
	if(helmet && user.head && (user.head != helmet) || user.wear_suit && (user.wear_suit != src) || user.back || user.belt || user.ears)
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
		if(helmet2?.radio)
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
	if(helmet2?.radio)
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
	module_armor = list(
		BODY_ZONE_HEAD =  /obj/item/power_armor/head/t51,
		BODY_ZONE_CHEST = /obj/item/power_armor/chest/t51,
		BODY_ZONE_L_ARM = /obj/item/power_armor/arm/left/t51,
		BODY_ZONE_R_ARM = /obj/item/power_armor/arm/right/t51,
		BODY_ZONE_L_LEG = /obj/item/power_armor/leg/left/t51,
		BODY_ZONE_R_LEG = /obj/item/power_armor/leg/right/t51
	)

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t51/random/Initialize()
	random_type()
	. = ..()

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
	module_armor = list(
		BODY_ZONE_HEAD = /obj/item/power_armor/head/t45,
		BODY_ZONE_CHEST = null,
		BODY_ZONE_L_ARM = null,
		BODY_ZONE_R_ARM = null,
		BODY_ZONE_L_LEG = null,
		BODY_ZONE_R_LEG = null
	)
	icon_state = "t45_armor"
	worn_icon_state = "t45_armor"

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/t45/random/Initialize()
	random_type()
	. = ..()

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/random/Initialize()
	var/list/L = subtypesof(/obj/item/power_armor/head)
	var/obj/item/power_armor/part
	for(var/obj/item/power_armor/i as anything in L)
		part = new i(null)
		L[i] = part.chance
		qdel(part)

	L["None"] = 50
	var/item = pick_weight(L)
	if(item != "None")
		module_armor[BODY_ZONE_HEAD] = item

	L = subtypesof(/obj/item/power_armor/leg/left)
	for(var/obj/item/power_armor/i as anything in L)
		part = new i(null)
		L[i] = part.chance
		qdel(part)

	L["None"] = 50
	item = pick_weight(L)
	if(item != "None")
		module_armor[BODY_ZONE_L_LEG] = item

	L = subtypesof(/obj/item/power_armor/leg/right)
	for(var/obj/item/power_armor/i as anything in L)
		part = new i(null)
		L[i] = part.chance
		qdel(part)

	L["None"] = 50
	item = pick_weight(L)
	if(item != "None")
		module_armor[BODY_ZONE_R_LEG] = item

	L = subtypesof(/obj/item/power_armor/chest)
	for(var/obj/item/power_armor/i as anything in L)
		part = new i(null)
		L[i] = part.chance
		qdel(part)

	L["None"] = 50
	item = pick_weight(L)
	if(item != "None")
		module_armor[BODY_ZONE_CHEST] = item

	L = subtypesof(/obj/item/power_armor/arm/left)
	for(var/obj/item/power_armor/i as anything in L)
		part = new i(null)
		L[i] = part.chance
		qdel(part)

	L["None"] = 50
	item = pick_weight(L)
	if(item != "None")
		module_armor[BODY_ZONE_L_ARM] = item

	L = subtypesof(/obj/item/power_armor/arm/right)
	for(var/obj/item/power_armor/i as anything in L)
		part = new i(null)
		L[i] = part.chance
		qdel(part)

	L["None"] = 50
	item = pick_weight(L)
	if(item != "None")
		module_armor[BODY_ZONE_R_ARM] = item


	. = ..()

/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/proc/random_type()
	var/list/L = list(module_armor[BODY_ZONE_HEAD] = 5, "None" = 5)
	var/item = pick_weight(L)
	if(item == "None")
		module_armor[BODY_ZONE_HEAD] = null

	L  = list(module_armor[BODY_ZONE_CHEST] = 5, "None" = 5)
	item = pick_weight(L)
	if(item == "None")
		module_armor[BODY_ZONE_CHEST] = null

	L = list(module_armor[BODY_ZONE_L_ARM] = 5, "None" = 5)
	item = pick_weight(L)
	if(item == "None")
		module_armor[BODY_ZONE_L_ARM] = null

	L = list(module_armor[BODY_ZONE_R_ARM] = 5, "None" = 5)
	item = pick_weight(L)
	if(item == "None")
		module_armor[BODY_ZONE_R_ARM] = null

	L = list(module_armor[BODY_ZONE_L_LEG] = 5, "None" = 5)
	item = pick_weight(L)
	if(item == "None")
		module_armor[BODY_ZONE_L_LEG] = null

	L = list(module_armor[BODY_ZONE_R_LEG] = 5, "None" = 5)
	item = pick_weight(L)
	if(item == "None")
		module_armor[BODY_ZONE_R_LEG] = null
