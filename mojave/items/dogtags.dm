/* The old dogtags
* and medallions from BD.
* all have the dogtag subtype
*/

/obj/item/card/id/ms13
	name = "\improper ID tag"
	desc = "A simple identification tag. This is a base class and you shouldn't be seeing it."
	icon = 'mojave/icons/objects/dogtags.dmi'
	icon_state = "bos_holotag"
	var/datum/bank_account = null

/obj/item/card/id/ms13/deputy
	name = "deputy's badge"
	desc = "A silver badge which shows honour and dedication. Has some electronic workings sloppily attached to the back of it."
	assignment = "Deputy"
	icon_state = "deputy"

/obj/item/card/id/ms13/deputy/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/ms13/sheriff))
		registered_name = stripped_input(user, "Who do you want to designate as your deputy?", , "", MAX_NAME_LEN)
		to_chat(user, "You scribble the [registered_name] for the name on the badge.")
		update_label()
	return ..()

/obj/item/card/id/ms13/sheriff
	name = "sheriff's badge"
	desc = "A golden Sheriff's badge. Has some electronic workings sloppily attached to the back of it."
	icon_state = "sheriff"

/obj/item/card/id/ms13/ncrrecruit
	name = "recruit's tags"
	desc = "A dog tag proving enlistment in the NCR, issued to local recruits."
	assignment = "NCR Recruit"
	icon_state = "ncrdogtagtrooper"

/obj/item/card/id/ms13/ncrrecruit/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/ms13/ncrlieutenant))
		registered_name = stripped_input(user, "Who do you want to designate as a recruit?", , "", MAX_NAME_LEN)
		to_chat(user, "You scribble the [registered_name] for the name on the dogtag.")
		update_label()
	return ..()

/obj/item/card/id/ms13/ncrtrooper
	name = "\improper NCR trooper's tags"
	desc = "A dog tag proving enlistment in the NCR."
	icon_state = "ncrdogtagtrooper"
	assignment = "NCR Trooper"

/obj/item/card/id/ms13/ncrtrooper/medic
	name = "\improper NCR medic's tags"
	assignment = "NCR Medic"

/obj/item/card/id/ms13/ncrsergeant
	name = "\improper NCR sergeant's tags"
	desc = "A chevron decorated dog tag showing NCO status within the NCR."
	icon_state = "ncrdogtagsergeant"
	assignment = "NCR Sergeant"

/obj/item/card/id/ms13/ncrsergeant/staff
	name = "\improper NCR staff sergeant's tags"
	assignment = "NCR Staff Sergeant"

/obj/item/card/id/ms13/ncrlieutenant
	name = "\improper NCR lieutenant's tags"
	desc = "A silver bar dog tag that denotes a member of the NCR military with a lieutenant commission."
	icon_state = "ncrdogtagofficer"
	assignment = "NCR Lieutenant"

/obj/item/card/id/ms13/ncrcaptain
	name = "captain's tags"
	desc = "A dog tag that demands respect from all those subordinate to it. This one belongs to an NCR captain."
	icon_state = "ncrdogtagcaptain"

/obj/item/card/id/ms13/ncrranger
	name = "ranger's tags"
	desc = "A dog tag that invokes fear in those who see it. Belongs to an elite of the NCR, usually with a big iron on their hip."
	icon_state = "ncrdogtagranger"

/obj/item/card/id/ms13/legrecruit
	name = "recruit medallion"
	desc = "A silver disc stamped with the Legion's Bull insignia. Belongs to a recruit."
	assignment = "Legion Recruit"
	icon_state = "legionmedallionrecruit"


/obj/item/card/id/ms13/legrecruit/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/ms13/legcenturion))
		registered_name = stripped_input(user, "Who do you want to designate as a recruit?", , "", MAX_NAME_LEN)
		to_chat(user, "You scribble the [registered_name] for the name on the medallion.")
		update_label()
	return ..()

/obj/item/card/id/ms13/legprime
	name = "prime medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Belongs to a prime."
	icon_state = "legionmedallionprime"

/obj/item/card/id/ms13/legveteran
	name = "veteran medallion"
	desc = "A heavily marked silver disc stamped with the Legion's Bull insignia. Belongs to a veteran, and reeks of iron."
	icon_state = "legionmedallionveteran"

/obj/item/card/id/ms13/legcenturion
	name = "centurion medallion"
	desc = "A golden disc awarded to the most fierce men in the entire Legion. If you are close enough to read the insignia you won't be alive much longer."
	icon_state = "legionmedallioncent"

/obj/item/card/id/ms13/raider
	name = "raider's necklace"
	desc = "A necklace composed of random bits of teeth and bone. If someone's wearing this, they are no doubt a part of a raider gang."
	assignment = "Raider"
	icon_state = "raider"

/obj/item/card/id/ms13/sawbone
	name = "sawbone's patch"
	desc = "A nice rectangular patch with a little hole to loop a string through if you really wanted to. It's a bit bloody."
	icon_state = "sawbone"

/obj/item/card/id/ms13/enforcer
	name = "enforcer's necklace"
	desc = "A necklace composed of random bits of teeth and bone, along with bullets of varying caliber strung up. An intimidating symbol of authority."
	assignment = "Raider Enforcer"
	icon_state = "enforcer"

/obj/item/card/id/ms13/boss
	name = "boss's collar"
	desc = "A brave fashion statement. This is a seemingly non-functional bomb collar. The person wearing this must truly be an alpha."
	assignment = "Raider Boss"
	icon_state = "boss"

/obj/item/card/id/ms13/ranger_recruit
	name = "recruit ranger badge"
	desc = "A silver Ranger star. A pretty basic design with a strong meaning behind it, given to the average recruit in the Desert Rangers."
	icon_state = "ranger_star_silver"

/obj/item/card/id/ms13/ranger
	name = "ranger badge"
	desc = "A silver rimmed Ranger badge with a gold star. Worn by your average Desert Ranger."
	icon_state = "ranger_star_rimmed"

/obj/item/card/id/ms13/ranger_elite
	name = "elite ranger badge"
	desc = "A gold textured Ranger star, issued to Rangers with extensive expertise in the field, with multiple years behind them."
	icon_state = "ranger_star"

/obj/item/card/id/ms13/ranger_chief
	name = "ranger deputy-chief badge"
	desc = "A banded Ranger star, donned exclusively by the Deputy-Chief of the local Ranger outpost. "
	icon_state = "ranger_star_chief"

/obj/item/card/id/ms13/ranger_doctor
	name = "ranger medic badge"
	desc = "A silver circle encompassing a gold cross. Given to the empathetic healers of the Desert Rangers."
	icon_state = "ranger_cross"

// Brotherhood IDs //

/obj/item/card/id/ms13/bos
	name = "\improper BoS holotag"
	desc = "A set of dogtags, identifying the wearer as a member of the Brotherhood of Steel."
	icon_state = "bos_holotag"

/obj/item/card/id/ms13/bos/headpaladin
	assignment = "Head Paladin"

/obj/item/card/id/ms13/bos/paladin
	assignment = "Paladin"

/obj/item/card/id/ms13/bos/knight
	assignment = "Knight"

/obj/item/card/id/ms13/bos/initiate
	assignment = "Initiate"

/obj/item/card/id/ms13/bos/headscribe
	assignment = "Head Scribe"

/obj/item/card/id/ms13/bos/scribe
	assignment = "Scribe"

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
