///MOJAVE SUN CHEM BASE FILE/TEMP STORAGE///

/datum/reagent/ms13
	name = "generic MS13 chem"
	description = "Don't breathe this in."
	color = "#42330a"
	taste_description = "burning chemical taste"
	overdose_threshold = 1

/datum/reagent/consumable/ms13/water // When you code it
	name = "water"
	description = "Water. The base of all life. Don't run out."
	color = "#f1eeeca1"
	quality = DRINK_VERYGOOD
	taste_description = "water"
	glass_name = "glass of clear liquid"
	glass_desc = "A clear liquid with no smell. Nothing out of the ordinary."

/datum/reagent/consumable/ms13/unfiltered_water
	name = "Unfiltered Water"
	description = "Water... Questionable water. Should run it through some filtering or something."
	color = "#d8d3cfa1"
	taste_description = "water with an off taste"
	glass_name = "glass of clear liquid"
	glass_desc = "A clear liquid with some stray particles seen floating around peacefully inside."

/datum/reagent/consumable/ms13/dirty_water
	name = "Dirty Water"
	description = "An ubiquitous chemical substance that is composed of hydrogen and oxygen, this one is impure and toxic to drink."
	color = "#4439288c"
	taste_description = "vile water"
	glass_name = "glass of murky liquid"
	glass_desc = "A murky green liquid with a pungeant vile smell. Not so sure about this one."

/datum/reagent/consumable/ms13/dirty_water/on_mob_life(mob/living/carbon/M)
	M.adjust_disgust(10)
	if(prob(50))
		M.adjustToxLoss(5)

	if(prob(10))
		M.vomit(lost_nutrition = 25, distance = 1, purge_ratio = 0.2)
	..()
