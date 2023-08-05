/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter
	name = "Bounty Hunter"
	//midround_ruleset_style = MIDROUND_RULESET_STYLE_LIGHT
	antag_datum = /datum/antagonist/bounty_hunter
	antag_flag = ROLE_BOUNTY_HUNTER_MIDROUND
	//antag_flag_override = ROLE_BOUNTY_HUNTER
	enemy_roles = list()
	required_enemies = list(1,1,1,1,1,1,1,1,1,1)
	required_candidates = 1
	weight = 1
	cost = 10
	requirements = list(10,10,10,10,10,10,10,10,10,10)
	repeatable = TRUE
	flags = HIGH_IMPACT_RULESET

/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter/acceptable(population = 0, threat = 0)
	if (required_candidates > GLOB.alive_player_list.len)
		to_chat(world, "Cancelled; not enough players??")
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter/ready(forced = FALSE)
	if (required_candidates > (dead_players.len + list_observers.len))
		to_chat(world, "Cancelled; not enough candidates")
		return FALSE
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter/execute()
	if(GLOB.bountyhunterstart.len == 0)
		log_admin("Cannot accept Bounty Hunter ruleset. Couldn't find any bounty hunter spawn points.")
		message_admins("Cannot accept Bounty Hunter ruleset. Couldn't find any bounty hunter spawn points.")
		return FALSE
	var/list/potential_job_targets = list()
	var/datum/job/targetted_job
	var/list/potential_enemies = list()
	for(var/datum/job/key in SSjob.joinable_occupations.Copy())
		potential_job_targets[key] = 1 / key.total_positions //Meta-target the high rankers

	while(length(potential_job_targets))
		targetted_job = pick_weight(potential_job_targets)
		potential_job_targets -= targetted_job
		to_chat(world, "randomly picked [targetted_job]")
		for(var/mob/potential_target in GLOB.human_list)
			to_chat(world, "looking at [potential_target]")
			if((potential_target?.mind?.assigned_role == targetted_job) && (potential_target.stat != DEAD))
				to_chat(world, "[potential_target] is valid")
				potential_enemies += potential_target
				break
	if(potential_enemies.len)
		to_chat(world, "potential enemies: [json_encode(potential_enemies)]")
		return TRUE
	return FALSE

/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter/finish_setup(mob/new_character, index)
	..()
	new_character.forceMove(pick(GLOB.bountyhunterstart))
