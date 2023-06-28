//For fire and fire related sound loops (like grilling)

/datum/looping_sound/grill_meat
	mid_sounds = list('mojave/sound/ms13machines/grill_meat.ogg' = 1)
	mid_length = 1.8 SECONDS
	volume = 15
	falloff_distance = 2
	falloff_exponent = 2

/datum/looping_sound/fire_soft
	mid_sounds = list('mojave/sound/ms13machines/fire_loop_soft_cut1.ogg' = 1, 'mojave/sound/ms13machines/fire_loop_soft_cut2.ogg' = 1.5, 'mojave/sound/ms13machines/fire_loop_soft_cut3.ogg' = 1.5, 'mojave/sound/ms13machines/fire_loop_soft_cut4.ogg' = 1.5, 'mojave/sound/ms13machines/fire_loop_soft_cut5.ogg' = 1.5)
	mid_length = 1.6 SECONDS
	volume = 45
	extra_range = 1
	falloff_distance = 3
	falloff_exponent = 6

/datum/looping_sound/fire_loud
	mid_sounds = list('mojave/sound/ms13machines/fire_loop_loud.ogg' = 1)
	mid_length = 55 SECONDS
	volume = 50
	extra_range = 6
	falloff_distance = 8
	falloff_exponent = 8
