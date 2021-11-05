/obj/item/clothing/suit/armor/ms13
	name = "generic ms13 armor"
	desc = "You shouldn't be seeing this."
	icon = 'mojave/icons/objects/clothing/clothing_world/suits_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	allowed = list(/obj/item/pen,/obj/item/paper,/obj/item/stamp,/obj/item/reagent_containers/food/drinks/flask,/obj/item/storage/box/matches,/obj/item/lighter,/obj/item/clothing/mask/cigarette,/obj/item/storage/fancy/cigarettes,/obj/item/flashlight,/obj/item/gun,/obj/item/ammo_box,/obj/item/ammo_casing)
	body_parts_covered = CHEST|ARMS|LEGS|GROIN
	///Icon file for left hand inhand overlays
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	///Icon file for right inhand overlays
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'

/obj/item/clothing/suit/armor/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/clothing/clothing_inventory/suits_inventory.dmi')

/obj/item/clothing/suit/hooded/ms13/
	name = "generic ms13 hooded clothing"
	desc = "BASE CLASE BASE CLASS. AAAAAAAAAAAAAAA"
	icon = 'mojave/icons/objects/clothing/clothing_world/suits_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	hoodtype = /obj/item/clothing/head/hooded/ms13

/obj/item/clothing/suit/hooded/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/clothing/clothing_inventory/suits_inventory.dmi')

// Armor Kits //

/obj/item/clothing/suit/armor/ms13/kit
	name = "armor kit"
	desc = "A makeshift kit of armor intended to be worn over clothing and made mostly of metal."
	icon_state = "armorkit"
	inhand_icon_state = "armorkit"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/kit/reinf
	name = "reinforced armor kit"
	desc = "A reinforced, heavier kit of armor intended to be worn over clothing. Made mostly of durable metal plates."
	icon_state = "reinf_armorkit"
	inhand_icon_state = "reinf_armorkit"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 5, "energy" = 30, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 40, "acid" = 10, "wound" = 5)

// Light/Leather Armor //

/obj/item/clothing/suit/armor/ms13/tire
	name = "tire armor"
	desc = "Sections of tire, roughly cut apart and bound together. Getting into a firefight isn't advised, but you shouldn't feel a punch in this."
	icon_state = "tirearmor"
	inhand_icon_state = "tirearmor"
	armor = list("melee" = 30, "bullet" = 10, "laser" = 10, "energy" = 5, "bomb" = 5, "bio" = 5, "rad" = 5, "fire" = 5, "acid" = 5, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/leatherarmor
	name = "leather armor"
	desc = "A suit of armor made of hardened leather, a wasteland staple."
	icon_state = "leatherarmor"
	inhand_icon_state = "leatherarmor"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 20, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/leatherarmor/reinforced
	name = "reinforced leather armor"
	desc = "A suit of leather armor with additional padding, stronger leather, and the addition of some metal reinforcements. A solid defense."
	icon_state = "reinforcedleather"
	inhand_icon_state = "reinforcedleather"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 30, "energy" = 20, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 5)

// Metal Armor //

/obj/item/clothing/suit/armor/ms13/metal
	name = "metal armor"
	desc = "Standard metal armor, great protection from conventional threats but won't do anything against lasers."
	icon_state = "metalarmor"
	inhand_icon_state = "metalarmor"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/metal/reinforced
	name = "reinforced metal armor"
	desc = "Sturdy metal armor with additional reinforcements, excellent protection from conventional threats at the cost of no protection from lasers."
	icon_state = "reinforcedmetal"
	inhand_icon_state = "reinforcedmetal"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 5, "energy" = 30, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 40, "acid" = 10, "wound" = 5)

/obj/item/clothing/suit/armor/ms13/metal/heavy
	name = "heavy metal armor"
	desc = "A full suit of plated and spiked metal armor. Looks quite intimidating and offers the protection to match."
	icon_state = "heavymetal"
	inhand_icon_state = "heavymetal"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 15, "energy" = 40, "bomb" = 50, "bio" = 20, "rad" = 20, "fire" = 60, "acid" = 20, "wound" = 10)

/obj/item/clothing/suit/armor/ms13/vaultvan
	name = "\improper Vault-tec van armor"
	desc = "Makeshift armor scrounged together from, as one may expect, the old remains of a Vault-tec van. Being made entirely of metal does make it susceptible to laser and energy weapons, however."
	icon_state = "vaultvanarmor"
	inhand_icon_state = "vaultvanarmor"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

// Armor Vests //

/obj/item/clothing/suit/armor/ms13/vest
	name = "police kevlar vest"
	desc = "A bulletproof kevlar vest used primarily by pre-war police forces during emergencies."
	icon_state = "police_kevlar"
	inhand_icon_state = "policekevlar"
	blood_overlay_type = "armor"
	dog_fashion = /datum/dog_fashion/back
	armor = list("melee" = 30, "bullet" = 50, "laser" = 20, "energy" = 20, "bomb" = 30, "bio" = 20, "rad" = 20, "fire" = 30, "acid" = 20, "wound" = 5)

/obj/item/clothing/suit/armor/ms13/vest/civilian
	name = "civilian kevlar vest"
	desc = "A bulletproof kevlar vest intended for civilian use, not quite as good as it's police or military counterparts."
	icon_state = "civ_kevlar"
	armor = list("melee" = 20, "bullet" = 35, "laser" = 15, "energy" = 10, "bomb" = 20, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/vest/military
	name = "military kevlar vest"
	desc = "A military grade bulletproof kevlar vest, unmatched protection against almost any caliber of bullet."
	icon_state = "military_kevlar"
	inhand_icon_state = "militarykevlar"
	armor = list("melee" = 40, "bullet" = 60, "laser" = 25, "energy" = 25, "bomb" = 50, "bio" = 20, "rad" = 20, "fire" = 50, "acid" = 20, "wound" = 10)

/obj/item/clothing/suit/armor/ms13/vest/vault
	name = "vault security vest"
	desc = "A thick kevlar vest worn by vault security officers."
	icon_state = "vaultarmor"
	armor = list("melee" = 30, "bullet" = 50, "laser" = 20, "energy" = 20, "bomb" = 30, "bio" = 20, "rad" = 20, "fire" = 30, "acid" = 20, "wound" = 5)

// Raider Armor //

/obj/item/clothing/suit/ms13/trench/black/reinf/enforcer
	name = "enforcers overcoat"
	desc = "A duster with a rather thick vest under it and the addition of some metal spikes and reinforcements. This practically screams intimidating authority."
	icon_state = "enforcercoat"
	inhand_icon_state = "det_suit"
	blood_overlay_type = "armor"

/obj/item/clothing/suit/ms13/trench/boss
	name = "boss' coat"
	desc = "A padded trenchcoat, with the arms left exposed. Worn by the biggest and baddest."
	icon_state = "courier"
	inhand_icon_state = "duster"

/obj/item/clothing/suit/ms13/raider
	name = "raider reinforced jacket"
	desc = "A winter jacket with some basic armoring and reinforcements. In recent times, it has become a staple for raiders in Mammoth."
	icon_state = "winterjacketraider"
	inhand_icon_state = "det_suit"
	blood_overlay_type = "armor"
	armor = list(melee = 30, bullet = 25, laser = 20, energy = 10, bomb = 15, bio = 10, rad = 10, fire = 10, acid = 10, wound = 0)

/obj/item/clothing/suit/ms13/raider/plated
	name = "raider plated jacket"
	desc = "A light jacket that has been crudely reinforced with various metal plates and strips. An armored jacket like this is almost exclusively used by raiders."
	icon_state = "knightlyraider"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/ms13/raider/kevlar
	name = "raider kevlar jacket"
	desc = "A fur lined jacket with an added light kevlar vest and some metal reinforcements. Predominantly seen protecting raiders from bullets seeking justice."
	icon_state = "dapperraider"
	armor = list("melee" = 20, "bullet" = 35, "laser" = 15, "energy" = 10, "bomb" = 20, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)


// Combat Armor //

/obj/item/clothing/suit/armor/ms13/combat
	name = "combat armor"
	desc = "Pre-war military grade combat armor. Offers great all around protection."
	icon_state = "combatarmor"
	inhand_icon_state = "combatarmor"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 20, "energy" = 25, "bomb" = 40, "bio" = 20, "rad" = 20, "fire" = 40, "acid" = 20, "wound" = 5)

/obj/item/clothing/suit/armor/ms13/combat/advanced
	name = "advanced combat armor"
	desc = "An advanced and more protective model of combat armor. Excellent overall protection."
	icon_state = "adv_combatarmor"
	inhand_icon_state = "combat_armor_mk2"
	armor = list("melee" = 55, "bullet" = 45, "laser" = 30, "energy" = 35, "bomb" = 50, "bio" = 25, "rad" = 25, "fire" = 60, "acid" = 25, "wound" = 10)

// Special Armor //

/obj/item/clothing/suit/armor/ms13/stealth
	name = "stealth suit"
	desc = "An advanced chinese stealth suit. You'll never see communism coming until it's far too late."
	icon_state = "stealthsuit"
	inhand_icon_state = "stealthsuit"
	armor = list("melee" = 25, "bullet" = 15, "laser" = 15, "energy" = 10, "bomb" = 5, "bio" = 25, "rad" = 25, "fire" = 30, "acid" = 25)

/obj/item/clothing/suit/armor/ms13/assassin
	name = "assassin armor"
	desc = "A prototype pre-war lightweight suit of armor that is so light and optimized that it can serve to speed the wearer up and mask the sound of footsteps."
	icon_state = "assassin"
	inhand_icon_state = "assassin"
	armor = list("melee" = 35, "bullet" = 30, "laser" = 20, "energy" = 15, "bomb" = 20, "bio" = 15, "rad" = 15, "fire" = 15, "acid" = 15, "wound" = 5)
	slowdown = -0.3
	clothing_traits = list(TRAIT_SILENT_FOOTSTEPS)

/obj/item/clothing/suit/armor/ms13/tesla
	name = "tesla armor"
	desc = "Pre-war experimental armor designed to expressly limit damage from laser and energy weapons."
	icon_state = "tesla_armor"
	inhand_icon_state = "tesla_armor"
	blood_overlay_type = "armor"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 55, "energy" = 40, "bomb" = 30, "bio" = 25, "rad" = 25, "fire" = 60, "acid" = 25, "wound" = 10)

/obj/item/clothing/suit/armor/ms13/eliteriot
	name = "elite riot gear"
	desc = "A highly advanced suit of armor originally in use by elite riot control units before the war."
	icon_state = "riotgear"
	inhand_icon_state = "riotgear"
	armor = list("melee" = 55, "bullet" = 45, "laser" = 30, "energy" = 35, "bomb" = 50, "bio" = 25, "rad" = 25, "fire" = 60, "acid" = 25, "wound" = 10)

/obj/item/clothing/suit/ms13/ljacket/bountyhunter
	name = "bounty hunter's jacket"
	desc = "A unique fur lined leather coat featuring thick ballistic weave fibers through it. Built to hold up to the worse while retaining protection against the elements."
	icon_state = "bountyhunter"
	inhand_icon_state = "armoredwinterblack"
	armor = list(melee = 55, bullet = 45, laser = 35, energy = 25, bomb = 30, bio = 10, rad = 10, fire = 40, acid = 10)

// Enviro Armor //

/obj/item/clothing/suit/armor/ms13/firesuit
	name = "fire suit"
	desc = "Thick fibers woven together, into the ultimate fire-proof suit. There's a few stiches missing here and there, but it'll be fine."
	icon_state = "firesuit"
	inhand_icon_state = "firesuit"
	armor = list(melee = 25, bullet = 5, laser = 35, energy = 35, bomb = 10, bio = 5, rad = 10, fire = 100, acid = 10)
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/ms13/radsuit
	name = "radiation suit"
	desc = "A lead lined suit, designed with the sole purpose of blocking radiation from the human body. It's pretty thick, and while it could protect you from more than rads, why would you waste such a thing like this in combat?"
	icon_state = "radsuit"
	inhand_icon_state = "radsuit"
	armor = list(melee = 20, bullet = 5, laser = 10, energy = 10, bomb = 10, bio = 5, rad = 75, fire = 15, acid = 10)

/obj/item/clothing/suit/hooded/ms13/hazmat
	name = "hazmat suit"
	desc = "A relatively thin but sturdy suit. You're not quite sure what it's made from, only that there's not a chance any liquids are getting on your hardly pristine skin. "
	icon_state = "hazmat"
	inhand_icon_state = "hazmat"
	hoodtype = /obj/item/clothing/head/hooded/ms13/hazmat
	resistance_flags = ACID_PROOF
	armor = list(melee = 15, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 75, rad = 10, fire = 5, acid = 75)

/obj/item/clothing/suit/space/ms13
	name = "\improper Space suit"
	desc = "A state of the art genuine space suit. I hope you didn't go into orbit to get this. Built to last, is up to standard for the harsh climate of space itself."
	icon = 'mojave/icons/objects/clothing/clothing_world/suits_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/suit.dmi'
	icon_state = "spacesuit"
	inhand_icon_state = "spacesuit"
	armor = list(melee = 25, bullet = 15, laser = 25, energy = 25, bomb = 5, bio = 50, rad = 40, fire = 60, acid = 50)

// NCR Armor //

/obj/item/clothing/suit/armor/ms13/ncr
	name = "\improper NCR infantry vest"
	desc = "A standard issue NCR infantry vest specialized for arctic environments."
	icon_state = "ncr_infantry_vest"
	inhand_icon_state = "ncr_infantry_vest"
	armor = list("melee" = 35, "bullet" = 30, "laser" = 15, "energy" = 10, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/ncr/reinforced
	name = "\improper NCR reinforced infantry vest"
	desc = "An NCR infantry vest with extra protective reinforcements."
	icon_state = "ncr_reinforced_vest"
	inhand_icon_state = "ncr_reinforced_vest"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 20, "energy" = 15, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 5)

/obj/item/clothing/suit/armor/ms13/ncr/mantle
	name = "\improper NCR mantle vest"
	desc = "An NCR vest with a mantle on the shoulder, normally indicating some form of authority or command position."
	icon_state = "ncr_standard_mantle"
	inhand_icon_state = "ncr_standard_mantle"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 20, "energy" = 15, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 5)

/obj/item/clothing/suit/armor/ms13/ncr/mantle/reinforced
	name = "\improper NCR reinforced mantle vest"
	desc = "An NCR mantle vest with additional protective reinforcements."
	icon_state = "ncr_reinforced_mantle"
	inhand_icon_state = "ncr_reinforced_mantle"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 25, "energy" = 20, "bomb" = 35, "bio" = 25, "rad" = 25, "fire" = 30, "acid" = 25, "wound" = 5)

// Legion Armor //

/obj/item/clothing/suit/armor/ms13/legion
	name = "standard Legion armor"
	desc = "Standard non-existant armor for Legion recruits, cobbled together with various sports equipment and additional reinforcements as needed."
	icon_state = "leg_rec"
	inhand_icon_state = "legarmor"

/obj/item/clothing/suit/armor/ms13/legion/recruit
	name = "\improper Legion recruit armor"
	desc = "Standard leather armor for Legion recruits. Crudely made but offering decent protection."
	icon_state = "leg_rec"
	inhand_icon_state = "legarmor"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 15, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/legion/prime
	name = "\improper Legion prime armor"
	desc = "Legion leather armor with the small addition of some metal reinforcements for added protection. Intended for Prime Legionaries."
	icon_state = "leg_prime"
	armor = list("melee" = 35, "bullet" = 30, "laser" = 20, "energy" = 10, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/legion/veteran
	name = "\improper Legion veteran armor"
	desc = "A full suit of Legion armor with plenty of hardened leather, padding, and metal reinforcements. Worn by feared Legion Veterans."
	icon_state = "leg_vet"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 25, "energy" = 15, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 5)

/obj/item/clothing/suit/armor/ms13/legion/scout
	name = "\improper Legion scout armor"
	desc = "Legion recruit armor without a chestplate, slightly reduced protection as a result."
	icon_state = "leg_scout"
	armor = list("melee" = 35, "bullet" = 25, "laser" = 5, "energy" = 5, "bomb" = 20, "bio" = 5, "rad" = 5, "fire" = 10, "acid" = 5)

/obj/item/clothing/suit/armor/ms13/legion/explorer
	name = "\improper Legion explorer armor"
	desc = "A light and agile suit of Legion armor worn by Explorers."
	icon_state = "leg_exp"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 15, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/legion/speculatore
	name = "\improper Legion speculatore armor"
	desc = "Legion veteran armor with less reinforcements, reducing some of it's protection."
	icon_state = "leg_spec"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 10, "energy" = 10, "bomb" = 25, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 20)

/obj/item/clothing/suit/armor/ms13/legion/vexillarius
	name = "\improper Legion vexillarius armor"
	desc = "Legion vexillarius armor with the addition of protective plates and defining color."
	icon_state = "leg_vex"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 25, "energy" = 25, "bomb" = 30, "bio" = 20, "rad" = 20, "fire" = 30, "acid" = 20)

/obj/item/clothing/suit/armor/ms13/legion/praetorian
	name = "\improper Legion praetorian armor"
	desc = "Legion praetorian armor, worn only by the most skilled guardians of the Legion."
	icon_state = "leg_prae"
	armor = list("melee" = 55, "bullet" = 40, "laser" = 25, "energy" = 25, "bomb" = 30, "bio" = 20, "rad" = 20, "fire" = 30, "acid" = 20)

/obj/item/clothing/suit/armor/ms13/legion/centurion
	name = "\improper Legion centurion armor"
	desc = "A hulking suit of armor cobbled together mostly from various other pieces of armor. It serves as both great protection and a status symbol for a Legion Centurion."
	icon_state = "leg_cent"
	armor = list("melee" = 55, "bullet" = 45, "laser" = 30, "energy" = 35, "bomb" = 50, "bio" = 25, "rad" = 25, "fire" = 60, "acid" = 25, "wound" = 10)

// BOS Armor //

/obj/item/clothing/suit/armor/ms13/scribe
	name = "\improper Brotherhood scribe's robe"
	desc = "A finely made, comfortable cloth robe worn by Brotherhood scribes."
	icon_state = "scribe"
	inhand_icon_state = "scribe"
	armor = list("melee" = 25, "bullet" = 20, "laser" = 15, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/scribe/head
	name = "\improper Brotherhood head scribe's robe"
	desc = "A finely made, comfortable cloth robe worn by Brotherhood scribes. This one is navy blue, denoting that it's for a head scribe."
	icon_state = "head_scribe"
	inhand_icon_state = "head_scribe"

/obj/item/clothing/suit/armor/ms13/head_paladin
	name = "\improper Brotherhood head paladin's battlecoat"
	desc = "A masterwork of Brotherhood tailoring, featuring good reinforcements and armoring while not compromising on style or weight."
	icon_state = "battlecoat"
	inhand_icon_state = "battlecoat"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 20, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/vest/bos
	name = "\improper Brotherhood kevlar vest"
	desc = "A light kevlar vest in use by the Brotherhood of Steel. Normally given to low ranking members not worthy of the Brotherhood's standard combat armor, or Power Armor."
	icon_state = "bos_kevlar"
	armor = list("melee" = 20, "bullet" = 35, "laser" = 15, "energy" = 10, "bomb" = 20, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

/obj/item/clothing/suit/armor/ms13/combat/bos
	name = "\improper Brotherhood combat armor"
	desc = "A custom built and specialized suit of combat armor used by the Brotherhood of Steel."
	icon_state = "bos_combat"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 25, "energy" = 25, "bomb" = 40, "bio" = 20, "rad" = 20, "fire" = 40, "acid" = 20, "wound" = 5)

// Desert Ranger Armor //

/obj/item/clothing/suit/armor/ms13/combat/ranger
	name = "\improper Desert Ranger combat armor"
	desc = "A set of Desert Ranger combat armor. The thick materials hold up well against attacks, while keeping the wearer agile."
	icon_state = "patrol_armor"
	worn_icon_state = "patrol_armor"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 20, "energy" = 15, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 5)

/obj/item/clothing/suit/armor/ms13/eliteriot/ranger
	name = "\improper Elite Desert Ranger armor"
	desc = "A set of Elite Desert Ranger armor. Heavy kevlar padding in a duster, with a metal breastplate in the front. Built to last through the worst."
	icon_state = "elite_ranger"
	worn_icon_state = "elite_ranger"
	inhand_icon_state = "riotgear"
