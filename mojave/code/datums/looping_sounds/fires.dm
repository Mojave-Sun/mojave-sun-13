//For fire and fire related sound loops (like grilling)

/datum/looping_sound/grill_meat
	mid_sounds = list('mojave/sound/ms13machines/grill_meat.ogg' = 1)
	mid_length = 2 SECONDS
	volume = 15
	falloff_distance = 2

/datum/looping_sound/fire_soft
	mid_sounds = list('mojave/sound/ms13machines/fire_loop_soft.ogg' = 1)
	mid_length = 82 SECONDS
	volume = 65
	extra_range = 6
	falloff_distance = 8
	falloff_exponent = 8

/datum/looping_sound/fire_loud
	mid_sounds = list('mojave/sound/ms13machines/fire_loop_loud.ogg' = 1)
	mid_length = 55 SECONDS
	volume = 50
	extra_range = 6
	falloff_distance = 8
	falloff_exponent = 8
