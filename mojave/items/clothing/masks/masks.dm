/obj/item/clothing/mask/ms13
	name = "generic ms13 mask"
	desc = "this doesn't even exist"
	icon = 'mojave/icons/objects/clothing/masks.dmi'
	worn_icon = 'mojave/icons/mob/clothing/mask.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/clothing_righthand.dmi'

// Bandanas //

/obj/item/clothing/mask/ms13/bandana
	name = "bandana"
	desc = "A tactical and cool piece of face wrap, useful againt the dust, heat and those other sumbitches that want your head."
	inhand_icon_state = "winterglovesbrown"
	flags_inv = HIDEFACE

/obj/item/clothing/mask/ms13/bandana/blue
	name = "blue bandana"
	icon_state = "bandanablue"

/obj/item/clothing/mask/ms13/bandana/red
	name = "red bandana"
	icon_state = "bandanared"

/obj/item/clothing/mask/ms13/bandana/white
	name = "white bandana"
	icon_state = "bandanawhite"

/obj/item/clothing/mask/ms13/bandana/patriot
	name = "USA bandana"
	icon_state = "bandanaUSA"

/obj/item/clothing/mask/ms13/bandana/leapord
	name = "leapord-print bandana"
	icon_state = "bandanaleapord"

/obj/item/clothing/mask/ms13/bandana/camo
	name = "camoflage bandana"
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
	icon_state = "surgical"

// Generic Wasteland Facemasks //

/obj/item/clothing/mask/ms13/facewrap
	name = "tan facewrap"
	desc = "A wrap for your face. A nice sand-coloured cloth."
	icon_state = "facewrap"
	flags_inv = HIDEFACE

/obj/item/clothing/mask/ms13/facewrap/halfwrap
	name = "tan halfwrap"
	desc = "A sturdy wrapping for your face. A bit rough in some places, but overall fair quality."
	icon_state = "halfwrap"

/obj/item/clothing/mask/ms13/facewrap/black
	name = "black facewrap"
	desc = "A wrap for your face. This one is as black as the average soul in these wastes."
	icon_state = "facewrap_bla"

/obj/item/clothing/mask/ms13/facewrap/red
	name = "red facewrap"
	desc = "A wrap for your face. Red representing hatred."
	icon_state = "facewrap_red"

/obj/item/clothing/mask/ms13/facewrap/blue
	name = "blue facewrap"
	desc = "A wrap for your face. The blue colour stands out among the bland surroundings."
	icon_state = "facewrap_blu"

/obj/item/clothing/mask/ms13/legion/clothmask
	name = "cloth mask"
	desc = "A simple cloth mask often used by Legionaries for an assortment of reasons."
	icon_state = "leg_mask"
	flags_inv = HIDEFACE

/obj/item/clothing/mask/ms13/legion/speculatore
	name = "\improper Legion speculatore mask"
	desc = "A mask only worn by the near unheard of Speculatores of the Legion. Whatever metal it's made of is good for deflecting bullets received to the face - if you can hit them."
	icon_state = "leg_spec"
	inhand_icon_state = "owl_mask"
	armor = list("melee" = 10, "bullet" = 5, "laser" = 5, "energy" = 5, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 20)
	flags_inv = HIDEFACE

/obj/item/clothing/mask/ms13/ncr
	name = "\improper NCR cowl"
	desc = "A universal NCR cowl. Suitable for any region for an assortment of purposes. Great to keep weak shrapnel away from your face."
	icon_state = "ncr_cowl"
	inhand_icon_state = "ncr_standard_gloves"
	flags_inv = HIDEFACE

/obj/item/clothing/mask/ms13/bos
	name = "\improper BoS hood"
	desc = "A heavy hood originally designed to wear under power armor."
	icon_state = "bos_hood"
	inhand_icon_state = "bos_hood"
	flags_inv = HIDEHAIR

/obj/item/clothing/mask/gas/ms13
	name = "gas mask"
	desc = "An old gas mask. Hypothetically speaking, breathing through it is safer than breathing out of it. The filters are questionable at best."
	icon = 'mojave/icons/objects/clothing/masks.dmi'
	worn_icon = 'mojave/icons/mob/clothing/mask.dmi'
	icon_state = "gasmaskmodern"
	inhand_icon_state = "gasmask"
	var/adjusted = FALSE
	var/adjustable = TRUE

/obj/item/clothing/mask/gas/ms13/modern
	icon_state = "gasmask"

/obj/item/clothing/mask/gas/ms13/ranger
	desc = "A heavy duty gas mask, perfect for filtering the air of a very tainted world."
	icon_state = "ranger_mask"
	worn_icon_state = "ranger_mask"
	adjustable = FALSE

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
		desc = "[initial(desc)] It will go over your headwear."
		adjusted = TRUE
	else
		alternate_worn_layer = UNDER_HEAD_LAYER
		to_chat(user, "<span class='notice'>You adjust the [src] to go under your headwear.</span>")
		desc = "[initial(desc)] It will go under your headwear."
		adjusted = FALSE
	update_icon()
