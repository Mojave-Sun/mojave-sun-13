/datum/component/two_handed/wield(mob/living/carbon/user)
	. = ..()
	user.wield_ui_update(wielded)

/datum/component/two_handed/unwield(mob/living/carbon/user)
	. = ..()
	user.wield_ui_update(wielded)

/obj/item/offhand
	icon = null
	icon_state = null
