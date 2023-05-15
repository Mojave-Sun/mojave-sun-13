
/obj/item/power_armor
	name = "Part power armor"
	icon = 'mojave/icons/objects/pa_items.dmi'
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 0, ACID = 0, WOUND = 0)
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = 0, \
					CRUSHING = 0, \
					CUTTING = 0, \
					PIERCING = 0, \
					IMPALING = 0, \
					LASER = 0, \
					ENERGY = 0, \
					FIRE = 0)
	uses_integrity = TRUE
	max_integrity = 100
	var/icon_state_pa
	var/chance = 0 //Weight for pick
	var/list/modules = list(MAIN_MODULE_PA = null, PASSIVE_MODULE_PA = null)
	var/list/actions_modules = list()
	var/zone = null

/obj/item/power_armor/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		var/list/radial_options = list()
		var/list/part_to_zone = list()
		for(var/i in modules)
			if(isnull(modules[i]))
				continue
			var/obj/item/pa_module/PA = modules[i]
			radial_options[PA.name] = image(PA.icon, PA.icon_state)
			part_to_zone[PA.name] = i

		if(!radial_options.len)
			to_chat(user, span_warning("\the [I] don't have modules!"))
			return

		var/radial_result = part_to_zone[show_radial_menu(user, src, radial_options, require_near = TRUE, tooltips = TRUE)]
		var/hand = user.get_empty_held_index_for_side(LEFT_HANDS) || user.get_empty_held_index_for_side(RIGHT_HANDS)

		if(radial_result && do_after(user, 5 SECONDS, target = user))
			var/obj/item/pa_module/PA = modules[radial_result]
			if(!user.put_in_hand(PA, hand))
				PA.forceMove(user.loc)
			modules[radial_result] = null
			to_chat(user, span_notice("You successfully uninstall \the [I] into [src]."))
		return

	else if(istype(I, /obj/item/pa_module))
		var/obj/item/pa_module/module = I
		if(!module.zone == zone)
			to_chat(user, span_warning("You can't install this module to [src]."))
			return
		if(modules[module.class_type])
			to_chat(user, span_warning("[src] already have module there."))
			return
		if(do_after(user, 5 SECONDS, user) && user.transferItemToLoc(module, src))
			modules[module.class_type] = module
			actions_modules |= module.actions_modules
			to_chat(user, span_notice("You successfully install \the [module] into [src]."))
		return
	return

/obj/item/power_armor/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armour_penetration)
	if(!uses_integrity)
		CRASH("[src] had /atom/proc/take_damage() called on it without it being a type that has uses_integrity = TRUE!")
	if(QDELETED(src))
		CRASH("[src] taking damage after deletion")
	if(atom_integrity <= 0)
		return
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

/obj/item/power_armor/atom_break(damage_flag)
	. = ..()

/obj/item/power_armor/atom_destruction(damage_flag)
	return

/obj/item/power_armor/leg
	name = "Leg power armor"

/obj/item/power_armor/leg/left
	name = "Left leg power armor"
	zone = BODY_ZONE_L_LEG

/obj/item/power_armor/leg/left/t51
	name = "Left leg PA T51"
	icon_state = "t51_leftleg"
	icon_state_pa = "t51_leftleg"
	max_integrity = 250
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = 0, \
					CRUSHING = 0, \
					CUTTING = 0, \
					PIERCING = 0, \
					IMPALING = 0, \
					LASER = 0, \
					ENERGY = 0, \
					FIRE = 0)
	chance = 20

/obj/item/power_armor/leg/right
	name = "Right leg power armor"
	zone = BODY_ZONE_R_LEG

/obj/item/power_armor/leg/right/t51
	name = "Right leg PA T51"
	icon_state = "t51_rightleg"
	icon_state_pa = "t51_rightleg"
	max_integrity = 250
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = 0, \
					CRUSHING = 0, \
					CUTTING = 0, \
					PIERCING = 0, \
					IMPALING = 0, \
					LASER = 0, \
					ENERGY = 0, \
					FIRE = 0)
	chance = 20

/obj/item/power_armor/chest
	name = "Chest power armor"
	zone = BODY_ZONE_CHEST

/obj/item/power_armor/chest/t51
	name = "Chest PA T51"
	icon_state = "t51_chest"
	icon_state_pa = "t51_chest"
	max_integrity = 700
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = 0, \
					CRUSHING = 0, \
					CUTTING = 0, \
					PIERCING = 0, \
					IMPALING = 0, \
					LASER = 0, \
					ENERGY = 0, \
					FIRE = 0)
	chance = 20

/obj/item/power_armor/arm
	name = "Arm power armor"

/obj/item/power_armor/arm/left
	name = "Left arm power armor"
	zone = BODY_ZONE_L_ARM

/obj/item/power_armor/arm/left/t51
	name = "Left arm PA T51"
	icon_state = "t51_lefthand"
	icon_state_pa = "t51_lefthand"
	max_integrity = 300
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = 0, \
					CRUSHING = 0, \
					CUTTING = 0, \
					PIERCING = 0, \
					IMPALING = 0, \
					LASER = 0, \
					ENERGY = 0, \
					FIRE = 0)
	chance = 20

/obj/item/power_armor/arm/right
	name = "Right arm power armor"
	zone = BODY_ZONE_R_ARM

/obj/item/power_armor/arm/right/t51
	name = "Right arm PA T51"
	icon_state = "t51_righthand"
	icon_state_pa = "t51_righthand"
	max_integrity = 300
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = 0, \
					CRUSHING = 0, \
					CUTTING = 0, \
					PIERCING = 0, \
					IMPALING = 0, \
					LASER = 0, \
					ENERGY = 0, \
					FIRE = 0)
	chance = 20

/obj/item/power_armor/head
	name = "Helmet power armor"
	zone = BODY_ZONE_HEAD
	var/type_helmet = null

/obj/item/power_armor/head/t51
	name = "Helmet PA T51"
	icon_state = "t51_helmet"
	type_helmet = /obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t51

/obj/item/power_armor/head/t45
	name = "Helmet PA T45"
	icon_state = "t51_helmet"
	type_helmet = /obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t45
