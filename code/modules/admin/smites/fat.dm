/// Fattens the target
/datum/smite/fat
	name = "Fatten up"

/datum/smite/fat/effect(client/user, mob/living/target)
	. = ..()
	target.set_nutrition(NUTRITION_LEVEL_FAT * 2)
	// MOJAVE EDIT BEGIN - Fatties
	if(!iscarbon(target))
		return
	var/mob/living/carbon/carbon_target = target
	carbon_target.fatness = FATNESS_OBESE
	carbon_target.update_body()
	carbon_target.dropItemToGround(carbon_target.get_item_by_slot(ITEM_SLOT_OCLOTHING))
	// MOJAVE EDIT END - Fatties
