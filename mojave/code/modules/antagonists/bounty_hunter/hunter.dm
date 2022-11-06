/datum/antagonist/bounty_hunter
	name = "\improper Bounty Hunter"
	roundend_category = "bounty hunters"
	antagpanel_category = "Bounty Hunter"
	job_rank = ROLE_FUGITIVE_HUNTER
	antag_hud_name = "fugitive_hunter"
	antag_moodlet = /datum/mood_event/focused
	hijack_speed = 0
	//ui_name = "AntagInfoBountyHunter"
	suicide_cry = ""
	preview_outfit = /datum/outfit/job/ms13/wasteland/bountyhunter
	show_to_ghosts = TRUE

/datum/antagonist/bounty_hunter/on_gain()
	forge_objectives()
	. = ..()

/datum/antagonist/bounty_hunter/proc/forge_objectives() //this isn't an actual objective because it's about round end rosters
	var/datum/objective/assassinate/bounty/objective = new /datum/objective/assassinate/bounty
	objective.owner = owner
	objective.explanation_text = "There's evidence that your bounty is currently residing in this part of the wasteland, ensure that they're dead."
	objectives += objective
	var/datum/objective/survive/survive = new /datum/objective/survive
	survive.owner = owner
	survive.explanation_text = "Ideally you want to survive if you wish to inform your client that the bounty is in fact dead."

/datum/antagonist/bounty_hunter/greet()
	to_chat(owner, span_boldannounce("You are not an antagonist in that you may kill whomever you please, but you can do anything to ensure the capture and killing of the bounty."))
	owner.announce_objectives()

//More special kind of find_target(), the target is more likely to be someone that has a job with a very low amount of total positions
/datum/objective/assassinate/bounty

/datum/objective/assassinate/bounty/find_target(dupe_search_range, blacklist)
