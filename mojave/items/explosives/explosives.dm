/obj/item/grenade/ms13/Initialize()
	. = ..()
	inhand_icon_state = initial(icon_state)
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/melee/melee_inventory.dmi')

/obj/item/grenade/ms13/examine(mob/user)
	return

/obj/item/grenade/frag/ms13 //nasty code right here, stinks of hekzder
	name = "frag grenade"
	desc = "The average frag grenade, if you could even say that. Utilizing an explosive payload to blast shrapnel around a large area. Great for clearing rooms."
	icon = 'mojave/icons/objects/throwables/grenades_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/grenades_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/grenades_inhand_right.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	throwforce = 10
	display_timer = FALSE
	throw_speed = 2
	throw_range = 6

/obj/item/grenade/frag/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/throwables/grenades_inventory.dmi')

/obj/item/grenade/frag/ms13/arm_grenade(mob/user, delayoverride, msg, volume)
	. = ..()
	icon_state = initial(icon_state) + "_active"
	inhand_icon_state = icon_state
	playsound(src, 'mojave/sound/ms13weapons/grenade_pin.wav', 20, TRUE)

/obj/item/grenade/frag/ms13/dropped(mob/user, silent)
	. = ..()
	playsound(src, 'mojave/sound/ms13weapons/grenade.wav', 20, TRUE)

/obj/item/grenade/frag/ms13/charge
	name = "explosive charge"
	desc = "An explosive charge used for thundersticks."

/obj/item/grenade/frag/ms13/scrap //nasty code right here, stinks of hekzder
	name = "scrap grenade"
	desc = "A homebrew grenade. Quite shifty- You're unsure if you'll work, but pehaps it's worth a shot?"
	icon_state = "tinbomb"
	inhand_icon_state = "tinbomb"
	shrapnel_type = /obj/projectile/bullet/ms13/nail
	shrapnel_radius = 3
	ex_heavy = 2
	///how big of a light explosion radius on prime
	ex_light = 1
	///how big of a flame explosion radius on prime
	ex_flame = 0
	var/list/times
	var/range = 3

/obj/item/grenade/frag/ms13/scrap/Initialize(mapload)
	. = ..()
	times = list("5" = 10, "-1" = 20, "[rand(30, 80)]" = 50, "[rand(65, 180)]" = 20)// "Premature, Dud, Short Fuse, Long Fuse"=[weighting value]
	det_time = text2num(pick_weight(times))
	if(det_time < 0) //checking for 'duds'
		range = 1
		det_time = rand(30, 80)
	else
		range = pick(2, 2, 2, 3, 3, 3, 4)

/obj/item/grenade/ms13/molotov
	name = "molotov cocktail"
	desc = "The firestarters best friend, a very simple grenade consisting of a rag and a full bottle of alcohol. Light those suckers up."
	icon = 'mojave/icons/objects/throwables/grenades_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/weapons/grenades_inhand_left.dmi'
	righthand_file = 'mojave/icons/mob/inhands/weapons/grenades_inhand_right.dmi'
	icon_state = "molotov"
	var/arm_sound = 'sound/items/welder.ogg'

/obj/item/grenade/ms13/molotov/Initialize()
	. = ..()
	det_time = rand(20,80)

/obj/item/grenade/ms13/molotov/attackby(obj/item/I, mob/user, params)
	if(I.get_temperature() && !active)
		arm_grenade()
		to_chat(user, "<span class='info'>You light [src] on fire.</span>")
		return

/obj/item/grenade/ms13/molotov/attack_self(mob/user)
	return //lighting only

/obj/item/grenade/ms13/molotov/arm_grenade(mob/user, delayoverride, msg = TRUE, volume = 60)
	var/turf/T = get_turf(src)
	log_grenade(user, T) //Inbuilt admin procs already handle null users
	if(user)
		add_fingerprint(user)
		if(msg)
			to_chat(user, "<span class='warning'>You prime [src]! [capitalize(DisplayTimeText(det_time))]!</span>")
	if(shrapnel_type && shrapnel_radius)
		shrapnel_initialized = TRUE
		AddComponent(/datum/component/pellet_cloud, projectile_type=shrapnel_type, magnitude=shrapnel_radius)
	playsound(src, arm_sound, volume, TRUE)
	active = TRUE
	icon_state = initial(icon_state) + "_active"
	inhand_icon_state = icon_state
	SEND_SIGNAL(src, COMSIG_GRENADE_ARMED, det_time, delayoverride)
	addtimer(CALLBACK(src, .proc/detonate), isnull(delayoverride)? det_time : delayoverride)
	update_icon()

/obj/item/grenade/ms13/molotov/detonate(mob/living/lanced_by)
	playsound(loc, 'sound/effects/hit_on_shattered_glass.ogg', 35, TRUE, 4)
	flame_radius(1, get_turf(src))
	playsound(loc, 'mojave/sound/ms13effects/explosion_fire_grenade.ogg', 30, TRUE, 4)
	qdel(src)

/obj/item/grenade/ms13/molotov/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(istype(loc, /turf/open/openspace))
		return
	if(!. && active)
		detonate()
	else
		playsound(src, "shatter", 70, TRUE)
		new /obj/item/shard(src.loc)
		qdel(src)
