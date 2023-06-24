// MOJAVE SUN MODIFIERS STORAGE //

//Nicotine Do_After speed

#define ALL_CIG list(/datum/actionspeed_modifier/one_cig, /datum/actionspeed_modifier/two_cig, /datum/actionspeed_modifier/three_cig, /datum/actionspeed_modifier/after_one_cig, /datum/actionspeed_modifier/after_two_cig, /datum/actionspeed_modifier/after_three_cig)
#define ALL_BUT_ONE_CIG list(/datum/actionspeed_modifier/two_cig, /datum/actionspeed_modifier/three_cig, /datum/actionspeed_modifier/after_one_cig, /datum/actionspeed_modifier/after_two_cig, /datum/actionspeed_modifier/after_three_cig)
#define ALL_BUT_TWO_CIG list(/datum/actionspeed_modifier/one_cig, /datum/actionspeed_modifier/three_cig, /datum/actionspeed_modifier/after_one_cig, /datum/actionspeed_modifier/after_two_cig, /datum/actionspeed_modifier/after_three_cig)
#define ALL_BUT_THREE_CIG list(/datum/actionspeed_modifier/one_cig, /datum/actionspeed_modifier/two_cig, /datum/actionspeed_modifier/after_one_cig, /datum/actionspeed_modifier/after_two_cig, /datum/actionspeed_modifier/after_three_cig)
#define ALL_BUT_ONE_AFTER_CIG list(/datum/actionspeed_modifier/one_cig, /datum/actionspeed_modifier/two_cig, /datum/actionspeed_modifier/three_cig, /datum/actionspeed_modifier/after_two_cig, /datum/actionspeed_modifier/after_three_cig)
#define ALL_BUT_TWO_AFTER_CIG list(/datum/actionspeed_modifier/one_cig, /datum/actionspeed_modifier/two_cig, /datum/actionspeed_modifier/three_cig, /datum/actionspeed_modifier/after_one_cig, /datum/actionspeed_modifier/after_three_cig)
#define ALL_BUT_THREE_AFTER_CIG list(/datum/actionspeed_modifier/one_cig, /datum/actionspeed_modifier/two_cig, /datum/actionspeed_modifier/three_cig, /datum/actionspeed_modifier/after_one_cig, /datum/actionspeed_modifier/after_two_cig)
#define CIGARETTE_GOOD "nicotine_comeup"
#define CIGARETTE_BAD "nicotine_comedown"

/datum/actionspeed_modifier/one_cig
	multiplicative_slowdown = -0.1
	id = CIGARETTE_GOOD

/datum/actionspeed_modifier/two_cig
	multiplicative_slowdown = -0.2
	id = CIGARETTE_GOOD

/datum/actionspeed_modifier/three_cig
	multiplicative_slowdown = -0.3
	id = CIGARETTE_GOOD

/datum/actionspeed_modifier/after_one_cig
	multiplicative_slowdown = 0.1
	id = CIGARETTE_BAD

/datum/actionspeed_modifier/after_two_cig
	multiplicative_slowdown = 0.2
	id = CIGARETTE_BAD

/datum/actionspeed_modifier/after_three_cig
	multiplicative_slowdown = 0.3
	id = CIGARETTE_BAD
