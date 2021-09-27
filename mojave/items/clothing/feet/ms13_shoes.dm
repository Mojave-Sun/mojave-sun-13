/obj/item/clothing/shoes/ms13
	icon = 'mojave/icons/objects/clothing/clothing_world/shoes_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/feet.dmi'
	strip_delay = 20

/obj/item/clothing/shoes/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/inworld_sprite, 'mojave/icons/objects/clothing/clothing_inventory/shoes_inventory.dmi')

/obj/item/clothing/shoes/ms13
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes

/obj/item/clothing/shoes/ms13/rag
	name = "footcloths"
	desc = "Simple ragged cloth for your feet. Anything is better than nothing."
	icon_state = "rag"
	inhand_icon_state = "rag"

/obj/item/clothing/shoes/ms13/crude
	name = "crude treads"
	desc = "A single dirty boot, with a sandal on the other foot. A slight step up from nothing but rags on your feet."
	icon_state = "crudetreads"
	inhand_icon_state = "rag"

/obj/item/clothing/shoes/ms13/tan
	name = "tan shoes"
	desc = "A pair of tanned leather shoes."
	icon_state = "tan"
	inhand_icon_state = "tan"

/obj/item/clothing/shoes/ms13/brownie //Make a craft recipe, and delete this comment.
	name = "brown shoes"
	desc = "A hardy pair of brown leather shoes."
	icon_state = "brownie"
	inhand_icon_state = "brownie"

/obj/item/clothing/shoes/ms13/fancy
	name = "fancy black shoes"
	desc = "A pair of fancy black shoes."
	icon_state = "fancy"
	inhand_icon_state = "fancy"

/obj/item/clothing/shoes/ms13/winter
	name = "brown winter boots"
	desc = "A pair of brown winter boots. Great for surviving a rugged, harsh winter."
	icon_state = "winterbootsbrown"
	inhand_icon_state = "winterbootsbrown"
	strip_delay = 40

/obj/item/clothing/shoes/ms13/winter/black
	name = "black winter boots"
	desc = "A pair of black winter boots. For those who think brown winter boots are far too basic."
	icon_state = "winterbootsblack"
	inhand_icon_state = "winterbootsblack"

/obj/item/clothing/shoes/ms13/cowboy
	name = "cowboy boots"
	desc = "A pair of cowhide boots with spurs that jingle, jangle, jingle."
	icon_state = "cowboy"
	inhand_icon_state = "cowboy"
	strip_delay = 40

/obj/item/clothing/shoes/ms13/explorer
	name = "explorer boots"
	desc = "A rugged pair of boots great for explorers of the wastes. They can take you almost anywhere."
	icon_state = "explorer"
	strip_delay = 40

/obj/item/clothing/shoes/ms13/military
	name = "military boots"
	desc = "Robust black boots used by the pre-war US military. Now instead used to protect the grubby feet of wastelanders."
	icon_state = "military"
	inhand_icon_state = "military"
	strip_delay = 40
	resistance_flags = 0

/obj/item/clothing/shoes/ms13/military/vault
	name = "vault boots"
	desc = "Tight-fit vault-tec branded boots. Built for style and conditioned for the worst."
	icon_state = "vaultboots"
	inhand_icon_state = "vaultboots"

/obj/item/clothing/shoes/ms13/military/diesel
	name = "black diesel boots"
	desc = "Bulky black steel-toed diesel boots. They sound as threatening as they look."
	icon_state = "diesel_m"
	inhand_icon_state = "diesel_m"

/obj/item/clothing/shoes/ms13/military/diesel/female
	name = "female diesel boots"
	desc = "Womens' knee-high platform boots with shiny steel clasps."
	icon_state = "diesel_f"
	inhand_icon_state = "diesel_f"

/obj/item/clothing/shoes/ms13/military/ncr
	name = "\improper NCR boots"
	desc = "A pair of standard issue NCR black boots."
	icon_state = "ncr_boots"
	inhand_icon_state = "ncr_boots"
	strip_delay = 40

/obj/item/clothing/shoes/ms13/military/ncr/officer
	name = "\improper NCR officer boots"
	desc = "A pair of brown NCR boots issued to officers. Quite stylish."
	icon_state = "ncr_officer_boots"
	inhand_icon_state = "ncr_boots"

/obj/item/clothing/shoes/ms13/military/ncr/scout
	name = "\improper NCR scout boots"
	desc = "A nice flexible pair of boots, often associated with the more mobile units of the NCR."
	icon_state = "ncr_scout_boots"
	inhand_icon_state = "ncr_boots"

/obj/item/clothing/shoes/ms13/military/legion
	name = "generic Legion boots"
	desc = "Generic boots worn by Legionaries."
	icon_state = "leg_tanboot"
	inhand_icon_state = "legionleather"
	armor = list(melee = 20, bullet = 10, laser = 10, energy = 0, bomb = 10, bio = 0, rad = 5, fire = 10, acid = 0)

/obj/item/clothing/shoes/ms13/military/legion/tanboots
	name = "tan leather boots"
	desc = "A crude pair of leather boots commonly worn by the Caesar's Legion recruits. These ones are made of a tan leather."
	icon_state = "leg_tanboot"
	inhand_icon_state = "legionleather"
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 0, bomb = 10, bio = 0, rad = 5, fire = 10, acid = 0)

/obj/item/clothing/shoes/ms13/military/legion/darkboots
	name = "dark leather boots"
	desc = "A crude pair of leather boots commonly worn by the Caesar's Legion recruits. These ones are made of a darker leather."
	icon_state = "leg_darkboot"
	inhand_icon_state = "legionleather"
	armor = list(melee = 10, bullet = 5, laser = 10, energy = 0, bomb = 10, bio = 0, rad = 5, fire = 10, acid = 0)

/obj/item/clothing/shoes/ms13/military/legion/cleats
	name = "cleats"
	desc = "A pair of cleats, often sported by mobility focused Legionaries."
	icon_state = "leg_cleats"
	inhand_icon_state = "legionmetal"
	clothing_flags = NOSLIP
	armor = list(melee = 5, bullet = 10, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 20, acid = 0)

/obj/item/clothing/shoes/ms13/military/bos
	name = "\improper BoS combat boots"
	desc = "A pair of heavy military boots favored by the Brotherhood of Steel."
	icon_state = "bos_boots"
	inhand_icon_state = "bos_boots"
