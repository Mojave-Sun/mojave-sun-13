/obj/item/grenade/frag/ms13
	name = "frag grenade"
	desc = "The average frag grenade, if you could even say that. Utilizing an explosive payload to blast shrapnel around a large area. Great for clearing rooms."

/obj/item/grenade/frag/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/throwables/grenades_inventory.dmi')

/obj/item/grenade/frag/ms13/charge
	name = "explosive charge"
	desc = "An explosive charge used for thundersticks."

/obj/item/grenade/ms13/molotov
	name = "molotov cocktail"
	desc = "The firestarters best friend, a very simple grenade consisting of a rag and a full bottle of alcohol. Light those suckers up."
	icon = 'mojave/icons/objects/throwables/grenades_world.dmi'
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
	SEND_SIGNAL(src, COMSIG_GRENADE_ARMED, det_time, delayoverride)
	addtimer(CALLBACK(src, .proc/detonate), isnull(delayoverride)? det_time : delayoverride)

/obj/item/grenade/ms13/molotov/detonate(mob/living/lanced_by)
	playsound(loc, 'sound/effects/hit_on_shattered_glass.ogg', 35, TRUE, 4)
	flame_radius(1, get_turf(src))
	playsound(loc, 'mojave/sound/ms13effects/explosion_fire_grenade.ogg', 30, TRUE, 4)
	qdel(src)

/obj/item/grenade/ms13/molotov/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!. && active)
		detonate()
	else
		playsound(src, "shatter", 70, TRUE)
		new /obj/item/shard(src.loc)
		qdel(src)
