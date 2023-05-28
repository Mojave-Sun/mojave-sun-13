/obj/item/clothing/under/ms13
	fitted = NO_FEMALE_UNIFORM
	///femstatics destroyed (Also stops it going invisible when someone dosent make a thottiana version.)
	can_adjust = FALSE
	has_sensor = NO_SENSORS // For the crew computer
	random_sensor = FALSE
	sensor_mode = NO_SENSORS
	icon = 'mojave/icons/objects/clothing/clothing_world/uniforms_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/uniform.dmi'
	inhand_icon_state = null
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 64
	grid_height = 96
	///Icon file for left hand inhand overlays
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	///Icon file for right inhand overlays
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	repairable_by = /obj/item/stack/sheet/ms13/cloth
	limb_integrity = 100
	max_integrity = 300
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS

/obj/item/clothing/under/ms13/attackby(obj/item/W, mob/user, params)
	if(!istype(W, repairable_by))
		if(W.tool_behaviour == TOOL_KNIFE)
			user.show_message(span_notice("You begin shredding [src]."), MSG_VISUAL)
			if(do_after(user, 4.5 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_CLOTHSHRED))
				user.show_message(span_notice("You get cloth and thread from [src]!"), MSG_VISUAL)
				new /obj/item/stack/sheet/ms13/thread(user.loc)
				new /obj/item/stack/sheet/ms13/cloth(user.loc, 2)
				qdel(src)
		else
			return..()

	switch(damaged_clothes)
		if(CLOTHING_PRISTINE)
			return..()
		if(CLOTHING_DAMAGED)
			var/obj/item/stack/cloth_repair = W
			cloth_repair.use(1)
			repair(user, params)
			return TRUE
		if(CLOTHING_SHREDDED)
			var/obj/item/stack/cloth_repair = W
			if(cloth_repair.amount < 3)
				to_chat(user, span_warning("You require 3 [cloth_repair.name] to repair [src]."))
				return TRUE
			to_chat(user, span_notice("You begin fixing the damage to [src] with [cloth_repair]..."))
			if(!do_after(user, 3.5 SECONDS, src) || !cloth_repair.use(3))
				return TRUE
			repair(user, params)
			return TRUE

	return ..()

/obj/item/clothing/under/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/uniforms_inventory.dmi')

/obj/item/clothing/under/ms13/wasteland
	can_adjust = FALSE

// pants //

/obj/item/clothing/under/ms13/wasteland/caravanpants
	name = "caravan pants"
	desc = "A pair of pants worn by caravaneers that can't seem to afford a shirt."
	icon_state = "caravan"
	inhand_icon_state = "tribalrag"
	body_parts_covered = LEGS|GROIN
	max_integrity = 220
	grid_width = 64
	grid_height = 64

/obj/item/clothing/under/ms13/wasteland/pants
	name = "cloth pants"
	desc = "A relatively intact pair of cloth pants, grubby and dishevelled."
	icon_state = "cloth"
	inhand_icon_state = "tribalrag"
	body_parts_covered = LEGS|GROIN
	max_integrity = 220
	grid_width = 64
	grid_height = 64

/obj/item/clothing/under/ms13/wasteland/ghoulpants
	name = "tattered cloth pants"
	desc = "A barely intact pair of ancient cloth pants."
	icon_state = "ghoul"
	inhand_icon_state = "tribalrag"
	body_parts_covered = LEGS|GROIN
	max_integrity = 200
	limb_integrity = 80
	grid_width = 64
	grid_height = 64

/obj/item/clothing/under/ms13/wasteland/warboypants
	name = "leather pants"
	desc = "A hardy, somewhat intimidating pair of black leather pants. Fastened and tightened with multiple belts."
	icon_state = "warboy"
	inhand_icon_state = "petcollar"
	body_parts_covered = LEGS|GROIN
	max_integrity = 220
	grid_width = 64
	grid_height = 64

// wasteland //

/obj/item/clothing/under/ms13/wasteland/rag
	name = "rags"
	desc = "A set of rags worn by those who can't seem to find better, or like things loose."
	icon_state = "rag"
	inhand_icon_state = "tribalrag"
	body_parts_covered = CHEST|GROIN
	max_integrity = 250

/obj/item/clothing/under/ms13/wasteland/worn
	name = "worn clothes"
	desc = "A set of ragged clothes that have seen better days."
	icon_state = "worn"
	inhand_icon_state = "ro_suit"
	body_parts_covered = CHEST|GROIN|ARMS|LEG_LEFT

/obj/item/clothing/under/ms13/wasteland/doctor
	name = "wasteland doctor uniform"
	desc = "A set of identifiably dark green, ragged clothes usually worn by wasteland doctors."
	icon_state = "doctor"
	inhand_icon_state = "ro_suit"
	body_parts_covered = CHEST|GROIN|LEGS

/obj/item/clothing/under/ms13/wasteland/peasant
	name = "homemade garbs"
	desc = "A set of fully homemade garbs, post-war feudalism at its finest."
	icon_state = "peasant"
	inhand_icon_state = "syndicate-green-dark"

/obj/item/clothing/under/ms13/wasteland/cowboy
	name = "classic cowboy outfit"
	desc = "A set of clothes most often worn by 'Cowboys'. Whatever that means now a days."
	icon_state = "cowboyb"
	inhand_icon_state = "shirt"

/obj/item/clothing/under/ms13/wasteland/cowboy/grey
	name = "dark cowboy outfit"
	desc = "A dark colored cowboy outfit. Likely favored by desperados of old."
	icon_state = "cowboyg"

/obj/item/clothing/under/ms13/wasteland/cowboy/tan
	name = "tan cowboy outfit"
	desc = "A tan, bright set of cowboy clothes."
	icon_state = "cowboyt"

/obj/item/clothing/under/ms13/wasteland/manager
	name = "office worker clothes"
	desc = "A set of pre-war clothes meant to show corporate authority."
	icon_state = "manager"
	inhand_icon_state = "shirt"

/obj/item/clothing/under/ms13/wasteland/guard
	name = "guard clothes"
	desc = "A set of clothes worn by the hired muscle of the wasteland."
	icon_state = "bodyguard"
	inhand_icon_state = "shirt"

/obj/item/clothing/under/ms13/wasteland/mammoth
	name = "mammoth clothes"
	desc = "A unique pair of shirt and pants favoured by the residents of the mammoth region."
	icon_state = "mammoth"
	inhand_icon_state = "shirt"

/obj/item/clothing/under/ms13/wasteland/wanderer
	name = "wanderer clothes"
	desc = "A grubby shirt and jeans, for the roamer not held back by life."
	icon_state = "wanderer"
	inhand_icon_state = "shirt"

/obj/item/clothing/under/ms13/wasteland/rancher
	name = "ranchers clothes"
	desc = "A hard wearing set of ranching clothes, staple uniform of the brahmin barons."
	icon_state = "brahmin"
	inhand_icon_state = "shirt"

/obj/item/clothing/under/ms13/wasteland/vestslacks
	name = "vest and slacks"
	desc = "A snazzy set of clothes with a stylish black vest."
	icon_state = "vestandslacks"
	inhand_icon_state = "ro_suit"

/obj/item/clothing/under/ms13/wasteland/merchant
	name = "merchants' clothes"
	desc = "A set of clothes worn often by merchants in the wasteland."
	icon_state = "merchant"
	inhand_icon_state = "ro_suit"

/obj/item/clothing/under/ms13/wasteland/hubologist
	name = "hubologists' outfit"
	desc = "Light hubologist sect robes typically worn under a heavier main preaching robes."
	icon_state = "hubologist"
	inhand_icon_state = "ro_suit"

/obj/item/clothing/under/ms13/wasteland/caravaneer
	name = "caravaneer clothes"
	desc = "A set of clothes usually worn by caravaneers."
	icon_state = "caravaneer"
	inhand_icon_state = "redstripe"

/obj/item/clothing/under/ms13/wasteland/canaan
	name = "canaanite outfit"
	desc = "A fancy and unusual shirt and pants worn by Canaanite missionaries."
	icon_state = "canaan"
	inhand_icon_state = "greenjump"

/obj/item/clothing/under/ms13/wasteland/swatter
	name = "swatter outfit"
	desc = "A strange pre-war shirt and pants ... what could they have been from? Nobody knows."
	icon_state = "swatter"
	inhand_icon_state = "shirt"

/obj/item/clothing/under/ms13/wasteland/merca
	name = "mercenary clothes"
	desc = "A set of clothes worn by mercenaries of the wasteland."
	icon_state = "merca"
	inhand_icon_state = "syndicate-green-dark"

/obj/item/clothing/under/ms13/wasteland/machinist
	name = "machinist bodysuit"
	desc = "The work attire of a machinist."
	icon_state = "machinist"
	inhand_icon_state = "ncr_uniform"

/obj/item/clothing/under/ms13/wasteland/lumberjack
	name = "lumberjack uniform"
	desc = "The hardy work attire of a lumberjack."
	icon_state = "machinist"
	inhand_icon_state = "redstripe"

/obj/item/clothing/under/ms13/wasteland/mercc
	name = "merc veteran clothes"
	desc = "A set of clothes worn by rugged veterans of the wasteland."
	icon_state = "mercc"
	inhand_icon_state = "bluejump"

/obj/item/clothing/under/ms13/wasteland/roving
	name = "roving traders' clothes"
	desc = "A set of clothes worn often by merchants traveling around in the wasteland."
	icon_state = "roving"
	inhand_icon_state = "ro_suit"

/obj/item/clothing/under/ms13/wasteland/mechanicprewar
	can_adjust = TRUE
	alt_covers_chest = FALSE

/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgrey
	name = "grey mechanic jumpsuit"
	desc = "A grey, adjustable mechanic jumpsuit. It smells of oil."
	icon_state = "mechanic"
	inhand_icon_state = "bl_suit"

/obj/item/clothing/under/ms13/wasteland/mechanicprewar/mechanicgreen
	name = "green mechanic jumpsuit"
	desc = "A green, adjustable mechanic jumpsuit. It smells of oil"
	icon_state = "mechanicalt"
	inhand_icon_state = "g_suit"

/obj/item/clothing/under/ms13/wasteland/baron
	name = "\improper Chains of the Baron"
	desc = "A menacing metal chain harness belonging to a very specific and very powerful individual."
	icon_state = "baron"

// suits//fancy //

/obj/item/clothing/under/ms13/wasteland/heeledsuit
	name = "well-heeled gambler suit"
	desc = "Hey, theres the high-roller!"
	icon_state = "heeledsuit"
	inhand_icon_state = "det_suit"

/obj/item/clothing/under/ms13/wasteland/gentlemansuit
	name = "gentlemans' suit"
	desc = "A fancy set of gentlemanly garmets."
	icon_state = "gentlesuit"
	inhand_icon_state = "s_suit"

/obj/item/clothing/under/ms13/wasteland/gentlemansuit/classy
	name = "classy suit"
	desc = "A fancy set of classy garments."
	icon_state = "classysuit"
	inhand_icon_state = "syndicate-green-dark"

/obj/item/clothing/under/ms13/wasteland/gentlemansuit/vintage
	name = "formal suit"
	desc = "A fancy formal suit for special occasions."
	icon_state = "formal"
	inhand_icon_state = "ro_suit"

/obj/item/clothing/under/ms13/wasteland/barmansuit
	name = "barmans' attire"
	desc = "A fancy set of garments for the snazzy and upperclass drink mixers of the wasteland."
	icon_state = "barman"
	inhand_icon_state = "ro_suit"

// combat//government //

/obj/item/clothing/under/ms13/wasteland/police
	name = "police uniform"
	desc = "Classic uniform of pre-war police officers."
	icon_state = "retro_police"
	inhand_icon_state = "bluejump"

/obj/item/clothing/under/ms13/wasteland/navy
	name = "navy uniform"
	desc = "A tactical pre-war naval jumpsuit, how it got all the way here you dont know."
	icon_state = "navy"
	inhand_icon_state = "bluejump"

/obj/item/clothing/under/ms13/wasteland/navyofficer
	name = "navy officers uniform"
	desc = "A tactical pre-war naval officer's uniform."
	icon_state = "navyofficer"
	inhand_icon_state = "bluejump"

/obj/item/clothing/under/ms13/wasteland/army
	name = "army fatigues"
	desc = "A pre-war set of fatigues meant for off-duty personnel."
	icon_state = "army_uniform"
	inhand_icon_state = "greenjump"

/obj/item/clothing/under/ms13/wasteland/combat
	name = "combat fatigues"
	desc = "A set of tactical pre-war combat fatigues, green and deadly."
	icon_state = "combat"
	inhand_icon_state = "greenjump"

/obj/item/clothing/under/ms13/wasteland/combat/desert
	name = "desert combat fatigues"
	desc = "A set of tactical pre-war combat fatigues, this one is meant for desert operations."
	icon_state = "combat_desert"
	inhand_icon_state = "ncr_uniform"

// vault-tec //

/obj/item/clothing/under/ms13/vaultsuit
	name = "vault-tec jumpsuit"
	desc = "An unmarked vault suit. How peculiar."
	icon_state = "vault"
	inhand_icon_state = "vault"

/obj/item/clothing/under/ms13/vaultsuit/seventysix
	name = "vault-76 jumpsuit"
	desc = "The classic jumpsuit of vault 76, how it ended up here is beyond you."
	icon_state = "vault76"

/obj/item/clothing/under/ms13/regal
	name = "regal oversuit"
	desc = "Not something you'd often see in the wasteland, with the finest of seam work. In the collar you see an extremely faded sticker, it's labeled: '$50'"
	icon_state = "regal"
	inhand_icon_state = "regal"

// pre-war // other //

/obj/item/clothing/under/ms13/wasteland/prewar/relaxedwear
	name = "pre-war relaxed wear"
	desc = "A set of pristine, comfortable clothes from before the great war."
	icon_state = "relaxedwear"
	inhand_icon_state = "sl_suit"

/obj/item/clothing/under/ms13/wasteland/prewar/spring
	name = "pre-war spring wear"
	desc = "A set of pristine spring clothes from before the great war."
	icon_state = "spring"
	inhand_icon_state = "sl_suit"

/obj/item/clothing/under/ms13/prewar/checkeredred
	name = "red checkered shirt"
	desc = "A shirt with a red checker pattern."
	icon_state = "checkred"
	inhand_icon_state = "plaid_r"

/obj/item/clothing/under/ms13/wasteland/checkeredgreen
	name = "green checkered shirt"
	desc = "A shirt with a green checker pattern."
	icon_state = "checkgreen"
	inhand_icon_state = "plaid_g"

/obj/item/clothing/under/ms13/wasteland/checkeredblue
	name = "blue checkered shirt"
	desc = "A shirt with a blue checkered pattern."
	icon_state = "checkblue"
	inhand_icon_state = "plaid_b"

/obj/item/clothing/under/ms13/wasteland/stripered
	name = "red striped shirt"
	desc = "A red shirt with columns of white stripes."
	icon_state = "stripered"
	inhand_icon_state = "plaid_r"

/obj/item/clothing/under/ms13/wasteland/stripeblue
	name = "blue striped shirt"
	desc = "A blue shirt with columns of white stripes."
	icon_state = "stripeblue"
	inhand_icon_state = "plaid_b"

/obj/item/clothing/under/ms13/wasteland/brownvest
	name = "brown vest"
	desc = "A pristine brown vest from before the great war."
	icon_state = "vestbrown"
	inhand_icon_state = "lb_suit"

/obj/item/clothing/under/ms13/wasteland/burgundyvest
	name = "burgundy vest"
	desc = "A pristine burgundy vest from before the great war."
	icon_state = "vestburgundy"
	inhand_icon_state = "brownjsuit"

/obj/item/clothing/under/ms13/wasteland/whiteshirt
	name = "white shirt"
	desc = "A plain white shirt and slacks."
	icon_state = "shirt"
	inhand_icon_state = "bar_suit"

// Drylander //

/obj/item/clothing/under/ms13/drylander
	name = "\improper Drylander tunic"
	desc = "Very light tunic and pants worn by the Drylander tribe. Meant to be worn under robes."
	icon_state = "drylander"
