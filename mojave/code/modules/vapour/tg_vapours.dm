//Basic vapours from the initial port

//Generic

///Smoke coming from cigarettes and fires
/datum/vapours/smoke //and mirrors
	name = "Smoke"
	vapours_flags = VAPOUR_APPEARANCE | VAPOUR_SMELL | VAPOUR_BREATHE_ACT
	smell_intensity = 1
	descriptor = SCENT_DESC_SMELL
	scent = "smoke"

/datum/vapours/smoke/BreatheAct(mob/living/carbon/victim, amount)
	if(amount <= 60)
		return
	victim.emote("cough")

///Dust from mining drills
/datum/vapours/dust
	name = "Dust"
	vapours_flags = VAPOUR_APPEARANCE | VAPOUR_BREATHE_ACT
	thickness = 2
	color = "#ffed9c"

/datum/vapours/dust/BreatheAct(mob/living/carbon/victim, amount)
	if(amount <= 10)
		return
	if(prob(40))
		victim.losebreath += 3 //Get in your lungs real bad
		victim.emote("cough")

///Sulphur coming from igniting matches
/datum/vapours/sulphur
	name = "Sulphur"
	vapours_flags = VAPOUR_SMELL
	smell_intensity = 5 //Very pronounced smell (and good too, sniff sniff)
	descriptor = SCENT_DESC_SMELL
	scent = "sulphur"

///Organic waste and garbage makes this
/datum/vapours/decaying_waste
	name = "Decaying Waste"
	vapours_flags = VAPOUR_SMELL
	smell_intensity = 3
	descriptor = SCENT_DESC_ODOR
	scent = "decaying waste"

///Splashing blood makes a tiny bit of this
/datum/vapours/metallic_scent
	name = "Metallic Scent"
	vapours_flags = VAPOUR_SMELL
	smell_intensity = 1
	descriptor = SCENT_DESC_SMELL
	scent = "a metallic scent"

///Green goo piles and medicine chemical reactions make this
/datum/vapours/chemical_vapors
	name = "Chemical Vapors"
	vapours_flags = VAPOUR_SMELL
	smell_intensity = 1
	descriptor = SCENT_DESC_SMELL
	scent = "chemicals"

///Dangerous fires release this from the waste they're burning
/datum/vapours/carbon_air_vapour
	name = "Carbon Air Vapour"
	vapours_flags = VAPOUR_BREATHE_ACT

/datum/vapours/carbon_air_vapour/BreatheAct(mob/living/carbon/victim, amount)
	if(victim.body_position == LYING_DOWN)
		amount *= 0.35 //The victim is inhaling roughly a third when laying down
	if(amount <= 20)
		return
	victim.throw_alert_text(/atom/movable/screen/alert/text/dead, "You can barely breathe! Get out of here!", override = FALSE)
	victim.adjustOxyLoss(rand(10,30))
	victim.adjustToxLoss(1)
	if(prob(amount))
		victim.losebreath += 3
		victim.emote("gasp")


///Food related smells
/datum/vapours/food
	vapours_flags = VAPOUR_SMELL
	smell_intensity = 0.5 //Low intensity because we want to carry it farther with more amounts
	descriptor = SCENT_DESC_SMELL

/datum/vapours/food/fried_meat
	name = "Fried Meat"
	scent = "fried meat"

/datum/vapours/food/fried_bacon
	name = "Fried Bacon"
	scent = "fried bacon"

/datum/vapours/food/fried_fish
	name = "Fried Fish"
	scent = "fried fish"

/datum/vapours/food/pancakes
	name = "Pancakes"
	scent = "pancakes"

/datum/vapours/food/coffee
	name = "Coffee"
	scent = "coffee"

/datum/vapours/food/tea
	name = "Tea"
	scent = "tea"

/datum/vapours/food/chocolate
	name = "Chocolate"
	scent = "chocolate"

/datum/vapours/food/spicy_noodles
	name = "Spicy Noodles"
	scent = "spicy noodles"

///when you fuck up baking
/datum/vapours/smoke/oven_disaster
	scent = "burning food"


//VEED/Blinkerton

///minimum amount of vapour to get high
#define HOTBOX_MINIMUM 180

///From smoking weed
/datum/vapours/smoke/cannabis
	name = "Cannabis"
	smell_intensity = 2 //Stronger than the normal smoke
	scent = "cannabis"

/datum/vapours/smoke/cannabis/BreatheAct(mob/living/carbon/victim, amount)
	if(amount < HOTBOX_MINIMUM)
		return
	//HOTBOX_MINIMUM vapour = 1u
	victim.reagents.add_reagent(/datum/reagent/drug/cannabis, amount / HOTBOX_MINIMUM)

#undef HOTBOX_MINIMUM

/datum/vapours/smoke/vape
	name = "Vape Cloud"
	thickness = 2
	scent = "pleasant and soft vapour"


//Nice Smells

///Fragrances that we spray on thing to make them smell nice
/datum/vapours/fragrance
	vapours_flags = VAPOUR_SMELL
	smell_intensity = 1
	descriptor = SCENT_DESC_FRAGRANCE

/datum/vapours/fragrance/air_refresher
	name = "Air Refresher"
	scent = "a strong flowery scent"
	smell_intensity = 3

//Simple fragrances
/datum/vapours/fragrance/cologne
	name = "Cologne Water"
	scent = "cologne"

/datum/vapours/fragrance/wood
	name = "Wood Perfume"
	scent = "aging wood"

/datum/vapours/fragrance/rose
	name = "Rose Perfume"
	scent = "roses"

/datum/vapours/fragrance/jasmine
	name = "Jasmine Perfume"
	scent = "jasmine"

/datum/vapours/fragrance/mint
	name = "Mint Perfume"
	scent = "mint"

/datum/vapours/fragrance/vanilla
	name = "Vanilla Perfume"
	scent = "vanilla"

/datum/vapours/fragrance/pear
	name = "Pear Perfume"
	scent = "pear"

/datum/vapours/fragrance/strawberry
	name = "Strawberry Perfume"
	scent = "strawberries"

/datum/vapours/fragrance/cherry
	name = "Cherry Perfume"
	scent = "cherries"

/datum/vapours/fragrance/amber
	name = "Amber Perfume"
	scent = "a sweet and powdery scent"
