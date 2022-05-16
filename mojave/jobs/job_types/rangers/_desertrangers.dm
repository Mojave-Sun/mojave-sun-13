/datum/job/ms13/ranger
	selection_color = "#bdbc76"
	departments_list = list(
		/datum/job_department/rangers,
	)
	exp_granted_type = EXP_TYPE_RANGERS
	exp_required_type = EXP_TYPE_RANGERS
	forbid = "The Desert Rangers forbid hostility towards the innocent, Inebriation on duty, and excessive cruelty."
	enforce = "The Desert Rangers stand for the public and defend those who can not defend themselves. Protect the needy and help them as situations arise."

/datum/outfit/job/ms13/ranger
	name = "RangerDatums"
	jobtype = /datum/job/ms13/ranger/
	shoes = /obj/item/clothing/shoes/ms13/explorer

/datum/outfit/job/ms13/ranger/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/ranger/config_check()
	if(type == /datum/job/ms13/ranger)
		return FALSE
	return ..()

/datum/job/ms13/ranger/map_check()
	if(type == /datum/job/ms13/ranger)
		return FALSE
	return ..()
