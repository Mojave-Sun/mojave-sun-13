#define CANDLE_LUMINOSITY 2

/obj/item/candle/ms13
	name = "candle"
	desc = "An old wax candle, ready to be lit and provide a false sense of comfort."
	icon = 'mojave/icons/objects/clutter/clutter_world.dmi'
	icon_state = "candle1"
	inhand_icon_state = "candle1"
	w_class = WEIGHT_CLASS_TINY
	light_color = LIGHT_COLOR_FIRE
	heat = 1000
	/// How many seconds it burns for
	wax = 2000
	lit = FALSE
	infinite = FALSE
	start_lit = FALSE

/obj/item/candle/ms13/put_out_candle()
	if(!lit)
		return
	lit = FALSE
	update_appearance()
	set_light(0)
	desc = "A burned out wax candle. All good things come to an end."
	return TRUE
