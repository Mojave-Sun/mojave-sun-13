/obj/machinery/ms13/fusion_generator
	name = "fusion generator"
	desc = "A generator that runs on fusion cells. Can power an entire neighborhood by itself! The fusion cell seems to be jammed in hard, but it remains running for now."
	icon = 'mojave/icons/structure/64x64_machinery.dmi'
	icon_state = "generator_on"
	anchored = TRUE
	density = TRUE
	max_integrity = 5000
	flags_1 = INDESTRUCTIBLE

/obj/machinery/ms13/substation
	name = "power substation"
	desc = "A power distribution node. It helps store and redirect power through the networks... You think."
	icon = 'mojave/icons/structure/32x48_machinery.dmi'
	icon_state = "substation"
	anchored = TRUE
	density = TRUE
	max_integrity = 5000
	flags_1 = INDESTRUCTIBLE
	var/zap_flags = ZAP_MOB_DAMAGE | ZAP_MOB_STUN

/obj/machinery/ms13/substation/Bumped(atom/movable/bumped_atom)
	. = ..()
	tesla_zap(src, 3, 100, zap_flags)

/obj/machinery/ms13/substation/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armour_penetration)
	. = ..()
	do_sparks(1, FALSE, src)
	tesla_zap(src, 5, 200, zap_flags)

/obj/machinery/ms13/substation/rusty
	icon_state = "substation_rust"
	anchored = TRUE

/obj/machinery/ms13/substation/discharge
	name = "substation capacitor unit"
	desc = "A large capacitor, it stores energy for rapid use. Has a tendency to discharge when overclocked, be wary."
	icon_state = "generator"

/obj/machinery/ms13/substation/discharge/rusty
	icon_state = "generator_rust"
