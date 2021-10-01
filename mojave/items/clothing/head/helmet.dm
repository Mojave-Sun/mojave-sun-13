/obj/item/clothing/head/helmet/ms13
	name = "generic ms13 helmet"
	desc = "You shouldn't be seeing this helmet."
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	flags_inv = HIDEHAIR
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 10, bio = 20, rad = 20, fire = 0, acid = 10)
	dynamic_hair_suffix = "+generic"
	dynamic_fhair_suffix = "+generic"

/obj/item/clothing/head/helmet/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/clothing/clothing_inventory/hats_inventory.dmi')

/obj/item/clothing/head/ms13/hood
	name = "generic ms13 hood"
	desc = "We in this."
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	flags_inv = HIDEHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/ms13/hood/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/clothing/clothing_inventory/hats_inventory.dmi')

/obj/item/clothing/head/hooded/ms13
	name = "generic ms13 suit hood"
	desc = "Gamer phone home. Something is wrong."
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	flags_inv = HIDEHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/soft/ms13
	name = "generic ms13 flip cap"
	desc = "Now you flipped dawg."
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'

/obj/item/clothing/head/soft/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/clothing/clothing_inventory/hats_inventory.dmi')

/obj/item/clothing/head/helmet/ms13/tall
	worn_icon = 'mojave/icons/mob/clothing/32x64.dmi'
	worn_x_dimension = 32
	worn_y_dimension = 32

// Helmets //

/obj/item/clothing/head/helmet/ms13/assaultron
	name = "assaultron helmet"
	desc = "A hollowed out and re-fitted head of an assaultron robot, being made of metal won't help it at all in protecting from lasers."
	icon_state = "assaultron"
	inhand_icon_state = "metalhelmet"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 5, "energy" = 30, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 40, "acid" = 10, "wound" = 5)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/flight
	name = "brown flight helmet"
	desc = "A good looking brown pre-war flight helmet in decent condition."
	icon_state = "flightbrown"
	inhand_icon_state = "combathelmet_mk2"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 20, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/flight/yellow
	name = "yellow flight helmet"
	desc = "A yellow flight helmet theorized to be used by test dummies before the war."
	icon_state = "flightyellow"

/obj/item/clothing/head/helmet/ms13/flight/red
	name = "red flight helmet"
	desc = "A red and white pre-war flight helmet. All it's missing is some blue."
	icon_state = "flightred"

/obj/item/clothing/head/helmet/ms13/bladed
	name = "bladed helmet"
	desc = "A menancing metal helmet, adorned with two huge blades on the side."
	icon_state = "bladed"
	inhand_icon_state = "metalhelmet"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

/obj/item/clothing/head/helmet/ms13/junk
	name = "junk helmet"
	desc = "An intimidating helmet crudely made from metal scrap."
	icon_state = "junk"
	inhand_icon_state = "combathelmet_mk2"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/skull
	name = "radstag skull"
	desc = "The skull of a radstag with some padding to be used as a makeshift helmet."
	icon_state = "radstag"
	inhand_icon_state = "w_shoes"
	armor = list("melee" = 30, "bullet" = 10, "laser" = 10, "energy" = 5, "bomb" = 5, "bio" = 5, "rad" = 5, "fire" = 5, "acid" = 5, "wound" = 0)
	flags_inv = HIDEEARS|HIDEFACE

/obj/item/clothing/head/helmet/ms13/skull/muffalo
	name = "muffalo skull"
	desc = "The skull of a muffalo with some padding to be used as a makeshift helmet."
	icon_state = "muffalo"

/obj/item/clothing/head/helmet/ms13/eyebot
	name = "eyebot helmet"
	desc = "A hollowed out eyebot drone converted into a metal helmet."
	icon_state = "eyebot"
	inhand_icon_state = "weldingoff"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/medical
	name = "medical helmet"
	desc = "A protective helmet likely used by pre-war doctors in the event of emergency or in dangerous areas."
	icon_state = "medical"
	inhand_icon_state = "combathelmet_mk2"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 20, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/batter
	name = "batters helmet"
	desc = "A dark pre-war baseball batters helmet, helps protect your noggin a little."
	icon_state = "batter"
	inhand_icon_state = "combathelmet"
	armor = list("melee" = 30, "bullet" = 10, "laser" = 10, "energy" = 5, "bomb" = 5, "bio" = 5, "rad" = 5, "fire" = 5, "acid" = 5, "wound" = 0)

/obj/item/clothing/head/helmet/ms13/batter/red
	name = "red batters helmet"
	desc = "A red pre-war baseball batters helmet, helps protect your noggin a little."
	icon_state = "batterred"

/obj/item/clothing/head/helmet/ms13/batter/blue
	name = "blue batters helmet"
	desc = "A blue pre-war baseball batters helmet, helps protect your noggin a little."
	icon_state = "batterblue"

/obj/item/clothing/head/helmet/ms13/hardhat
	name = "hardhat"
	desc = "A blue pre-war construction hat."
	icon_state = "hardhat"
	inhand_icon_state = "vaultvanarmor"
	armor = list("melee" = 30, "bullet" = 10, "laser" = 10, "energy" = 5, "bomb" = 5, "bio" = 5, "rad" = 5, "fire" = 5, "acid" = 5, "wound" = 0)

/obj/item/clothing/head/hardhat/ms13/mining
	name = "mining hardhat"
	desc = "A very sturdy hard hat with a built in light."
	icon_state = "hardhat0_mining" //holy fuck this code is garbage
	hat_type = "mining"
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	inhand_icon_state = "hazmat"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 20, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)

/obj/item/clothing/head/welding/ms13
	name = "welding helmet"
	desc = "A durable and fireproof face shield to help keep your eyes when welding."
	icon_state = "welding"
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	inhand_icon_state = "welding"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/riot
	name = "police riot helmet"
	desc = "A pre-war police riot helmet with ballistic fiber padding."
	icon_state = "riot"
	inhand_icon_state = "helmet"
	armor = list("melee" = 30, "bullet" = 50, "laser" = 20, "energy" = 20, "bomb" = 30, "bio" = 20, "rad" = 20, "fire" = 30, "acid" = 20, "wound" = 5)

/obj/item/clothing/head/helmet/riot/ms13/vault
	name = "vault-tec riot helmet"
	desc = "A vault-tec riot helmet intended for use in it's infamous Vaults."
	icon_state = "riot"
	inhand_icon_state = "metalhelmet"
	actions_types = null

// Hoods //

/obj/item/clothing/head/hooded/ms13/hubologist
	name = "hubologist hood"
	desc = "A mysterious hood worn by Hubologists."
	icon_state = "hubologist"
	inhand_icon_state = "hubologist"
	armor = list("melee" = 25, "bullet" = 20, "laser" = 10, "energy" = 5, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/ms13/hood/assault
	name = "assault mask"
	desc = "A lesser used pre-war US military assault mask, ballistic fiber padding and kevlar weave makes for great protection from bullets."
	icon_state = "assault"
	armor = list("melee" = 40, "bullet" = 60, "laser" = 30, "energy" = 25, "bomb" = 50, "bio" = 20, "rad" = 20, "fire" = 50, "acid" = 20, "wound" = 10)
	inhand_icon_state = "winterglovesblack"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/ms13/hood/banded
	name = "banded helmet"
	desc = "A crude helmet made by placing various banded metal sheets over a hood. Not very comfortable, but offers decent protection from conventional threats."
	icon_state = "banded"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)
	inhand_icon_state = "harmorkit"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/ms13/hood/plated
	name = "plated cowl"
	desc = "A cloth cowl with plated metal reinforcements."
	icon_state = "plated"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)
	inhand_icon_state = "armorkit"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/ms13/hood/cowl
	name = "cowl"
	desc = "A plain cloth cowl."
	icon_state = "cowl"
	inhand_icon_state = "winterglovesbrown"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/ms13/hood/inquisitor
	name = "inquisitors helm"
	desc = "A strange looking piece of armored metal religious headgear. The brass, gold, and iron have a strange shine to them despite the apocalyptic conditions."
	icon_state = "inquisitor"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 5, "energy" = 30, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 40, "acid" = 10, "wound" = 5)
	inhand_icon_state = "headdress_l"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/ms13/hood/sack
	name = "sack hood"
	desc = "A simple sack with some holes poked in it, for concealing your identity as you pillage the wasteland."
	icon_state = "sack"
	inhand_icon_state = "tribalrag"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/ms13/hood/sack/padded
	name = "padded sack hood"
	desc = "A sack hood with the addition of some padding and leather strips for protection."
	icon_state = "sackstrap"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/ms13/hood/sack/metal
	name = "reinforced sack hood"
	desc = "A sack hood reinforced with metal and crude spikes. Looks quite intimidating... for a sack."
	icon_state = "sackmetal"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0, "energy" = 15, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

/obj/item/clothing/head/ms13/hood/tactical
	name = "tactical stealth hood"
	desc = "A tactical pre-war black latex head and goggles, the read up display is long gone but this durable stealthwear is how you OPERATE."
	icon_state = "tactical"
	armor = list(melee = 20, bullet = 15, laser = 5, energy = 10, bomb = 10, bio = 5, rad = 5, fire = 10, acid = 5)
	inhand_icon_state = "winterglovesblack"
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/ms13/hood/green
	name = "green hood"
	desc = "A simple green leather hood."
	icon_state = "hood"
	inhand_icon_state = "winterglovesblack"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/ms13/hood/hunter
	name = "hunter hood"
	desc = "A tactical hunting hood with some additional padding and a leather face guard. Commonly used by radstag hunters."
	icon_state = "hunter"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 20, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)
	inhand_icon_state = "winterglovesbrown"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

// Brimmed Hats //

/obj/item/clothing/head/helmet/ms13/sheriff
	name = "sheriff's hat"
	desc = "A wide brimmed sheriff hat. There's better smelling things in the wasteland, perhaps you could give it a wash some time. Upon further examination, you can see there is a metal rim inside of it with some rather thick leather in the dome. "
	icon_state = "sheriffhat"
	inhand_icon_state = "sheriffhat"
	armor = list(melee = 20, bullet = 15, laser = 15, energy = 5, bomb = 0, bio = 0, rad = 0, fire = 10, acid = 10)

/obj/item/clothing/head/helmet/ms13/fedora
	name = "gray fedora"
	desc = "An old gray fedora."
	icon_state = "fedold"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/fedora/blue
	name = "blue fedora"
	desc = "A fanciful and classy blue fedora."
	icon_state = "fedblue"

/obj/item/clothing/head/helmet/ms13/fedora/brown
	name = "brown fedora"
	desc = "A brooding and mysterious brown fedora."
	icon_state = "fedbrown"

/obj/item/clothing/head/helmet/ms13/fedora/yellow
	name = "yellow fedora"
	desc = "A bright and cheerful yellow fedora."
	icon_state = "fedyellow"

/obj/item/clothing/head/helmet/ms13/fedora/treasure
	name = "scavengers hat"
	desc = "A typical treasure seekers hat, for those that roam the wastes picking clean the scraps of old."
	icon_state = "treasure"
	inhand_icon_state = "sheriffhat"

/obj/item/clothing/head/helmet/ms13/bowler
	name = "bowler hat"
	desc = "A classy gentleman's bowler hat."
	icon_state = "bowler"
	inhand_icon_state = "sheriffhat"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/cowboy
	name = "cowboy hat"
	desc = "A classic cowboy hat. Perhaps worn by lawmen of old."
	icon_state = "cowboy"
	inhand_icon_state = "sheriffhat"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/cowboy/black
	name = "black cowboy hat"
	desc = "A black cowboy hat. Perhaps worn by desperados of old."
	icon_state = "cowboyblack"

/obj/item/clothing/head/helmet/ms13/prospector
	name = "prospector's hat"
	desc = "A hat worn commonly by post-war prospectors. Has some added padding for braving the dangers of the wastes."
	icon_state = "prospector"
	inhand_icon_state = "sheriffhat"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/prospector/brown
	icon_state = "prospectorbrown"
	inhand_icon_state = "sheriffhat"

/obj/item/clothing/head/helmet/ms13/militia
	name = "militia hat"
	desc = "A sturdy leather wide-brimmed militia hat, the common garb of free men."
	icon_state = "militia"
	inhand_icon_state = "fedora"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/tricorn
	name = "tricorn"
	desc = "A fanciful leather tricorn, how traditional."
	icon_state = "tricorn"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/tricorn/pirate
	name = "pirate hat"
	desc = "Y'arr."
	icon_state = "pirate"

// Tall Helmet //

/obj/item/clothing/head/helmet/ms13/tall/regal
	name = "fancy bicorn"
	desc = "This fanciful hat belongs to a leader or in a museum. The gold and navy silk embroidery is classy and regal, conferring to those who wear it a bearing far beyond what is usually seen in the post-war wastelands."
	icon_state = "regal"
	inhand_icon_state = "fedora"
	armor = list(melee = 20, bullet = 15, laser = 15, energy = 10, bomb = 0, bio = 0, rad = 0, fire = 10, acid = 10)

/obj/item/clothing/head/helmet/ms13/tall/manny
	name = "\improper Manny Mammoth head"
	desc = "A perfectly preserved pre-war VINTAGE Manny Mammoth head! It smells of crusty pizza."
	icon_state = "manny"
	inhand_icon_state = "duster"

/obj/item/clothing/head/helmet/ms13/tall/tophat
	name = "top hat"
	desc = "The truest statement of class one can get in this hell."
	icon_state = "tophat"
	inhand_icon_state = "that"

// Caps //

/obj/item/clothing/head/helmet/ms13/baseball
	name = "baseball cap"
	desc = "A classic baseball cap. A relic from pre-nuclear America."
	icon_state = "baseball"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/deputy
	name = "deputy's cap"
	desc = "A formal refurbished pre-war cap. It's got a faded logo on the inner rim."
	icon_state = "deputycap"
	inhand_icon_state = "deputycap"

/obj/item/clothing/head/helmet/ms13/military
	name = "military hat"
	desc = "A military hat for off-duty soldiers."
	icon_state = "military"
	inhand_icon_state = "general"
	armor = list(melee = 15, bullet = 20, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/military/officer
	name = "officer's hat"
	desc = "A pre-war military hat likely worn by an officer."
	icon_state = "captain"

/obj/item/clothing/head/helmet/ms13/military/officer/white
	name = "white officer's hat"
	desc = "A pre-war military hat likely worn by an officer. This one is white."
	icon_state = "captainwhite"

/obj/item/clothing/head/helmet/ms13/military/officer/chinese
	name = "\improper Chinese officer's hat"
	desc = "A pre-war strange military hat, likely used by Chinese communists."
	icon_state = "captaincommie"

/obj/item/clothing/head/helmet/ms13/sailor
	name = "sailor cap"
	desc = "A light cap used by pre-war sailors."
	icon_state = "sailor"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/postman
	name = "postman hat"
	desc = "A soft cap for old-school couriers of pre-war America."
	icon_state = "postman"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/police
	name = "police hat"
	desc = "A lightly padded hat used by pre-war police officers."
	icon_state = "policeman"
	inhand_icon_state = "fedora"
	armor = list(melee = 15, bullet = 20, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/fisher
	name = "angler hat"
	desc = "A waterproof angler's hat. About a quarter of what you need to get fishing!"
	icon_state = "fisher"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/fisher/technobug
	desc = "A waterproof angler's hat. About a quarter of what you need to get fishing! The name 'T. bugg' is crudely written on the inside."

/obj/item/clothing/head/helmet/ms13/bandanacap
	name = "bandana cap"
	desc = "A piece of cloth tied around a cap. A sense of gang activity radiates from this hat."
	icon_state = "bandanacap"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/bandanacap/ms13
	desc = "A piece of cloth tied around a cap. A sense of gang activity radiates from this hat. The letters and numbers 'MS13' are inscribed on the inside."

/obj/item/clothing/head/helmet/ms13/beret
	name = "gray beret"
	desc = "A plain gray beret."
	icon_state = "beret"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/newsboy
	name = "newsboy cap"
	desc = "A cap made famous by newsboys, come read all about it!"
	icon_state = "newsboy"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/trilby
	name = "trilby hat"
	desc = "A yellow trilby hat."
	icon_state = "trilby"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/beanie
	name = "beanie"
	desc = "A typical, dark beanie."
	icon_state = "beanie"
	inhand_icon_state = "fedora"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

// Misc Hats //

/obj/item/clothing/head/helmet/ms13/chef
	name = "chef hat"
	desc = "A professional chef hat, hopefully there is no rat inside."
	icon_state = "chef"
	inhand_icon_state = "chefhat"
	armor = list(melee = 10, bullet = 10, laser = 5, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/ushanka
	name = "ushanka hat"
	desc = "Thick, warm ushanka hat. The makings of a true slav."
	icon_state = "ushankared"
	armor = list(melee = 20, bullet = 15, laser = 10, energy = 5, bomb = 5, bio = 5, rad = 5, fire = 5, acid = 5, wound = 0)

/obj/item/clothing/head/helmet/ms13/ushanka/blue
	name = "blue ushanka hat"
	desc = "A dark blue thick ushanka hat."
	icon_state = "ushankablue"

/obj/item/clothing/head/helmet/ms13/ushanka/green
	name = "green ushanka hat"
	desc = "A dark green thick ushanka hat."
	icon_state = "ushankagreen"

// Wasteland helmets //

/obj/item/clothing/head/helmet/ms13/metal
	name = "heavy metal helmet"
	desc = "A sturdy and robust metal helmet offering excellent conventional protection."
	icon_state = "metalhelmet"
	inhand_icon_state = "metalhelmet"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 15, "energy" = 40, "bomb" = 50, "bio" = 20, "rad" = 20, "fire" = 60, "acid" = 20, "wound" = 10)

// Raider Helmets //

// Combat Helmets //

/obj/item/clothing/head/helmet/ms13/combat
	name = "combat helmet"
	desc = "A standard pre-war combat helmet. Good overall protection."
	icon_state = "combathelm"
	inhand_icon_state = "combathelmet"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 20, "energy" = 25, "bomb" = 40, "bio" = 20, "rad" = 20, "fire" = 40, "acid" = 20, "wound" = 5)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/combat/advanced
	name = "advanced combat helmet"
	desc = "An advanced combat helmet offering even better protection."
	icon_state = "adv_combathelm"
	inhand_icon_state = "combathelmet_mk2"
	armor = list("melee" = 55, "bullet" = 45, "laser" = 30, "energy" = 35, "bomb" = 50, "bio" = 25, "rad" = 25, "fire" = 60, "acid" = 25, "wound" = 10)

// Special Helmets //

/obj/item/clothing/head/helmet/ms13/stealth
	name = "stealth suit helmet"
	desc = "A stealth suit's helmet. With a menacing orange visor, the victim will never have the pleasure of locking eye contact."
	icon_state = "stealthhelmet"
	inhand_icon_state = "stealthhelmet"
	armor = list("melee" = 25, "bullet" = 15, "laser" = 15, "energy" = 10, "bomb" = 5, "bio" = 25, "rad" = 25, "fire" = 30, "acid" = 25)
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/ms13/tesla
	name = "tesla helmet"
	desc = "An experimental helmet specialized to protect from laser weaponry."
	icon_state = "tesla_helmet"
	inhand_icon_state = "tesla_helmet"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 55, "energy" = 40, "bomb" = 30, "bio" = 25, "rad" = 25, "fire" = 60, "acid" = 25, "wound" = 10)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/eliteriot
	name = "elite riot helmet"
	desc = "An advanced helmet originally used by elite pre-war riot control units."
	icon_state = "riotgearhelmet"
	inhand_icon_state = "riotgearhelmet"
	armor = list("melee" = 55, "bullet" = 45, "laser" = 30, "energy" = 35, "bomb" = 50, "bio" = 25, "rad" = 25, "fire" = 60, "acid" = 25, "wound" = 10)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/ms13/vaulthelmet
	name = "vault security helmet"
	desc = "A rather pristine vault-tec officer's helmet. Surprisingly intact."
	icon_state = "vaulthelmet"
	inhand_icon_state = "helmet"
	armor = list(melee = 45, bullet = 15, laser = 20, energy = 20, bomb = 35, bio = 10, rad = 10, fire = 30, acid = 10)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/eliteriot/bountyhunter
	name = "bounty hunter's helmet"
	desc = "A highly customized advanced Riot helmet. Featuring a thick furred hat slipped over the helmet to keep insulation at an all-time high."
	icon_state = "bountyhunter"
	inhand_icon_state = "riotgearhelmet"
	armor = list(melee = 50, bullet = 40, laser = 35, energy = 25, bomb = 50, bio = 25, rad = 30, fire = 50, acid = 25)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

// Enviro Helmets //

/obj/item/clothing/head/helmet/ms13/firehood
	name = "fireproof hood"
	desc = "The hood to a near completely fire resistent suit. Pretty heavy, but not so bad once it's on."
	icon_state = "firehood"
	inhand_icon_state = "firehood"
	armor = list(melee = 25, bullet = 5, laser = 35, energy = 35, bomb = 10, bio = 5, rad = 10, fire = 100, acid = 10)
	heat_protection = HEAD
	resistance_flags = FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/helmet/ms13/radiationhood
	name = "radiation suit hood"
	desc = "A hood to go along with your radiation suit. It's got a geiger counter mounted near the filter, but it doesn't seem functional."
	icon_state = "radsuithood"
	inhand_icon_state = "radsuithood"
	armor = list(melee = 20, bullet = 5, laser = 10, energy = 10, bomb = 10, bio = 5, rad = 75, fire = 15, acid = 10)
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

/obj/item/clothing/head/hooded/ms13/hazmat
	name = "hazmat hood"
	desc = "The hood to a hazmat suit. You'll want to keep this close if you want the suit to actually do anything for you."
	icon_state = "hazmathood"
	inhand_icon_state = "hazmat"
	armor = list(melee = 15, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 75, rad = 10, fire = 5, acid = 75)
	resistance_flags = ACID_PROOF

/obj/item/clothing/head/helmet/space/ms13
	name = "space helmet"
	desc = "A near pristine space helmet. Not a single crack in the glass found. It's probably still good to go!"
	icon = 'mojave/icons/objects/clothing/clothing_world/hats_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/head.dmi'
	icon_state = "spacehelmet"
	inhand_icon_state = "spacehelmet"
	armor = list(melee = 15, bullet = 5, laser = 5, energy = 5, bomb = 5, bio = 75, rad = 10, fire = 5, acid = 75)
	flags_inv = HIDEHAIR
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""

// NCR Helmets //

/obj/item/clothing/head/helmet/ms13/ncr
	name = "\improper NCR infantry helmet"
	desc = "A standard issue NCR infantry helmet adapted for arctic environments."
	icon_state = "ncr_infantry_helmet"
	inhand_icon_state = "ncr_infantry_helmet"
	armor = list("melee" = 35, "bullet" = 30, "laser" = 15, "energy" = 10, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 10, "wound" = 0)
	flags_cover = NONE

/obj/item/clothing/head/helmet/ms13/ncr/medic
	name = "\improper NCR medic helmet"
	desc = "A standard NCR infantry helmet with the addition of a blue cross for identifying the soldier as a medic."
	icon_state = "ncr_medic_helmet"
	inhand_icon_state = "ncr_medic_helmet"

/obj/item/clothing/head/helmet/ms13/ncr/goggles
	name = "\improper NCR goggles helmet"
	desc = "An NCR helmet with added goggles and a heartier internal padding."
	icon_state = "ncr_goggles_helmet"
	inhand_icon_state = "ncr_goggles_helmet"
	can_toggle = 1
	toggle_message = "You pull the goggles down on"
	alt_toggle_message = "You push the goggles up on"
	actions_types = list(/datum/action/item_action/toggle)
	armor = list("melee" = 40, "bullet" = 35, "laser" = 20, "energy" = 15, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 5)

/obj/item/clothing/head/helmet/ms13/ncr/beret
	name = "\improper NCR beret"
	desc = "A standard padded NCR beret. Normally reserved for NCOs."
	icon_state = "ncr_officer_beret"
	inhand_icon_state = "ncr_officer_beret"
	armor = list("melee" = 25, "bullet" = 20, "laser" = 10, "energy" = 5, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)

/obj/item/clothing/head/helmet/ms13/ncr/beret/officer
	name = "\improper NCR officer beret"
	desc = "A brown NCR officer's beret. Minimal protection, maximum style and authority."
	icon_state = "ncr_officer_brberet"
	inhand_icon_state = "ncr_officer_brberet"

// Legion Helmets //

/obj/item/clothing/head/helmet/ms13/legion/vexillarius
	name = "vexillarius headdress"
	desc = "A helmet used by only the loudest message relayers and heartiest morale boosters of the Legion"
	icon_state = "leg_vex"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 35, "bullet" = 15, "laser" = 15, "energy" = 10, "bomb" = 15, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 20)

/obj/item/clothing/head/helmet/ms13/legion/recruit
	name = "\improper Legion recruit helmet"
	desc = "A dark leather helmet fashioned from old sports gear, worn by Legion recruits."
	icon_state = "leg_rec"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 15, "energy" = 10, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/legion/prime
	name = "\improper Legion prime helmet"
	desc = "A red helmet used by Prime Legionaries. Has additional padding for added protection."
	icon_state = "leg_prime"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 35, "bullet" = 30, "laser" = 20, "energy" = 10, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 10, "wound" = 0)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/legion/veteran
	name = "\improper Legion veteran helmet"
	desc = "A red helmet used by Veteran Legionaries with an added face guard. Only the best protection for the Legion's finest."
	icon_state = "leg_vet"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 25, "energy" = 15, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 5)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/legion/decanus
	name = "\improper Legion recruit decanus helmet"
	desc = "A feathery, quite protective helmet used by recruit decanii of the Legion. It's got brown feathers to signify lesser leadership."
	icon_state = "leg_decr"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 40, "bullet" = 35, "laser" = 25, "energy" = 15, "bomb" = 30, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 5)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/legion/decanus/prime
	name = "\improper Legion prime decanus helmet"
	desc = "A feathery, quite protective helmet used by prime decanii of the Legion. It's got black feathers to signify a moderate rank."
	icon_state = "leg_decp"

/obj/item/clothing/head/helmet/ms13/legion/decanus/veteran
	name = "\improper Legion veteran decanus helmet"
	desc = "A feathery helmet used by only the most experienced decanii of the Legion. It's got striped feathers to signify superior rank."
	icon_state = "leg_decv"

/obj/item/clothing/head/helmet/ms13/legion/centurion
	name = "\improper Legion centurion helmet"
	desc = "A strong helmet donned by Centurions in the Legion. Some reinforcements on the helmet no doubt came from fallen enemies."
	icon_state = "leg_cent"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 55, "bullet" = 45, "laser" = 30, "energy" = 35, "bomb" = 50, "bio" = 25, "rad" = 25, "fire" = 60, "acid" = 25, "wound" = 10)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/legion/praetorian
	name = "\improper Legion praetorian helmet"
	desc = "A skillfuly forged helmet for a skill endowed man. Only the highest of guards may wear this."
	icon_state = "leg_prae"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 65, "bullet" = 50, "laser" = 45, "energy" = 20, "bomb" = 65, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 20)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/helmet/ms13/legion/scout
	name = "\improper Legion scout bandana"
	desc = "A red bandana, often seen tied aroudn the heads of Legion scouts."
	icon_state = "leg_scout"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 20, "bomb" = 35, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 20)
	flags_inv = HIDEEARS

/obj/item/clothing/head/helmet/ms13/legion/explorer
	name = "\improper Legion explorer cap"
	desc = "A relatively preserved pre-war baseball cap with some additional padding, now pridefully adopted by Legion explorers."
	icon_state = "leg_exp"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 25, "bullet" = 20, "laser" = 10, "energy" = 5, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)

// Brotherhood Helmets //

/obj/item/clothing/head/helmet/ms13/initiate
	name = "\improper Brotherhood kevlar helmet"
	desc = "A light kevlar helmet in use by the Brotherhood of Steel, usually seen accompanying the kevlar vests of the Initiates."
	icon_state = "bos_kevlar_helmet"
	inhand_icon_state = "bos_helmet"
	armor = list("melee" = 20, "bullet" = 35, "laser" = 15, "energy" = 10, "bomb" = 20, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10, "wound" = 0)

/obj/item/clothing/head/helmet/ms13/combat/bos
	name = "\improper Brotherhood combat helmet"
	desc = "A hard, custom built helmet issued to Brotherhood troops."
	icon_state = "bos_helmet"
	inhand_icon_state = "bos_helmet"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 25, "energy" = 25, "bomb" = 40, "bio" = 20, "rad" = 20, "fire" = 40, "acid" = 20, "wound" = 5)

// Desert Ranger Helmets/Hats //

/obj/item/clothing/head/helmet/ms13/eliteriot/ranger
	name = "\improper Desert Ranger elite helmet"
	desc = "An advanced and intimidating helmet used by equally intimidating and skilled Elite Desert Rangers."
	icon_state = "elite_ranger"
	inhand_icon_state = "riotgearhelmet"

/obj/item/clothing/head/helmet/ms13/cowboy/ranger
	name = "\improper Desert Ranger hat"
	desc = "A sylish hat, often worn by Desert Rangers. Made with some thick leather and small internal layer of kevlar."
	icon_state = "ranger_hat"
	worn_icon_state = "ranger_hat"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 20, "energy" = 15, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10, "wound" = 0)
