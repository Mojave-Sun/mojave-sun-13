/datum/job/ms13/ncr
	selection_color = "#cfd1ba"
	exp_type = EXP_TYPE_NCR
	forbid = "The NCR forbids: Recreational drugs(barring med-X), Drinking or Gambling on duty,, disobeying lawful orders and desertion. CO determines who is off-duty."
	enforce = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republics laws. Wearing the uniform. Radiomen found to be abusing their radio will be delimbed and then shot."

/datum/outfit/job/ms13/ncr
	name = "NCRDatums"
	jobtype = /datum/job/ms13/ncr/
	back = /obj/item/storage/ms13/ncr
	shoes = /obj/item/clothing/shoes/ms13/military/ncr
	uniform = /obj/item/clothing/under/ms13/ncr/fatigues
	gloves = /obj/item/clothing/gloves/ms13/ncr

/datum/outfit/job/ms13/ncr/pre_equip(mob/living/carbon/human/H)
	..()

//These are base jobs, we don't want them appearing at all
/datum/job/ms13/ncr/config_check()
	if(type == /datum/job/ms13/ncr)
		return FALSE
	return ..()

/datum/job/ms13/ncr/map_check()
	if(type == /datum/job/ms13/ncr)
		return FALSE
	return ..()
