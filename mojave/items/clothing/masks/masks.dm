/obj/item/clothing/mask/ms13
	name = "generic ms13 mask"
	desc = "this doesn't even exist"
	icon = 'mojave/icons/objects/clothing/clothing_world/masks_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/mask.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	grid_width = 32
	grid_height = 32
	equip_delay_self = 0.75 SECONDS
	equip_delay_other = 2 SECONDS

/obj/item/clothing/mask/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/masks_inventory.dmi')

// Bandanas //

/obj/item/clothing/mask/ms13/bandana
	name = "black bandana"
	desc = "A black bandana useful for keeping dust, snow, and prying eyes away from your face."
	icon_state = "bandana"
	inhand_icon_state = "winterglovesbrown"
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH

/obj/item/clothing/mask/ms13/bandana/blue
	name = "blue bandana"
	desc = "A light blue bandana useful for keeping dust, snow, and prying eyes away from your face."
	icon_state = "bandanablue"

/obj/item/clothing/mask/ms13/bandana/red
	name = "red bandana"
	desc = "A red bandana useful for keeping dust, snow, and prying eyes away from your face."
	icon_state = "bandanared"

/obj/item/clothing/mask/ms13/bandana/white
	name = "white bandana"
	desc = "A bright white bandana useful for keeping dust, snow, and prying eyes away from your face."
	icon_state = "bandanawhite"

/obj/item/clothing/mask/ms13/bandana/green
	name = "green bandana"
	desc = "A dark green bandana useful for keeping dust, snow, and prying eyes away from your face."
	icon_state = "bandanagreen"

/obj/item/clothing/mask/ms13/bandana/ranger
	name = "brown bandana"
	desc = "A comfortable, dark brown bandana."
	icon_state = "bandana_chief"

/obj/item/clothing/mask/ms13/bandana/patriot
	name = "old world bandana"
	desc = "A bandana bearing the flag of the old world. This probably used to make someone feel a sense of pride."
	icon_state = "bandanaUSA"

/obj/item/clothing/mask/ms13/bandana/leapord
	name = "leopard print bandana"
	desc = "A bandana with a leopard print pattern. What is a leopard anyways?"
	icon_state = "bandanaleapord"

/obj/item/clothing/mask/ms13/bandana/camo
	name = "camouflage bandana"
	desc = "A bandana with a woodland camouflage pattern. You can barely see it."
	icon_state = "bandanacamo"

/obj/item/clothing/mask/ms13/bandana/crips
	name = "gangsters bandana"
	icon_state = "bandanacrips"

/obj/item/clothing/mask/ms13/bandana/bloods
	name = "gangsters bandana"
	icon_state = "bandanabloods"

/obj/item/clothing/mask/ms13/bandana/grove
	name = "gangsters bandana"
	icon_state = "bandanagrove"

/obj/item/clothing/mask/ms13/bandana/surgical
	name = "surgical mask"
	desc = "A mask used by doctors to keep blood out of their mouth and nose."
	icon_state = "surgical"

/obj/item/clothing/mask/ms13/bandana/goldman
	name = "dark brown bandana"
	desc = "A comfortable, dark brown bandana."
	icon_state = "goldman_bandana"

/obj/item/clothing/mask/ms13/bandana/goldman/alt
	name = "embroidered bandana"
	desc = "A dark brown bandana with gold embroidery."
	icon_state = "goldman_bandana_alt"

// Generic Wasteland Facemasks //

/obj/item/clothing/mask/ms13/facewrap
	name = "tan full facewrap"
	desc = "A full, tan colored wrap for your face."
	icon_state = "facewrap"
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH

/obj/item/clothing/mask/ms13/facewrap/halfwrap
	name = "tan half facewrap"
	desc = "A tan facewrap that doesn't go all the way around your head. Still useful for what you'd normally want it for, however."
	icon_state = "halfwrap"

/obj/item/clothing/mask/ms13/facewrap/black
	name = "black facewrap"
	desc = "A black facewrap. No doubt for clandestine operations."
	icon_state = "facewrap_bla"

/obj/item/clothing/mask/ms13/facewrap/red
	name = "red facewrap"
	desc = "An angry and violent red facewrap."
	icon_state = "facewrap_red"

/obj/item/clothing/mask/ms13/facewrap/blue
	name = "blue facewrap"
	desc = "A vibrant and lively blue facewrap."
	icon_state = "facewrap_blu"

/obj/item/clothing/mask/ms13/facewrap/mon_city
	name = "red facewrap and goggles"
	desc = "A thick red facewrap with a pair of goggles."
	icon_state = "mon_marks"
	flags_inv = HIDEFACE | HIDEHAIR
	flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES

/obj/item/clothing/mask/ms13/facewrap/goldman
	name = "dark brown facewrap"
	desc = "A dark brown facewrap and bandana. It oozes mystery."
	icon_state = "goldman_facewrap"
	flags_inv = HIDEFACE | HIDEHAIR
	flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES

/obj/item/clothing/mask/ms13/legion
	name = "\improper Legion cloth mask"
	desc = "A simple dark cloth mask often used by members of Caesar's Legion."
	icon_state = "leg_mask"
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH

/obj/item/clothing/mask/ms13/legion/speculatore
	name = "\improper Legion speculatore mask"
	desc = "A mask only worn by the near unheard of Speculatores of the Legion."
	icon_state = "leg_spec"
	inhand_icon_state = "owl_mask"

/obj/item/clothing/mask/ms13/ncr
	name = "\improper NCR cowl"
	desc = "A universal NCR cowl. Suitable for any region for an assortment of purposes."
	icon_state = "ncr_cowl"
	inhand_icon_state = "ncr_standard_gloves"
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH

/obj/item/clothing/mask/ms13/bos
	name = "\improper BoS hood"
	desc = "A light hood used by the Brotherhood of Steel, originally designed to be worn under power armor."
	icon_state = "bos_hood"
	inhand_icon_state = "bos_hood"
	flags_inv = HIDEHAIR

/obj/item/clothing/mask/gas/ms13
	name = "gas mask"
	desc = "An old gas mask. Hypothetically speaking, breathing through it is safer than breathing without it. The filters are questionable at best."
	icon = 'mojave/icons/objects/clothing/clothing_world/masks_world.dmi'
	worn_icon = 'mojave/icons/mob/clothing/mask.dmi'
	icon_state = "gasmaskmodern"
	inhand_icon_state = "gasmask"
	var/adjusted = FALSE
	var/adjustable = TRUE
	has_fov = FALSE //placeholder for now until we make this more useful to justify a FOV
	equip_delay_self = 1.5 SECONDS
	equip_delay_other = 3 SECONDS
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 64
	grid_height = 64

/obj/item/clothing/mask/gas/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clothing/clothing_inventory/masks_inventory.dmi')

/obj/item/clothing/mask/gas/ms13/modern
	icon_state = "gasmask"

/obj/item/clothing/mask/gas/ms13/ranger
	desc = "A heavy duty gas mask, perfect for filtering the air of a very tainted world."
	icon_state = "ranger_mask"
	worn_icon_state = "ranger_mask"
	adjustable = FALSE

/obj/item/clothing/mask/gas/ms13/mon_city
	name = "antique gas mask"
	desc = "This gas mask seems to be old even by pre-war standards. But it does still work, right?"
	icon_state = "mon_gasmask"
	worn_icon_state = "mon_gasmask"
	adjustable = FALSE

/obj/item/clothing/mask/gas/ms13/mon_city/full
	desc = "A very old gas mask, seemingly even more uncommon. This one has a long snorkel like tube with a filter on the end."
	icon_state = "mon_gasmaskfull"
	worn_icon_state = "mon_gasmaskfull"

/obj/item/clothing/mask/gas/ms13/mon_city/pointer
	name = "crude gas mask"
	desc = "A makeshift gas mask that is no doubt a creation of the post-apocalypse. Looks a bit intimidating, and you're not sure who would really want to put this on their head."
	icon_state = "mon_pointer"
	worn_icon_state = "mon_pointer"

/obj/item/clothing/mask/gas/ms13/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/mask/gas/ms13/attack_self(mob/living/user)
	toggle_mask_style(user)

/obj/item/clothing/mask/gas/ms13/proc/toggle_mask_style(mob/living/user)
	adjusted = !adjusted

	if(!adjustable)
		return

	if(adjusted)
		alternate_worn_layer = ABOVE_BODY_FRONT_LAYER
		to_chat(user, "<span class='notice'>You adjust the [src] to go over your headwear.</span>")
		desc = "[initial(desc)] It will go over your headwear, you can adjust this by using while in hand."
		adjusted = TRUE
	else
		alternate_worn_layer = UNDER_HEAD_LAYER
		to_chat(user, "<span class='notice'>You adjust the [src] to go under your headwear.</span>")
		desc = "[initial(desc)] It will go under your headwear, you can adjust this by using while in hand."
		adjusted = FALSE
	update_icon()


