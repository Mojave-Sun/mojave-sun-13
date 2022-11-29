/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter
	name = "Bounty Hunter"
	//midround_ruleset_style = MIDROUND_RULESET_STYLE_LIGHT
	antag_datum = /datum/antagonist/bounty_hunter
	antag_flag = ROLE_BOUNTY_HUNTER_MIDROUND
	//antag_flag_override = ROLE_BOUNTY_HUNTER
	enemy_roles = list(
		JOB_CAPTAIN,
		JOB_DETECTIVE,
		JOB_HEAD_OF_SECURITY,
		JOB_SECURITY_OFFICER,
	)
	required_enemies = list(2,2,1,1,1,1,1,0,0,0)
	required_candidates = 1
	weight = 1
	cost = 10
	requirements = list(10,10,10,10,10,10,10,10,10,10)
	repeatable = TRUE
	flags = HIGH_IMPACT_RULESET

/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter/ready(forced = FALSE)
	if (!required_candidates > (dead_players.len + list_observers.len))
		return FALSE
	if(GLOB.bountyhunterstart.len == 0)
		log_admin("Cannot accept Bounty Hunter ruleset. Couldn't find any bounty hunter spawn points.")
		message_admins("Cannot accept Bounty Hunter ruleset. Couldn't find any bounty hunter spawn points.")
		return FALSE
	var/list/potential_targets = SSjob.joinable_occupations.Copy()
	return ..()

/datum/dynamic_ruleset/midround/from_ghosts/bounty_hunter/finish_setup(mob/new_character, index)
	..()
	new_character.forceMove(pick(GLOB.bountyhunterstart))
