//A place where patroling mobs are spawned at and told to move around
/obj/structure/mob_camp
	var/mob/mob_to_spawn = /mob/living/simple_animal/hostile/retaliate/ms13/robot/eyebot
	var/max_mobs_spawned = 6
	var/spawn_cooldown = 0.5 SECONDS
	var/ratio_of_roamers_defenders = 0.5
	var/existing_defenders = 0
	var/existing_roamers = 0
	COOLDOWN_DECLARE(delayed_spawning)
	icon = 'icons/obj/structures.dmi'
	icon_state = "grille"
	base_icon_state = "grille"

/obj/structure/mob_camp/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/structure/mob_camp/process(delta_time)
	if(COOLDOWN_FINISHED(src, delayed_spawning) && (existing_defenders + existing_roamers < max_mobs_spawned))
		COOLDOWN_START(src, delayed_spawning, spawn_cooldown)
		var/mob/the_mob = new mob_to_spawn(loc)
		//Prioritize making defenders first then roamers
		if(existing_defenders < (max_mobs_spawned * ratio_of_roamers_defenders))
			the_mob.RemoveElement(/datum/element/generic_patrol_animal)
			existing_defenders++
			the_mob.AddElement(/datum/element/generic_patrol_animal, _animal_node_weights = list(NODE_LAST_VISITED = -1, DUNGEON_AREA = INFINITY), _animal_identifier = IDENTIFIER_EYEBOT, _patrol_move_delay = 6)

		else
			if(existing_roamers < (max_mobs_spawned * ratio_of_roamers_defenders))
				the_mob.RemoveElement(/datum/element/generic_patrol_animal)
				existing_roamers++
				the_mob.AddElement(/datum/element/generic_patrol_animal, _animal_node_weights = list(NODE_LAST_VISITED = 1, DUNGEON_AREA = -INFINITY), _animal_identifier = IDENTIFIER_EYEBOT, _patrol_move_delay = 6)
