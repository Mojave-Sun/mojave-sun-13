/// Fattens the target
/datum/smite/fat
	name = "Fatten up"

/datum/smite/fat/effect(client/user, mob/living/target)
	. = ..()
	target.set_nutrition(NUTRITION_LEVEL_FAT * 2)
	// MOJAVE EDIT BEGIN - Fatties
	target.fatness = FATNESS_OBESE
	target.update_body()
	target.dropItemToGround(target.get_item_by_slot(ITEM_SLOT_OCLOTHING))
	// MOJAVE EDIT END - Fatties
