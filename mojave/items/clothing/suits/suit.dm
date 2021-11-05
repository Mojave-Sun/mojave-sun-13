/obj/item/clothing/suit/ms13
	name = "generic ms13 suit"
	desc = "You shouldn't be seeing this. It do be lookin' kinda clean doe."
	icon = 'mojave/icons/objects/clothing/clothing_world/suits_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	body_parts_covered = CHEST|ARMS|LEGS|GROIN
	///Icon file for left inhand overlays
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	///Icon file for right inhand overlays
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'

/obj/item/clothing/suit/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/clothing/clothing_inventory/suits_inventory.dmi')

/obj/item/clothing/suit/toggle/ms13
	name = "generic ms13 toggleable"
	desc = "Don't look. Don't look. NIGHTMARE NIGHTMARE NIGHTMARE."
	icon_state = "winterjacketorange"
	inhand_icon_state = "winter"
	icon = 'mojave/icons/objects/clothing/clothing_world/suits_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	body_parts_covered = CHEST|ARMS|LEGS|GROIN
	///Icon file for left inhand overlays
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	///Icon file for right inhand overlays
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'

/obj/item/clothing/suit/toggle/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/clothing/clothing_inventory/suits_inventory.dmi')

// wasteland //

/obj/item/clothing/suit/ms13/vest
	name = "leather vest"
	desc = "A vest made of tanned leather."
	icon_state = "leather_vest"
	inhand_icon_state = "duster"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/vest/brown
	name = "brown vest"
	desc = "A brown vest, commonly worn by wannabe cowboys and prospectors."
	icon_state = "brown_vest"
	inhand_icon_state = "bos_jumpsuit"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/vest/black
	name = "black vest"
	desc = "A black, fancy looking vest."
	icon_state = "black_vest"
	inhand_icon_state = "bos_jumpsuit_o"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/toga
	name = "sheet wrap"
	desc = "The most basic form of clothing one can wear, a single sheet wrapped for modesty and decency."
	icon_state = "toga"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/shawl
	name = "leather shawl"
	desc = "A well worn but somewhat protective leather shawl."
	icon_state = "shawl"
	inhand_icon_state = "duster"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/ljacket
	name = "leather jacket"
	desc = "A typical leather jacket. Nothing too special about it."
	icon_state = "leatherjacket"
	inhand_icon_state = "leatherjacket"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/veteran_coat
	name = "merc veteran coat"
	desc = "A blue padded coat adorned with war medals. Common attire for mercenaries."
	icon_state = "veteran_coat"
	inhand_icon_state = "leatherjacket"
	armor = list(melee = 15, bullet = 20, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/veteran_coat/reinf
	name = "reinforced veteran coat"
	desc = "A blue padded coat with additional leather and crude metal reinforcements, as well as some ballistic weave. Common attire for hardened, dangerous mercenaries."
	icon_state = "reinf_veteran_coat"
	armor = list("melee" = 20, "bullet" = 35, "laser" = 15, "energy" = 10, "bomb" = 20, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/ms13/ljacket/reinforced
	name = "reinforced leather jacket"
	desc = "An atypical leather jacket reinforced with extra leather padding to make it into an actual makeshift suit of armor."
	icon_state = "reinfljacket"
	inhand_icon_state = "reinforcedjacket"
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 10, bomb = 15, bio = 10, rad = 10, fire = 10, acid = 10, wound = 0)

// winter jackets //

/obj/item/clothing/suit/toggle/ms13/wjacket/orange
	name = "orange winter jacket"
	desc = "A plain orange winter jacket. Nice and warm."
	icon_state = "winterjacketorange"
	inhand_icon_state = "winter"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/toggle/ms13/wjacket/orange/reinforced
	name = "reinforced orange jacket"
	desc = "A reinforced and padded orange winter jacket."
	icon_state = "reinforcedwinterorange"
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 10, bomb = 15, bio = 10, rad = 10, fire = 10, acid = 10, wound = 0)

/obj/item/clothing/suit/toggle/ms13/wjacket/orange/armored
	name = "armored orange jacket"
	desc = "An armored and heavily reinforced orange winter jacket."
	icon_state = "armoredwinterorange"
	armor = list(melee = 40, bullet = 35, laser = 30, energy = 20, bomb = 30, bio = 10, rad = 10, fire = 25, acid = 10, wound = 5)

/obj/item/clothing/suit/toggle/ms13/wjacket/brown
	name = "brown winter jacket"
	desc = "A very plain brown winter jacket. Nice and warm."
	icon_state = "winterjacketbrown"
	inhand_icon_state = "winter"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/toggle/ms13/wjacket/brown/reinforced
	name = "reinforced brown jacket"
	desc = "A reinforced and padded brown winter jacket."
	icon_state = "reinforcedwinterbrown"
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 10, bomb = 15, bio = 10, rad = 10, fire = 10, acid = 10, wound = 0)

/obj/item/clothing/suit/toggle/ms13/wjacket/brown/armored
	name = "armored brown jacket"
	desc = "An armored and heavily reinforced brown winter jacket."
	icon_state = "armoredwinterbrown"
	armor = list(melee = 40, bullet = 35, laser = 30, energy = 20, bomb = 30, bio = 10, rad = 10, fire = 25, acid = 10, wound = 5)

/obj/item/clothing/suit/toggle/ms13/wjacket/blue
	name = "blue winter jacket"
	desc = "A blue winter jacket."
	icon_state = "winterjacketblue"
	inhand_icon_state = "winter"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/toggle/ms13/wjacket/blue/reinforced
	name = "reinforced blue winter jacket"
	desc = "A reinforced and padded blue winter jacket."
	icon_state = "reinforcedwinterblue"
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 10, bomb = 15, bio = 10, rad = 10, fire = 10, acid = 10, wound = 0)

/obj/item/clothing/suit/toggle/ms13/wjacket/blue/armored
	name = "armored blue winter jacket"
	desc = "An armored and heavily reinforced blue winter jacket."
	icon_state = "armoredwinterblue"
	armor = list(melee = 40, bullet = 35, laser = 30, energy = 20, bomb = 30, bio = 10, rad = 10, fire = 25, acid = 10, wound = 5)

/obj/item/clothing/suit/toggle/ms13/wjacket/black
	name = "black winter jacket"
	desc = "A dark, black winter jacket."
	icon_state = "winterjacketblack"
	inhand_icon_state = "winter"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/toggle/ms13/wjacket/black/reinforced
	name = "reinforced black winter jacket"
	desc = "A reinforced and padded black winter jacket."
	icon_state = "reinforcedwinterblack"
	inhand_icon_state = "reinforcedwinterblack"
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 10, bomb = 15, bio = 10, rad = 10, fire = 10, acid = 10, wound = 0)

/obj/item/clothing/suit/toggle/ms13/wjacket/black/armored
	name = "armored black winter jacket"
	desc = "An armored and heavily reinforced black winter jacket."
	icon_state = "armoredwinterblack"
	inhand_icon_state = "armoredwinterblack"
	armor = list(melee = 40, bullet = 35, laser = 30, energy = 20, bomb = 30, bio = 10, rad = 10, fire = 25, acid = 10, wound = 5)

// jackets //

/obj/item/clothing/suit/ms13/ljacket/moleskin
	name = "moleskin jacket"
	desc = "A durable moleskin jacket."
	icon_state = "moleskinjacket"
	inhand_icon_state = "duster"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/ljacket/wanderer
	name = "wanderer jacket"
	desc = "An old, worn jacket that has no doubt seen it's fair share of places."
	icon_state = "wanderer"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/ljacket/military
	name = "military jacket"
	desc = "An old school military jacket."
	icon_state = "militaryjacket"
	inhand_icon_state = "greenjump"
	armor = list(melee = 15, bullet = 20, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/ljacket/musty
	name = "musty jacket"
	desc = "A musty, old jacket full of holes. Will barely protect from much of anything."
	icon_state = "mustyjacket"
	inhand_icon_state = "duster"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/ljacket/biker
	name = "biker jacket"
	desc = "A classic tough and durable leather jacket, for riding the highways in badass style."
	icon_state = "bikerjacket"
	inhand_icon_state = "leatherjacket"
	armor = list(melee = 30, bullet = 10, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/vest/letterman
	name = "letterman jacket"
	desc = "A high school letterman jacket. For showing off your achievements in the post apocalypse."
	icon_state = "letterman"
	inhand_icon_state = "shirt"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/ljacket/bomber
	name = "bomber jacket"
	desc = "A fur-lined bomber jacket. Warm and stylish."
	icon_state = "bomberjacket"

// trenchcoats //

/obj/item/clothing/suit/ms13/trench
	name = "padded tan trenchcoat"
	desc = "A heavy, padded tan trenchcoat."
	icon_state = "tantrench"
	inhand_icon_state = "duster"
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 10, bomb = 15, bio = 10, rad = 10, fire = 10, acid = 10, wound = 0)

/obj/item/clothing/suit/ms13/trench/detective
	name = "detective's trenchcoat"
	desc = "A trenchcoat normally worn by pre-war detectives."
	icon_state = "detective"
	armor = list(melee = 15, bullet = 20, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/trench/brown
	name = "brown overcoat"
	desc = "A slightly dirty brown overcoat."
	icon_state = "brownover"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/trench/black
	name = "padded black trenchcoat"
	desc = "An imposing, padded black trenchcoat."
	icon_state = "blacktrench"
	inhand_icon_state = "leatherjacket"
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 10, bomb = 15, bio = 10, rad = 10, fire = 10, acid = 10, wound = 0)

/obj/item/clothing/suit/ms13/trench/black/bruiser
	name = "bruiser trenchcoat"
	desc = "A beefy black trenchcoat."
	icon_state = "bruiser"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/trench/black/reinf
	name = "reinforced black trenchcoat"
	desc = "A black trenchcoat with the addition of some reinforcements and armor for added protection."
	icon_state = "reinfblacktrench"
	armor = list(melee = 40, bullet = 35, laser = 30, energy = 20, bomb = 30, bio = 10, rad = 10, fire = 25, acid = 10, wound = 5)

/obj/item/clothing/suit/ms13/trench/black/armored
	name = "armored black trenchcoat"
	desc = "A heavily armored black trenchcoat that is a near perfect balance between maximum style and maximum protection."
	icon_state = "armorblacktrench"
	armor = list(melee = 50, bullet = 40, laser = 35, energy = 25, bomb = 40, bio = 20, rad = 20, fire = 50, acid = 20, wound = 10)

/obj/item/clothing/suit/ms13/trench/battle
	name = "battle trenchcoat"
	desc = "A trenchcoat with extra padding and lined with fur for extra style. Perfect for a mix of battle ready and charming."
	icon_state = "battlecoat"
	inhand_icon_state = "battlecoat"
	armor = list(melee = 35, bullet = 25, laser = 10, energy = 10, bomb = 20, bio = 10, rad = 10, fire = 10, acid = 10)

// dusters //

/obj/item/clothing/suit/ms13/duster
	name = "duster"
	desc = "A typical leather duster."
	icon_state = "duster"
	inhand_icon_state = "duster"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/suit/ms13/duster/reinforced
	name = "reinforced duster"
	desc = "A duster with added leather and padding for some more protection."
	icon_state = "reinfduster"
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 10, bomb = 15, bio = 10, rad = 10, fire = 10, acid = 10, wound = 0)

/obj/item/clothing/suit/ms13/duster/reinforced/ranger
	name = "\improper Desert Ranger duster"
	desc = "A closed, padded duster used by the Desert Rangers. Commonly worn by fresh recruits and off-duty Rangers."
	icon_state = "closed_duster"

// labcoats //

/obj/item/clothing/suit/toggle/labcoat/ms13
	name = "doctor's coat"
	desc = "The medical coat of a typical wasteland doctor."
	icon = 'mojave/icons/objects/clothing/clothing_world/suits_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	icon_state = "followers"
	inhand_icon_state = "shirt"
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 15, rad = 15, fire = 15, acid = 15)
	body_parts_covered = CHEST|ARMS|LEGS|GROIN
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/scalpel,/obj/item/surgical_drapes,/obj/item/cautery,/obj/item/hemostat,/obj/item/retractor,/obj/item/storage/dice,/obj/item/dice)

/obj/item/clothing/suit/ms13/vaultlab
	name = "vault lab coat"
	desc = "A lab coat often worn by Vault doctors. Good for protecting your precious undersuit from rapid blood ejection from your patients."
	icon_state = "vaultlabcoat"
	inhand_icon_state = "shirt"

// other //

/obj/item/clothing/suit/apron/waders/ms13
	name = "leather waders"
	desc = "A pair of heavy duty leather waders, they've seen better days."
	icon_state = "hort_waders"
	inhand_icon_state = "hort_waders"
	body_parts_covered = CHEST|GROIN|LEGS
	permeability_coefficient = 0.5

/obj/item/clothing/suit/hooded/ms13/hubologist
	name = "hubologist robes"
	desc = "Long, dark, and imposing padded robes worn by Hubologists."
	icon_state = "hubologist"
	inhand_icon_state = "hostrench"
	armor = list("melee" = 25, "bullet" = 20, "laser" = 10, "energy" = 5, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	hoodtype = /obj/item/clothing/head/hooded/ms13/hubologist

/obj/item/clothing/suit/ms13/manny
	name = "\improper Manny Mammoth suit"
	desc = "A perfectly preserved pre-war VINTAGE Manny Mammoth suit! It smells of crusty pizza."
	icon_state = "mannybody"
	inhand_icon_state = "mannyhead"
