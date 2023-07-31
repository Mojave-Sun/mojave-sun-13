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

/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter/ready(forced = FALSE)
	if (required_candidates > (dead_players.len + list_observers.len))
		return FALSE
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
			for(var/mob/potential_target in GLOB.human_list)
				if((potential_target?.mind?.assigned_role == targetted_job) && (potential_target.stat != DEAD))
					potential_enemies += potential_target
					break
	if(potential_enemies.len)
		return TRUE
	return FALSE

/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter/finish_setup(mob/new_character, index)
	..()
	new_character.forceMove(pick(GLOB.bountyhunterstart))
