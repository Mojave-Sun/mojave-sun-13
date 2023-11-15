///MOJAVE SUN CHEM BASE FILE/TEMP STORAGE///

/datum/reagent/ms13
	name = "generic MS13 chem"
	description = "Don't breathe this in."
	color = "#42330a"
	taste_description = "burning chemical taste"

/datum/reagent/consumable/ms13
	name = "Generic MS13 yummy liquid"
	description = "Yeah probably skip out on this one chief."
	color = "#7c7b7a"
	quality = DRINK_NICE
	glass_name = "glass of liquid" // Keep these generic for flavour!
	glass_desc = "A pale coloured liquid. It screams 'PAIN'." // Same with this. Keep people guessin'. Make em know the drink via flavour and look for immersion.
	glass_icon_state = null // None of this dumb nonsense. Glasses don't just morph based on liquid!
	hydration_amount = 10 //get a real liquid

/datum/reagent/consumable/ms13/on_mob_life(mob/living/drinker)
	var/adjust_amount = hydration_amount * REM
	SEND_SIGNAL(drinker, THIRST_METABOLISE, adjust_amount)
	to_chat(drinker, span_notice("on_mob_life"))
	return ..()

/datum/reagent/consumable/ms13/cola
	name = "Generic MS13 Cola"
	description = "Tasty, but buggy"
	color = "#413022"
	quality = DRINK_NICE
	glass_name = "glass of liquid"
	glass_desc = "A dark coloured liquid. It screams 'BUGS'."
	hydration_amount = 55 //Cola is nice
