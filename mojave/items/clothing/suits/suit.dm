/obj/item/clothing/suit/ms13
	name = "generic ms13 suit"
	desc = "You shouldn't be seeing this. It do be lookin' kinda clean doe."
	icon = 'mojave/icons/objects/clothing/suits.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/melee,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/scalpel,/obj/item/surgical_drapes,/obj/item/cautery,/obj/item/hemostat,/obj/item/retractor,/obj/item/storage/pill_bottle/dice,/obj/item/dice)
	body_parts_covered = CHEST|ARMS|LEGS|GROIN
	///Icon file for left hand inhand overlays
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	///Icon file for right inhand overlays
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'

// wasteland //

/obj/item/clothing/suit/ms13/vest/cowboy
	name = "cowboy vest"
	desc = "A brown vest, typically worn by wannabe cowboys and prospectors."
	icon_state = "cowboybvest"
	inhand_icon_state = "bos_jumpsuit"

/obj/item/clothing/suit/ms13/vest/grey
	name = "grey vest"
	desc = "A grey, fancy looking vest."
	icon_state = "cowboygvest"
	inhand_icon_state = "bos_jumpsuit_o"

/obj/item/clothing/suit/ms13/vest
	name = "leather vest"
	desc = "A vest made of tanned leather."
	icon_state = "tanleather"
	inhand_icon_state = "duster"
	armor = list(melee = 15, bullet = 10, laser = 5, energy = 5, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)

/obj/item/clothing/suit/ms13/toga
	name = "sheet wrap"
	desc = "The most basic form of clothing one can wear, a single sheet wrapped for modesty and decency."
	icon_state = "toga"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/shawl
	name = "leather shawl"
	desc = "A hard wearing leather shawl for embracing the wastelands elements."
	icon_state = "shawl"
	inhand_icon_state = "duster"
	armor = list(melee = 15, bullet = 10, laser = 5, energy = 5, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)

/obj/item/clothing/suit/ms13/ljacket/veteran
	name = "merc veteran coat"
	desc = "A blue leather coat adorned with war medals. Commonly used by mercenaries."
	icon_state = "veteran"
	inhand_icon_state = "leatherjacket"

/obj/item/clothing/suit/ms13/ljacket/veteran/black
	desc = "A black leather coat adorned with war medals. Commonly used by mercenaries."
	icon_state = "veteranb"
	inhand_icon_state = "leatherjacket"

/obj/item/clothing/suit/ms13/ljacket
	name = "leather jacket"
	desc = "A typical leather jacket. It's pretty thick, originally designed to protect from road rash."
	icon_state = "leatherjacket"
	inhand_icon_state = "leatherjacket"
	armor = list(melee = 25, bullet = 20, laser = 5, energy = 5, bomb = 10, bio = 5, rad = 5, fire = 5, acid = 5)
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)

/obj/item/clothing/suit/ms13/ljacket/reinforced
	name = "reinforced leather jacket"
	desc = "An atypical leather jacket. Someone decided to strap more leather onto the already existing leather. A genious approach of becoming more resilient to hostile forces."
	icon_state = "reinforcedjacket"
	inhand_icon_state = "reinforcedjacket"
	armor = list(melee = 35, bullet = 25, laser = 10, energy = 5, bomb = 15, bio = 5, rad = 10, fire = 10, acid = 5)
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)

// winter jackets //

/obj/item/clothing/suit/labcoat/ms13/ljacket/orange
	name = "orange padded jacket"
	desc = "A light, plain orange winter jacket. Nice and warm."
	icon_state = "winterjacketorange"
	inhand_icon_state = "winter"
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 10)

/obj/item/clothing/suit/ms13/ljacket/orange/reinforced
	name = "reinforced orange jacket"
	desc = "A reinforced orange jacket. Kevlar. Cloth, leather? Don't know! It'll eat an impact."
	icon_state = "reinforcedwinterjacketorange"
	armor = list(melee = 25, bullet = 10, laser = 5, energy = 5, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/suit/ms13/ljacket/orange/armored
	name = "armored orange jacket"
	desc = "An armored and heavily reinforced orange winter jacket."
	icon_state = "armoredwinterjacketorange"
	armor = list(melee = 35, bullet = 25, laser = 25, energy = 25, bomb = 30, bio = 10, rad = 10, fire = 20, acid = 10)

/obj/item/clothing/suit/labcoat/ms13/ljacket/brown
	name = "brown padded jacket"
	desc = "A light, plain brown winter jacket. Nice and warm."
	icon_state = "winterjacketbrown"
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 10)

/obj/item/clothing/suit/ms13/ljacket/brown/reinforced
	name = "reinforced brown jacket"
	desc = "A reinforced brown jacket. Kevlar. Cloth, leather? Don't know! It'll eat an impact."
	icon_state = "reinforcedwinterjacketbrown"
	armor = list(melee = 25, bullet = 10, laser = 5, energy = 5, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/suit/ms13/ljacket/brown/armored
	name = "armored brown jacket"
	desc = "An armored and heavily reinforced brown winter jacket."
	icon_state = "armoredwinterjacketbrown"
	armor = list(melee = 35, bullet = 25, laser = 25, energy = 25, bomb = 30, bio = 10, rad = 10, fire = 20, acid = 10)

/obj/item/clothing/suit/labcoat/ms13/ljacket/blue
	name = "blue winter jacket"
	desc = "A light, blue winter jacket."
	icon_state = "winterjacketblue"
	inhand_icon_state = "winter"
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 10)

/obj/item/clothing/suit/ms13/ljacket/blue/reinforced
	name = "reinforced blue winter jacket"
	desc = "A reinforced and padded blue winter jacket."
	icon_state = "reinforcedwinterblue"
	armor = list(melee = 25, bullet = 10, laser = 5, energy = 5, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/suit/ms13/ljacket/blue/armored
	name = "armored blue winter jacket"
	desc = "An armored and heavily reinforced blue winter jacket."
	icon_state = "armoredwinterblue"
	armor = list(melee = 35, bullet = 25, laser = 25, energy = 25, bomb = 30, bio = 10, rad = 10, fire = 20, acid = 10)

/obj/item/clothing/suit/labcoat/ms13/ljacket/black
	name = "black winter jacket"
	desc = "A light, black winter jacket."
	icon_state = "winterjacketblack"
	inhand_icon_state = "winter"
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 10)

/obj/item/clothing/suit/ms13/ljacket/black/reinforced
	name = "reinforced black winter jacket"
	desc = "A reinforced and padded black winter jacket."
	icon_state = "reinforcedwinterblack"
	inhand_icon_state = "reinforcedwinterblack"
	armor = list(melee = 25, bullet = 10, laser = 5, energy = 5, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/suit/ms13/ljacket/black/armored
	name = "armored black winter jacket"
	desc = "An armored and heavily reinforced black winter jacket."
	icon_state = "armoredwinterblack"
	inhand_icon_state = "armoredwinterblack"
	armor = list(melee = 35, bullet = 25, laser = 25, energy = 25, bomb = 30, bio = 10, rad = 10, fire = 20, acid = 10)

/obj/item/clothing/suit/toggle/labcoat/ms13/wintercoat
	name = "blue winter coat"
	desc = "A blue, warm winter coat. Perfect for a ski trip. Can button open and closed."
	icon_state = "winterpaddedblue"
	inhand_icon_state = "winter"
	armor = list(melee = 15, bullet = 10, laser = 5, energy = 5, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)

/obj/item/clothing/suit/toggle/labcoat/ms13/wintercoat/grey
	name = "grey winter coat"
	desc = "A grey, warm winter coat. For those who prefer less brightness in their life. Can button open and closed."
	icon_state = "winterpadded"
	inhand_icon_state = "winter"

// jackets //

/obj/item/clothing/suit/ms13/ljacket/moleskin
	name = "moleskin jacket"
	desc = "A durable moleskin jacket."
	icon_state = "moleskin"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/ljacket/wanderer
	name = "wanderer jacket"
	desc = "A jacket made from tanned leather."
	icon_state = "wanderer"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/ljacket/military
	name = "military jacket"
	desc = "An old school military jacket."
	icon_state = "militaryjacket"
	inhand_icon_state = "greenjump"

/obj/item/clothing/suit/ms13/ljacket/musty
	name = "worn-out jacket"
	desc = "An old worn out, musty jacket, it has seen better days."
	icon_state = "mustyjacket"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/ljacket/biker
	name = "biker jacket"
	desc = "A classic tough and durable leather jacket, for riding the highways in badass style."
	icon_state = "bikerjacket"
	inhand_icon_state = "leatherjacket"

/obj/item/clothing/suit/ms13/vest/letterman
	name = "letterman jacket"
	desc = "A high school letterman jacket. For showing off your achievements in the post apocalypse."
	icon_state = "letterman"
	inhand_icon_state = "shirt"

/obj/item/clothing/suit/ms13/ljacket/bomber
	name = "bomber jacket"
	desc = "A fur-lined bomber jacket. Warm and stylish."
	icon_state = "bomberjacket"

// trenchcoats //

/obj/item/clothing/suit/ms13/trench
	name = "tan trenchcoat"
	desc = "A heavy tan trenchcoat."
	icon_state = "tantrench"
	inhand_icon_state = "duster"
	armor = list(melee = 25, bullet = 20, laser = 5, energy = 5, bomb = 10, bio = 5, rad = 5, fire = 5, acid = 5)
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)

/obj/item/clothing/suit/ms13/trench/detective
	name = "detective's trenchcoat"
	desc = "A trenchcoat normally worn by pre-war detectives."
	icon_state = "detective"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/trench/brown
	name = "brown overcoat"
	desc = "A slightly dirty brown overcoat."
	icon_state = "brownover"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/trench/brown
	name = "bruiser trenchcoat"
	desc = "A huge beefy black trenchcoat, certified ass-kickers only."
	icon_state = "bruiser"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/trench/bum
	name = "worn trenchcoat"
	desc = "An old stinking well-used trenchcoat, for the roamer on the roam."
	icon_state = "bum"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/trench/black
	name = "black trenchcoat"
	desc = "An imposing black trenchcoat."
	icon_state = "blacktrench"
	inhand_icon_state = "leatherjacket"

/obj/item/clothing/suit/ms13/trench/battle/black
	name = "reinforced black trenchcoat"
	desc = "A black trenchcoat with some minor additional armorings for added protection."
	icon_state = "reinforcedblacktrench"
	inhand_icon_state = "leatherjacket"

/obj/item/clothing/suit/ms13/trench/black/armored
	name = "armored black trenchcoat"
	desc = "An intimidating black trenchcoat with a lot of armor, padding, and a spiked pauldron for making sure that fear is instilled."
	icon_state = "armoredblacktrench"
	inhand_icon_state = "leatherjacket"
	armor = list(melee = 50, bullet = 35, laser = 25, energy = 25, bomb = 30, bio = 10, rad = 10, fire = 25, acid = 10)

/obj/item/clothing/suit/ms13/trench/battle
	name = "battle trenchcoat"
	desc = "A trenchcoat with extra padding and lined with fur for extra style. Perfect for a mix of battle ready and charming."
	icon_state = "battlecoat"
	inhand_icon_state = "battlecoat"
	armor = list(melee = 35, bullet = 25, laser = 10, energy = 10, bomb = 20, bio = 10, rad = 10, fire = 10, acid = 10)

// dusters //

/obj/item/clothing/suit/ms13/duster
	name = "duster"
	desc = "A long brown leather overcoat."
	icon_state = "duster"
	inhand_icon_state = "duster"
	armor = list(melee = 20, bullet = 15, laser = 5, energy = 5, bomb = 10, bio = 5, rad = 5, fire = 5, acid = 5)
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)

/obj/item/clothing/suit/ms13/duster/alt
	icon_state = "coolerduster"

/obj/item/clothing/suit/ms13/duster/reinf
	name = "reinforced duster"
	desc = "A long brown leather overcoat reinforced and padded for additional protection."
	icon_state = "reinfduster"
	inhand_icon_state = "duster"
	armor = list(melee = 35, bullet = 25, laser = 10, energy = 10, bomb = 20, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/suit/ms13/duster/courier
	name = "modified duster"
	desc = "A thin blue duster with the arms ripped off and a belt added for style/security."
	icon_state = "courier"
	inhand_icon_state = "leatherjacket"

/obj/item/clothing/suit/ms13/duster/courier/protagonist
	name = "couriers duster"
	desc = "Holy shit you are the protagonist of fallout."
	icon_state = "couriergodcomplex"

// labcoats //

/obj/item/clothing/suit/toggle/labcoat/ms13
	name = "doctor's coat"
	desc = "The medical coat of a typical wasteland doctor."
	icon = 'mojave/icons/objects/clothing/suits.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	icon_state = "followers"
	inhand_icon_state = "shirt"
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 15, rad = 15, fire = 15, acid = 15)
	body_parts_covered = CHEST|ARMS|LEGS|GROIN
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/ammo_box,/obj/item/ammo_casing,/obj/item/scalpel,/obj/item/surgical_drapes,/obj/item/cautery,/obj/item/hemostat,/obj/item/retractor,/obj/item/storage/pill_bottle/dice,/obj/item/dice)

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
	desc = "Long, dark, and imposing robes worn by Hubologists."
	icon_state = "hubologist"
	inhand_icon_state = "hostrench"
	armor = list(melee = 25, bullet = 20, laser = 5, energy = 5, bomb = 10, bio = 5, rad = 5, fire = 5, acid = 5)
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	hoodtype = /obj/item/clothing/head/hooded/ms13/hubologist

/obj/item/clothing/suit/ms13/manny
	name = "\improper Manny Mammoth suit"
	desc = "A perfectly preserved pre-war VINTAGE Manny Mammoth suit! It smells of crusty pizza."
	icon_state = "mannybody"
	inhand_icon_state = "mannyhead"
