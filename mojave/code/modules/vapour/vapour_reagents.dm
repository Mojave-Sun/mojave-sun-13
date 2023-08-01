/datum/reagent
	///How good of an accelerant is this reagent
	var/accelerant_quality = 0

/datum/reagents/proc/get_total_accelerant_quality() //could be used in the future for molotovs/flamers/etc
	var/quality = 0
	for(var/datum/reagent/reagent as anything in reagent_list)
		quality += reagent.volume * reagent.accelerant_quality
	return quality
