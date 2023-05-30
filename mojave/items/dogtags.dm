/obj/item/card/id/ms13
	name = "\improper ID tag"
	desc = "A simple identification tag. This is a base class and you shouldn't be seeing it."
	icon = 'mojave/icons/objects/identification/dogtags_inventory.dmi'
	icon_state = "bos_holotag"
	var/datum/bank_account = null

/obj/item/card/id/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.45, 1)

/obj/item/card/id/ms13/doctor
	name = "doctor's ID badge"
	desc = "A very crisp and clean medical identification badge. Even has a clip. By Wasteland standards, this is incredibly professional."
	assignment = "Town Doctor"
	icon_state = "doctor"
	access = list(ACCESS_TOWN_DOCTOR, ACCESS_TOWN_ALL)

/obj/item/card/id/ms13/doctor/nurse
	name = "nurse's ID badge"
	assignment = "Town Nurse"

/obj/item/card/id/ms13/mayor
	name = "mayor's badge"
	desc = "A gold star badge with a blue stamp in the middle, indicating this badge belongs to the Mayor."
	assignment = "Town Mayor"
	icon_state = "mayor"
	access = list(ACCESS_TOWN_MAYOR, ACCESS_TOWN_LAW, ACCESS_TOWN_DOCTOR, ACCESS_TOWN_WORKER, ACCESS_TOWN_ALL)

/obj/item/card/id/ms13/deputy
	name = "deputy's badge"
	desc = "A dull silver Deputy's badge. Classic."
	assignment = "Town Deputy"
	icon_state = "deputy"
	access = list(ACCESS_TOWN_LAW, ACCESS_TOWN_DOCTOR, ACCESS_TOWN_WORKER, ACCESS_TOWN_ALL)

/obj/item/card/id/ms13/deputy/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/ms13/sheriff))
		registered_name = stripped_input(user, "Who do you want to designate as your deputy?", , "", MAX_NAME_LEN)
		to_chat(user, "You scribble [registered_name] for the name on the badge.")
		update_label()
	return ..()

/obj/item/card/id/ms13/sheriff
	name = "sheriff's badge"
	desc = "A golden Sheriff's badge. Strikes fear into the hearts of wrongdoers."
	assignment = "Town Sheriff"
	icon_state = "sheriff"
	access = list(ACCESS_TOWN_MAYOR, ACCESS_TOWN_LAW, ACCESS_TOWN_DOCTOR, ACCESS_TOWN_WORKER, ACCESS_TOWN_ALL)

/obj/item/card/id/ms13/town
	name = "town passport"
	desc = "A fancy looking passport proving residency in the Town. Stamped by the Mayor to prove it's authenticity."
	assignment = "Town Settler"
	icon_state = "passport"
	access = list(ACCESS_TOWN_ALL)

/obj/item/card/id/ms13/town/worker
	assignment = "Town Worker"
	access = list(ACCESS_TOWN_WORKER, ACCESS_TOWN_ALL)

/obj/item/card/id/ms13/town/bartender
	assignment = "Town Bartender"

/obj/item/card/id/ms13/ncr
	name = "\improper NCR dog tags"
	desc = "Standard NCR dog tags. The assignment listed on the tag is 'Trooper' and the rank is listed as 'Private First Class'."
	icon_state = "ncrdogtag"
	assignment = "NCR Trooper"

/obj/item/card/id/ms13/ncr/recruit
	name = "\improper NCR recruit dog tags"
	desc = "Standard NCR dog tags. The assignment listed on the tag is 'Recruit' and the rank is listed as 'Private'."
	assignment = "NCR Recruit"

/obj/item/card/id/ms13/ncr/recruit/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/ms13/ncr/lieutenant))
		registered_name = stripped_input(user, "Who do you want to designate as a recruit?", , "", MAX_NAME_LEN)
		to_chat(user, "You scribble [registered_name] for the name on the dogtag.")
		update_label()
	return ..()

/obj/item/card/id/ms13/ncr/medic
	desc = "Standard NCR dog tags. The assignment listed on the tag is 'Medic' and the rank is listed as 'Specialist'."
	assignment = "NCR Medic"

/obj/item/card/id/ms13/ncr/engineer
	desc = "Standard NCR dog tags. The assignment listed on the tag is 'Engineer' and the rank is listed as 'Specialist'."
	assignment = "NCR Engineer"

/obj/item/card/id/ms13/ncr/radioman
	desc = "Standard NCR dog tags. The assignment listed on the tag is 'Radioman' and the rank is listed as 'Corporal'."
	assignment = "NCR Radioman"

/obj/item/card/id/ms13/ncr/sergeant
	desc = "Standard NCR dog tags. The assignment listed on the tag is 'Squad Leader' and the rank is listed as 'Sergeant'."
	assignment = "NCR Sergeant"

/obj/item/card/id/ms13/ncr/staff_sergeant
	desc = "Standard NCR dog tags. The assignment listed on the tag is 'Platoon Sergeant' and the rank is listed as 'Staff Sergeant'."
	assignment = "NCR Staff Sergeant"

/obj/item/card/id/ms13/ncr/lieutenant
	desc = "Standard NCR dog tags. The assignment listed on the tag is 'Platoon Commander' and the rank is listed as 'First Lieutenant'."
	assignment = "NCR Lieutenant"

/obj/item/card/id/ms13/legrecruit
	name = "recruit blade"
	desc = "A tiny, dull blade on a string. Used to identify recruits and new blood in Caesar's Legion."
	assignment = "Recruit Legionary"
	icon_state = "leg_recruit"

/obj/item/card/id/ms13/legrecruit/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/ms13/legcenturion))
		registered_name = stripped_input(user, "Who do you want to designate as a recruit?", , "", MAX_NAME_LEN)
		to_chat(user, "You scribble the [registered_name] for the name on the medallion.")
		update_label()
	return ..()

/obj/item/card/id/ms13/legrecruitdecanus
	name = "recruit decanus blade"
	desc = "A tiny, dull blade on a string. This one looks well worn, likely belonging to a Recruit Decanus."
	assignment = "Legion Recruit Decanus"
	icon_state = "leg_recruit"

/obj/item/card/id/ms13/legprime
	name = "prime medallion"
	desc = "A marked red disc stamped with the Legion's Bull insignia. Belongs to a Prime."
	icon_state = "leg_prime"
	assignment = "Prime Legionary"

/obj/item/card/id/ms13/legprime/decanus
	name = "prime decanus medallion"
	desc = "A marked red disc stamped with the Legion's Bull insignia. Belongs to a Prime Decanus."
	assignment = "Legion Prime Decanus"

/obj/item/card/id/ms13/explorer
	name = "explorer medallion"
	desc = "A marked dark colored disc stamped with the Legion's Bull insignia. Belongs to an Explorer."
	icon_state = "leg_aux"
	assignment = "Legion Explorer"

/obj/item/card/id/ms13/blacksmith
	name = "blacksmith medallion"
	desc = "A marked dark colored disc stamped with the Legion's Bull insignia. Belongs to a Legion blacksmith."
	icon_state = "leg_aux"
	assignment = "Legion Blacksmith"

/obj/item/card/id/ms13/legveteran
	name = "veteran medallion"
	desc = "A well worn silver disc stamped with the Legion's Bull insignia. Belongs to a Veteran, and reeks of iron."
	icon_state = "leg_veteran"
	assignment = "Veteran Legionary"

/obj/item/card/id/ms13/legveteran/vex
	name = "vexillarius medallion"
	desc = "A well worn silver disc stamped with the Legion's Bull insignia. Belongs to a Legion Vexillarius, and reeks of iron."
	assignment = "Legion Vexillarius"

/obj/item/card/id/ms13/legveteran/decanus
	name = "veteran decanus medallion"
	desc = "A well worn silver disc stamped with the Legion's Bull insignia. Belongs to a Veteran Decanus, and reeks of iron."
	assignment = "Legion Veteran Decanus"

/obj/item/card/id/ms13/legcenturion
	name = "centurion medallion"
	desc = "A golden disc awarded to the most fierce men in the entire Legion. If you are close enough to read the insignia you won't be alive much longer."
	icon_state = "leg_cent"
	assignment = "Legion Centurion"

/obj/item/card/id/ms13/raider
	name = "raider's necklace"
	desc = "A necklace composed of small caliber rounds. If someone's wearing this, they are no doubt a part of a raider gang."
	assignment = "Raider"
	icon_state = "raider"

/obj/item/card/id/ms13/sawbone
	name = "sawbone's necklace"
	desc = "A small blade on a string to make a necklace. The blade looks dull and slightly rusty, probably not very sanitary or sterile."
	assignment = "Raider Sawbone"
	icon_state = "sawbone"

/obj/item/card/id/ms13/enforcer
	name = "enforcer's necklace"
	desc = "A necklace consisting of a spent shotgun shell. An intimidating symbol of authority."
	assignment = "Raider Enforcer"
	icon_state = "enforcer"

/obj/item/card/id/ms13/boss
	name = "boss's necklace"
	desc = "Various bullets of various calibers on a string. Worn by someone both important and intimidating."
	assignment = "Raider Boss"
	icon_state = "boss"

/obj/item/card/id/ms13/ranger_recruit
	name = "recruit ranger badge"
	desc = "A silver Ranger star. A pretty basic design with a strong meaning behind it, given to the average recruit in the Desert Rangers."
	icon_state = "ranger_recruit"
	assignment = "Desert Ranger Recruit"

/obj/item/card/id/ms13/ranger
	name = "ranger badge"
	desc = "A gold rimmed Ranger badge with a silver star. Worn by your average Desert Ranger."
	icon_state = "ranger"
	assignment = "Desert Ranger"

/obj/item/card/id/ms13/ranger_elite
	name = "elite ranger badge"
	desc = "A solid gold Ranger star, issued to Rangers with extensive expertise in the field, with multiple years behind them."
	icon_state = "ranger_elite"
	assignment = "Elite Desert Ranger"

/obj/item/card/id/ms13/ranger_chief
	name = "ranger deputy-chief badge"
	desc = "A large, golden Ranger star. Donned exclusively by the Deputy-Chief of the local Ranger outpost."
	icon_state = "ranger_chief"
	assignment = "Desert Ranger Deputy-Chief"

/obj/item/card/id/ms13/ranger_doctor
	name = "ranger doctor ID badge"
	desc = "A very crisp and clean medical identification badge. Even has a clip. By Wasteland standards, this is incredibly professional."
	icon_state = "doctor"
	assignment = "Desert Ranger Doctor"

/obj/item/card/id/ms13/drought_denizen
	name = "\improper Barony identification papers"
	desc = "Stamped identification papers for a citizen of the Barony. This has no special assignment on it and likely belongs to a typical Denizen."
	icon_state = "drought_town"
	assignment = "Town Denizen"

/obj/item/card/id/ms13/drought_slave
	desc = "Stamped identification papers for a citizen of the Barony. This has special clearance for labor and maintenance duties included."
	assignment = "Town Laborer"
	icon_state = "drought_town"

/obj/item/card/id/ms13/drought_barkeep
	desc = "Stamped identification papers for a citizen of the Barony. This has special clearance for operation of a dining and drinking establishment within the Barony."
	assignment = "Town Barkeep"
	icon_state = "drought_town"

/obj/item/card/id/ms13/drought_doctor
	desc = "Stamped identification papers for a citizen of the Barony. This has special clearance for operation of a clinic and medical duties within the Barony."
	assignment = "Town Clinician"
	icon_state = "drought_town"
	access = list(ACCESS_BARONY_DOCTOR)

/obj/item/card/id/ms13/drought_enforcer
	name = "enforcer's golden pin"
	desc = "A gold talon pin, worn by Enforcers of the Baron. An intimidating sight."
	assignment = "Town Enforcer"
	icon_state = "drought_enforcer"
	access = list(ACCESS_BARONY_RESTRICTED, ACCESS_BARONY_DOCTOR)

/obj/item/card/id/ms13/drought_baron
	name = "\improper Baron's golden pin"
	desc = "A golden pin with a skull belonging to the Baron himself."
	icon_state = "baron"
	assignment = "Town Baron"
	access = list(ACCESS_BARONY_RESTRICTED, ACCESS_BARON_QUARTERS, ACCESS_BARONY_DOCTOR)

/obj/item/card/id/ms13/drylander
	name = "\improper Drylander blade"
	desc = "A tiny, dull blade on a string. This is used to identify members of the Drylander tribe. This belongs to literally no one."
	assignment = "drylander"
	icon_state = "leg_recruit" //placeholder

/obj/item/card/id/ms13/drylander/chief
	desc = "A tiny, dull blade on a string. This is used to identify members of the Drylander tribe. This belongs to the Chieftain."
	assignment = "Drylander Chieftain"

/obj/item/card/id/ms13/drylander/headtaker
	desc = "A tiny, dull blade on a string. This is used to identify members of the Drylander tribe. This belongs to a Headtaker."
	assignment = "Drylander Headtaker"

/obj/item/card/id/ms13/drylander/shaman
	desc = "A tiny, dull blade on a string. This is used to identify members of the Drylander tribe. This belongs to the Shaman."
	assignment = "Drylander Shaman"

/obj/item/card/id/ms13/drylander/hunter
	desc = "A tiny, dull blade on a string. This is used to identify members of the Drylander tribe. This belongs to a Hunter."
	assignment = "Drylander Hunter"

/obj/item/card/id/ms13/drylander/dryfolk
	desc = "A tiny, dull blade on a string. This is used to identify members of the Drylander tribe."
	assignment = "Drylander Folk"

// Brotherhood IDs //

/obj/item/card/id/ms13/bos
	name = "\improper BoS holotag"
	desc = "A set of dogtags, identifying the wearer as a member of the Brotherhood of Steel."
	icon_state = "bos_holotag"
	access = list(ACCESS_BROTHERHOOD)

/obj/item/card/id/ms13/bos/headpaladin
	assignment = "BoS Head Paladin"
	access = list(ACCESS_BROTHERHOOD, ACCESS_BROTHERHOOD_HPALADIN)

/obj/item/card/id/ms13/bos/paladin
	assignment = "BoS Paladin"

/obj/item/card/id/ms13/bos/knight
	assignment = "BoS Knight"

/obj/item/card/id/ms13/bos/initiate
	assignment = "BoS Initiate"

/obj/item/card/id/ms13/bos/headscribe
	assignment = "BoS Head Scribe"

/obj/item/card/id/ms13/bos/scribe
	assignment = "BoS Scribe"

// Combat Test IDs //

/obj/item/card/id/ms13/red_ganger
	name = "red gang badge"
	desc = "A silver textured gang star, issued to gangers with extensive expertise in the field, with multiple years of ganging behind them."
	icon_state = "ranger_star_rimmed"
	trim = /datum/id_trim/job/security_officer

/obj/item/card/id/ms13/blue_ganger
	name = "blue gang badge"
	desc = "A gold textured gang star, issued to gangers with extensive expertise in the field, with multiple years of ganging behind them."
	icon_state = "ranger_star"
	trim = /datum/id_trim/centcom/deathsquad
