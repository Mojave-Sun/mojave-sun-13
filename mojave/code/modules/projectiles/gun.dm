/obj/item/gun
	/// A multiplier of the duration the recoil takes to go back to normal view, this is (recoil*recoil_backtime_multiplier)+1
	var/recoil_backtime_multiplier = 2
	/// This is how much deviation the gun recoil can have, recoil pushes the screen towards the reverse angle you shot + some deviation which this is the max.
	var/recoil_deviation = 22.5

	/// Range beyond which listeners hear far_fire_sound instead of fire_sound
	var/close_fire_range = SOUND_RANGE
	/// Range beyond which no one is hearing anything, not even far_fire_sound
	var/far_fire_range = SOUND_RANGE * 3
	/// Falloff distance for far fire sound, no need to fuck with falloff for nearby guns honestly
	var/far_fire_falloff_distance = SOUND_RANGE
	/// Fire sound for long distances (not providing a default because it would be so fucked up dude)
	var/far_fire_sound
	/// Whether or not to apply variation to the far fire sound
	var/vary_far_fire_sound = TRUE
	/// Volume of the far fire sound (generally should be lower than the normal fire sound, obviously)
	var/far_fire_sound_volume = 40

/**
 * I should probably try to generalize this down to playsound but idc this is all we need for now
 * This should also use the weird little 3d sound system but idk how the hell that works either
 */
/obj/item/gun/proc/fire_sounds(mob/living/user, atom/target)
	var/turf/turf_source = get_turf(src)
	if(!turf_source)
		return
	var/source_z = turf_source.z
	var/turf/above_turf = SSmapping.get_turf_above(turf_source)
	var/turf/below_turf = SSmapping.get_turf_below(turf_source)
	var/list/listeners = list()
	listeners += SSmobs.clients_by_zlevel[source_z]
	listeners += SSmobs.dead_players_by_zlevel[source_z]
	if(above_turf && istransparentturf(above_turf))
		listeners += SSmobs.clients_by_zlevel[above_turf.z]
		listeners += SSmobs.dead_players_by_zlevel[above_turf.z]
	if(below_turf && istransparentturf(turf_source))
		listeners += SSmobs.clients_by_zlevel[below_turf.z]
		listeners += SSmobs.dead_players_by_zlevel[below_turf.z]
	for(var/mob/listening_mob as anything in listeners)
		var/distance = get_dist(listening_mob, turf_source)
		//close listener
		if(distance <= close_fire_range)
			listening_mob.playsound_local(turf_source, fire_sound, fire_sound_volume, vary_fire_sound)
		//far listener
		else if(far_fire_sound && (distance <= far_fire_range))
			listening_mob.playsound_local(turf_source, far_fire_sound, far_fire_sound_volume, vary_far_fire_sound)
