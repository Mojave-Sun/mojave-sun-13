/datum/job/ms13/drylander
	selection_color = "#412d09"
	departments_list = list(
		/datum/job_department/drylander,
	)
	forbid = "The tribe forbids: Betrayal of the tribe."
	enforce = "The tribe expects: Adhering to traditional Drylander attire. Only using traditional Drylander weaponry unless the very existence of the tribe or yourself is under grave threat."

/datum/outfit/job/ms13/drylander
	name = "Default"
	jobtype = /datum/job/ms13/drylander

	uniform =    /obj/item/clothing/under/ms13/drylander
	shoes =      /obj/item/clothing/shoes/ms13/drylander
	gloves =     /obj/item/clothing/gloves/ms13/drylander

/datum/outfit/job/ms13/drylander/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/drylander/config_check()
	if(type == /datum/job/ms13/drylander)
		return FALSE
	return ..()

/datum/job/ms13/drylander/map_check()
	if(type == /datum/job/ms13/drylander)
		return FALSE
	return ..()

/datum/job/ms13/drylander/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	if(!ishuman(spawned))
		return
	spawned.apply_pref_name(/datum/preference/name/drylander_name, player_client)
