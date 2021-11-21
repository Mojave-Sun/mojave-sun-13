/obj/machinery/iv_drip/ms13
	name = "\improper IV drip"
	desc = "An IV drip with an advanced infusion pump that can both drain blood into and inject liquids from attached containers, a must have for these times."
	icon = 'mojave/icons/structure/medical.dmi'
	icon_state = "iv_drip"
	base_icon_state = "iv_drip"

/obj/machinery/power/floodlight/ms13
	name = "Generic MS13 floodlight"
	desc = "One day we'll have another so this can be more than just a basetype"

/obj/machinery/power/floodlight/ms13/process()
	if(setting > FLOODLIGHT_OFF) //If on
		if(avail(active_power_usage))
			add_load(active_power_usage)
		else
			change_setting(FLOODLIGHT_OFF)
	else if(avail(idle_power_usage))
		add_load(idle_power_usage)

/obj/machinery/power/floodlight/ms13/medical_lamp
	name = "medical lamp"
	desc = "A once sterile lamp used in medical areas, good to get a view of your patient."
	icon = 'mojave/icons/structure/medical.dmi'
	icon_state = "medlamp"
	density = TRUE
	max_integrity = 250
	anchored = TRUE
	light_power = 1.75
