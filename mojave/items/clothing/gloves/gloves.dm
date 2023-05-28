/obj/item/clothing/gloves/ms13/
	name = "generic ms13 gloves"
	desc = "this doesn't even exist"
	icon = 'mojave/icons/objects/clothing/clothing_world/gloves_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/hands.dmi'
	grid_height = 32
	grid_width = 64
	w_class = WEIGHT_CLASS_SMALL
	equip_delay_self = 0.5 SECONDS
	equip_delay_other = 1 SECONDS

/obj/item/clothing/gloves/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/gloves_inventory.dmi')

/obj/item/clothing/gloves/ms13/winter
	name = "brown winter gloves"
	desc = "A plain pair of brown winter gloves. Nice and warm."
	icon_state = "winterglovesbrown"
	inhand_icon_state = "winterglovesbrown"

/obj/item/clothing/gloves/ms13/winter/black
	name = "dark winter gloves"
	desc = "A pair of dark winter gloves. Nice and warm."
	icon_state = "winterglovesblack"
	inhand_icon_state = "winterglovesblack"

/obj/item/clothing/gloves/ms13/baseball
	name = "baseball glove"
	desc = "An old pre-war baseball glove. Great for protecting a single hand or playing catch."
	icon_state = "baseball"
	inhand_icon_state = "bgloves"

/obj/item/clothing/gloves/ms13/fingerless
	name = "fingerless glove"
	desc = "A pair of black fingerless gloves."
	icon_state = "fingerless"
	inhand_icon_state = "bgloves"

/obj/item/clothing/gloves/ms13/leather
	name = "leather gloves"
	desc = "A pair of brown leather gloves. They don't look pretty, but they'll keep your hands protected."
	icon_state = "leather"
	inhand_icon_state = "bgloves"

/obj/item/clothing/gloves/ms13/military
	name = "military gloves"
	desc = "A pair of sturdy military gloves. Used by the pre-war military, now used by whoever can get their hands on them."
	icon_state = "military"
	inhand_icon_state = "bgloves"

/obj/item/clothing/gloves/ms13/vault
	name = "padded vault gloves"
	desc = "Rugged gloves used for an assortment of reasons, often found in old pre-war vaults. Usually being worn."
	icon_state = "vaultgloves"
	inhand_icon_state = "vaultgloves"

/obj/item/clothing/gloves/ms13/bos
	name = "\improper BoS combat gloves"
	desc = "A pair of hardwearing combat gloves, issued to Brotherhood soldiers."
	icon_state = "bos_gloves"
	inhand_icon_state = "bos_gloves"

/obj/item/clothing/gloves/ms13/ncr
	name = "\improper NCR gloves"
	desc = "A pair of standard issue NCR gloves, the palm of it offers great grip."
	icon_state = "ncr_standard_gloves"
	inhand_icon_state = "ncr_standard_gloves"

/obj/item/clothing/gloves/ms13/ranger
	name = "\improper Desert Ranger patrol gloves"
	desc = "A pair of long brown gloves used by the Desert Rangers"
	icon_state = "patrol"
	inhand_icon_state = "winterglovesbrown"

/obj/item/clothing/gloves/ms13/legion
    name = "generic Legion gloves"
    desc = "Generic gloves worn by Legionaries."
    icon_state = "leg_tanwraps"

/obj/item/clothing/gloves/ms13/legion/bracers
    name = "wrist bracers"
    desc = "Wrist bracers worn by more senior members of Caesar's Legion."
    icon_state = "leg_bracers"

/obj/item/clothing/gloves/ms13/legion/dark
    name = "dark handwraps"
    desc = "Some dark handwraps mostly used by Caesar's Legion."
    icon_state = "leg_darkwraps"

/obj/item/clothing/gloves/ms13/legion/tan
    name = "tan handwraps"
    desc = "Some tan handwraps mostly used by Caesar's Legion."
    icon_state = "leg_tanwraps"

/obj/item/clothing/gloves/ms13/drylander
    name = "\improper Drylander handwraps"
    desc = "Cloth handwraps worn by the Drylander tribe."
    icon_state = "drylander"
