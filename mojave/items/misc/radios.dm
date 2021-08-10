/obj/item/radio/ms13
	icon = 'mojave/icons/objects/hamradio.dmi'
	name = "hand Radio"
	icon_state = "handradio"
	inhand_icon_state = "handradio_"
	desc = "A basic handheld radio that recieves over a relatively long range, unfortunately this one can't broadcast."

	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=75, /datum/material/glass=25)
	radio_broadcast = FALSE

/obj/item/radio/ms13/can_receive(freq, level, AIuser)
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		if(H.is_holding(src))
			return ..(freq, level)
	else if(AIuser)
		return ..(freq, level)
	return FALSE

/obj/item/radio/ms13/broadcast
	icon = 'mojave/icons/objects/hamradio.dmi'
	name = "broadcast hand radio"
	icon_state = "handradio"
	inhand_icon_state = "handradio_"
	desc = "A rare handheld radio that can send as well as recieve signals. The poor quality of broadcasts makes it unpleasent to listen to, and doing so too often is a good way to get lynched."
	radio_broadcast = RADIOSTATIC_HEAVY

/obj/item/radio/ms13/broadcast/prewar
	icon = 'mojave/icons/objects/hamradio.dmi'
	name = "pre-War hand radio"
	icon_state = "handradio"
	inhand_icon_state = "handradio_"
	desc = "The best a handheld gets, this extremely rare radio can broadcast at reasonably high quality while remaining lightweight and portable."
	radio_broadcast = RADIOSTATIC_MEDIUM

/obj/item/radio/ms13/ham
	name = "ham radio"
	desc = "An amateur radio setup. The sound quality could be better, but it beats listening to brahmin all day. Has a working microphone, though the quality isn't great."
	icon = 'mojave/icons/objects/hamradio.dmi'
	icon_state = "radio_on"
	canhear_range = 7
	pixel_y = 5
	freerange = TRUE
	anonymize = TRUE
	anchored = TRUE
	radio_broadcast = RADIOSTATIC_MEDIUM

/obj/item/radio/ms13/ham/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Use [MODE_TOKEN_INTERCOM] when nearby to speak into it.</span>"

/obj/item/radio/ms13/ham/Initialize(mapload, ndir, building)
	. = ..()
	if(building)
		setDir(ndir)
	var/area/current_area = get_area(src)
	if(!current_area)
		return
	RegisterSignal(current_area, COMSIG_AREA_POWER_CHANGE, .proc/AreaPowerCheck)

/obj/item/radio/ms13/ham/broadcast
	name = "high power broadcasting set"
	desc = "A high end broadcasting set used by professional radio studios. Legend has it that Mr. New Vegas himself uses this model."
	icon = 'mojave/icons/objects/hamradio.dmi'
	icon_state = "radio_on"
	canhear_range = 7
	pixel_y = 5
	freerange = TRUE
	anonymize = TRUE
	anchored = TRUE
	radio_broadcast = RADIOSTATIC_LIGHT
/**
 * Override attack_tk_grab instead of attack_tk because we actually want attack_tk's
 * functionality. What we DON'T want is attack_tk_grab attempting to pick up the
 * intercom as if it was an ordinary item.
 */
/obj/item/radio/ms13/ham/attack_tk_grab(mob/user)
	interact(user)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/obj/item/radio/ms13/ham/attack_ai(mob/user)
	interact(user)

/obj/item/radio/ms13/ham/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	interact(user)

/obj/item/radio/ms13/ham/ui_state(mob/user)
	return GLOB.default_state

/obj/item/radio/ms13/ham/can_receive(freq, level)
	if(!on)
		return FALSE
	if(wires.is_cut(WIRE_RX))
		return FALSE
	if(!(0 in level))
		var/turf/position = get_turf(src)
		if(isnull(position) || !(position.z in level))
			return FALSE
	if(!listening)
		return FALSE

	return TRUE


/obj/item/radio/ms13/ham/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, list/spans, list/message_mods = list())
	if(message_mods[RADIO_EXTENSION] == MODE_INTERCOM)
		return  // Avoid hearing the same thing twice
	return ..()

/obj/item/radio/ms13/ham/emp_act(severity)
	. = ..() // Parent call here will set `on` to FALSE.
	update_icon()

/obj/item/radio/ms13/ham/end_emp_effect(curremp)
	. = ..()
	AreaPowerCheck() // Make sure the area/local APC is powered first before we actually turn back on.

/obj/item/radio/ms13/ham/update_icon()
	. = ..()
	if(on)
		icon_state = initial(icon_state)
	else
		icon_state = "radio_off"

/**
 * Proc called whenever the intercom's area loses or gains power. Responsible for setting the `on` variable and calling `update_icon()`.
 *
 * Normally called after the intercom's area recieves the `COMSIG_AREA_POWER_CHANGE` signal, but it can also be called directly.
 * Arguments:
 * * source - the area that just had a power change.
 */
/obj/item/radio/ms13/ham/proc/AreaPowerCheck(datum/source)
	var/area/current_area = get_area(src)
	if(!current_area)
		on = FALSE
	else
		on = current_area.powered(AREA_USAGE_EQUIP) // set "on" to the equipment power status of our area.
	update_icon()

