
/obj/item/ms13/power_armor
	name = "power armor part"
	desc = ""
	icon = 'mojave/icons/objects/pa_items.dmi'
	pickup_sound = 'mojave/sound/ms13weapons/meleesounds/general_pickup.ogg'
	drop_sound = 'mojave/sound/ms13effects/impact/metal/metal_hollow_2.wav'
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0,  FIRE = 100, ACID = 0, WOUND = 15)
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = 0, \
					CRUSHING = 0, \
					CUTTING = 0, \
					PIERCING = 0, \
					IMPALING = 0, \
					LASER = 0, \
					ENERGY = 0, \
					FIRE = 0)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	uses_integrity = TRUE
	max_integrity = 100
	throw_range = 3 //heavy LOL!
	throw_speed = 0.75
	var/icon_state_pa
	var/chance = 0 //Weight for pick
	var/list/modules = list(MAIN_MODULE_PA = null, PASSIVE_MODULE_PA = null)
	var/list/actions_modules = null
	var/zone = null
	var/obj/item/clothing/suit/space/hardsuit/ms13/power_armor/frame = null

/obj/item/ms13/power_armor/attackby(obj/item/I, mob/living/user, params)
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		var/list/radial_options = list()
		var/list/part_to_zone = list()
		for(var/i in modules)
			if(isnull(modules[i]))
				continue
			var/obj/item/ms13/pa_module/PA = modules[i]
			radial_options[PA.name] = image(PA.icon, PA.icon_state)
			part_to_zone[PA.name] = i

		if(!radial_options.len)
			to_chat(user, span_warning("\the [I] don't have modules!"))
			return

		var/radial_result = part_to_zone[show_radial_menu(user, src, radial_options, require_near = TRUE, tooltips = TRUE)]
		var/hand = user.get_empty_held_index_for_side(LEFT_HANDS) || user.get_empty_held_index_for_side(RIGHT_HANDS)

		if(radial_result && do_after(user, 5 SECONDS, target = user))
			var/obj/item/ms13/pa_module/PA = modules[radial_result]
			if(!user.put_in_hand(PA, hand))
				PA.forceMove(user.loc)
			modules[radial_result] = null
			if(PA.actions_modules)
				actions_modules.Remove(PA.actions_modules)
			to_chat(user, span_notice("You successfully uninstall \the [I] into [src]."))
		return

	else if(istype(I, /obj/item/ms13/pa_module))
		var/obj/item/ms13/pa_module/module = I
		if(!module.zone == zone)
			to_chat(user, span_warning("You can't install this module to [src]."))
			return
		if(modules[module.class_type])
			to_chat(user, span_warning("[src] already have module there."))
			return
		if(do_after(user, 5 SECONDS, user) && user.transferItemToLoc(module, src))
			modules[module.class_type] = module
			if(module.actions_modules)
				LAZYINITLIST(actions_modules)
				actions_modules |= module.actions_modules
			to_chat(user, span_notice("You successfully install \the [module] into [src]."))
		return

	else if(I.tool_behaviour == TOOL_WELDER)
		if(!(atom_integrity <= max_integrity - 10))
			to_chat(user, span_warning("The [src] doesn't need repairs."))
			return

		if(!I.tool_start_check(user, amount=1))
			return
		user.visible_message(
			span_notice("[user] begins patching up the [src] with [I]."),
			span_notice("You begin restoring the [src]..."))
		playsound(src, 'mojave/sound/ms13effects/crafting/welding-2.ogg', 45, TRUE)
		if(!I.use_tool(src, user, 1.5 SECONDS, volume=0, amount=1))
			return
		user.visible_message(
			span_notice("[user] fixes up [src]!"),
			span_notice("You mend the damage of [src]."))
		atom_integrity += 15
		playsound(src, 'mojave/sound/ms13effects/crafting/welding-3.ogg', 45, TRUE)
		update_appearance()
		return ..()

/obj/item/ms13/power_armor/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armour_penetration)
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

/obj/item/ms13/power_armor/atom_break(damage_flag)
	. = ..()

/obj/item/ms13/power_armor/atom_destruction(damage_flag)
	return

/obj/item/ms13/power_armor/get_examine_string(mob/user, thats, damage = TRUE)
	var/damage_txt = ""
	if(damage)
		if(atom_integrity <= 0)
			damage_txt ="This part is broken"
		if(atom_integrity > 0 && (atom_integrity < (max_integrity / 3)))
			damage_txt ="This part is heavily damaged"
		if((atom_integrity > (max_integrity / 3)) && (atom_integrity < (max_integrity * (2/3))))
			damage_txt = "This part is damaged"
		if((atom_integrity > (max_integrity * (2/3))) && (atom_integrity < max_integrity))
			damage_txt = "This part is lightly damaged"
		if(atom_integrity == max_integrity)
			damage_txt = "This part is not damaged"
	return "[icon2html(src, user)] [thats? "That's ":""][get_examine_name(user)]. [damage_txt]"

/obj/item/ms13/power_armor/leg
	name = "Leg power armor"
	w_class = WEIGHT_CLASS_BULKY
	grid_height = 128
	grid_width = 96

/obj/item/ms13/power_armor/leg/left
	name = "power armor"
	zone = BODY_ZONE_L_LEG

/obj/item/ms13/power_armor/leg/right
	name = "power armor"
	zone = BODY_ZONE_R_LEG

/obj/item/ms13/power_armor/arm
	name = "Arm power armor"
	w_class = WEIGHT_CLASS_BULKY
	grid_height = 128
	grid_width = 96

/obj/item/ms13/power_armor/arm/left
	name = "Left arm power armor"
	zone = BODY_ZONE_L_ARM

/obj/item/ms13/power_armor/arm/right
	name = "Right arm power armor"
	zone = BODY_ZONE_R_ARM

/obj/item/ms13/power_armor/chest
	name = "Chest power armor"
	zone = BODY_ZONE_CHEST
	w_class = WEIGHT_CLASS_HUGE
	grid_height = 256
	grid_width = 256

/obj/item/ms13/power_armor/head
	name = "Helmet power armor"
	zone = BODY_ZONE_HEAD
	var/type_helmet = null
	w_class = WEIGHT_CLASS_BULKY
	grid_height = 96
	grid_width = 96

//T-51 SET
/obj/item/ms13/power_armor/leg/left/t51
	name = "T-51 Power Armor left leg"
	icon_state = "t51_leftleg"
	icon_state_pa = "t51_leftleg"
	max_integrity = 280
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = CLASS4_EDGE, \
					CRUSHING = CLASS5_CRUSH, \
					CUTTING = CLASS5_CUT, \
					PIERCING = CLASS4_PIERCE, \
					IMPALING = CLASS5_STAB, \
					LASER = CLASS4_LASER, \
					ENERGY = CLASS4_PLASMA, \
					FIRE = CLASS5_FIRE)
	chance = 35

/obj/item/ms13/power_armor/leg/right/t51
	name = "T-51 Power Armor right leg"
	icon_state = "t51_rightleg"
	icon_state_pa = "t51_rightleg"
	max_integrity = 280
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = CLASS4_EDGE, \
					CRUSHING = CLASS5_CRUSH, \
					CUTTING = CLASS5_CUT, \
					PIERCING = CLASS4_PIERCE, \
					IMPALING = CLASS5_STAB, \
					LASER = CLASS4_LASER, \
					ENERGY = CLASS4_PLASMA, \
					FIRE = CLASS5_FIRE)
	chance = 35

/obj/item/ms13/power_armor/chest/t51
	name = "T-51 Power Armor chest"
	icon_state = "t51_chest"
	icon_state_pa = "t51_chest"
	max_integrity = 550
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = CLASS4_EDGE, \
					CRUSHING = CLASS5_CRUSH, \
					CUTTING = CLASS5_CUT, \
					PIERCING = CLASS4_PIERCE, \
					IMPALING = CLASS5_STAB, \
					LASER = CLASS4_LASER, \
					ENERGY = CLASS4_PLASMA, \
					FIRE = CLASS5_FIRE)
	chance = 25

/obj/item/ms13/power_armor/arm/left/t51
	name = "T-51 Power Armor left arm"
	icon_state = "t51_lefthand"
	icon_state_pa = "t51_lefthand"
	max_integrity = 280
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = CLASS4_EDGE, \
					CRUSHING = CLASS5_CRUSH, \
					CUTTING = CLASS5_CUT, \
					PIERCING = CLASS4_PIERCE, \
					IMPALING = CLASS5_STAB, \
					LASER = CLASS4_LASER, \
					ENERGY = CLASS4_PLASMA, \
					FIRE = CLASS5_FIRE)
	chance = 35

/obj/item/ms13/power_armor/arm/right/t51
	name = "T-51 Power Armor right arm"
	icon_state = "t51_righthand"
	icon_state_pa = "t51_righthand"
	max_integrity = 280
	subarmor = list(SUBARMOR_FLAGS = NONE, \
					EDGE_PROTECTION = CLASS4_EDGE, \
					CRUSHING = CLASS5_CRUSH, \
					CUTTING = CLASS5_CUT, \
					PIERCING = CLASS4_PIERCE, \
					IMPALING = CLASS5_STAB, \
					LASER = CLASS4_LASER, \
					ENERGY = CLASS4_PLASMA, \
					FIRE = CLASS5_FIRE)
	chance = 35

/obj/item/ms13/power_armor/head/t51
	name = "T-51 Power Armor helmet"
	icon_state = "t51_helmet"
	type_helmet = /obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t51
	chance = 25

//T-45
/obj/item/ms13/power_armor/leg/left/t45
	name = "T-45 Power Armor left leg"
	icon_state = "t45_leftleg"
	icon_state_pa = "t45_leftleg"
	max_integrity = 200
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS4_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS4_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 65

/obj/item/ms13/power_armor/leg/right/t45
	name = "T-45 Power Armor right leg"
	icon_state = "t45_rightleg"
	icon_state_pa = "t45_rightleg"
	max_integrity = 200
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS4_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS4_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 65

/obj/item/ms13/power_armor/chest/t45
	name = "T-45 Power Armor chest"
	icon_state = "t45_chest"
	icon_state_pa = "t45_chest"
	max_integrity = 400
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS4_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS4_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 75

/obj/item/ms13/power_armor/arm/left/t45
	name = "T-45 Power Armor left arm"
	icon_state = "t45_lefthand"
	icon_state_pa = "t45_lefthand"
	max_integrity = 200
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS4_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS4_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 65

/obj/item/ms13/power_armor/arm/right/t45
	name = "T-45 Power Armor right arm"
	icon_state = "t45_righthand"
	icon_state_pa = "t45_righthand"
	max_integrity = 200
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS4_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS4_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS3_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 65

/obj/item/ms13/power_armor/head/t45
	name = "T-45 Power Armor helmet"
	icon_state = "t45_helmet"
	type_helmet = /obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/t45
	chance = 75

/obj/item/ms13/power_armor/head/advanced
	name = "APA helmet"
	icon_state = "apa_helmet"
	type_helmet = /obj/item/clothing/head/helmet/space/hardsuit/ms13/power_armor/advanced
	chance = 0

/obj/item/ms13/power_armor/chest/advanced
	name = "APA chest"
	icon_state = "apa_chest"
	icon_state_pa = "apa_chest"
	max_integrity = 1000
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS5_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS5_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS5_LASER, \
                ENERGY = CLASS4_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 0

/obj/item/ms13/power_armor/arm/left/advanced
	name = "APA left arm"
	icon_state = "apa_lefthand"
	icon_state_pa = "apa_lefthand"
	max_integrity = 500
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS5_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS5_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS4_LASER, \
                ENERGY = CLASS3_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 0

/obj/item/ms13/power_armor/arm/right/advanced
	name = "APA right arm"
	icon_state = "apa_righthand"
	icon_state_pa = "apa_righthand"
	max_integrity = 500
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS5_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS5_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS5_LASER, \
                ENERGY = CLASS4_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 0

/obj/item/ms13/power_armor/leg/left/advanced
	name = "APA left leg"
	icon_state = "apa_leftleg"
	icon_state_pa = "apa_leftleg"
	max_integrity = 400
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS5_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS5_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS5_LASER, \
                ENERGY = CLASS4_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 0

/obj/item/ms13/power_armor/leg/right/advanced
	name = "APA right leg"
	icon_state = "apa_rightleg"
	icon_state_pa = "apa_rightleg"
	max_integrity = 400
	subarmor = list(SUBARMOR_FLAGS = NONE, \
                EDGE_PROTECTION = CLASS4_EDGE, \
                CRUSHING = CLASS5_CRUSH, \
                CUTTING = CLASS5_CUT, \
                PIERCING = CLASS5_PIERCE, \
                IMPALING = CLASS5_STAB, \
                LASER = CLASS5_LASER, \
                ENERGY = CLASS4_PLASMA, \
                FIRE = CLASS5_FIRE)
	chance = 0
