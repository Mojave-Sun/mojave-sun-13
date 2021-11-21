/datum/looping_sound/ms13/holotable
	start_sound = 'sound/machines/click.ogg'
	mid_sounds = list('sound/machines/gravgen/gravgen_mid1.ogg'=1,'sound/machines/gravgen/gravgen_mid2.ogg'=1,'sound/machines/gravgen/gravgen_mid3.ogg'=1,'sound/machines/gravgen/gravgen_mid4.ogg'=1,)
	end_sound = 'sound/machines/click.ogg'
	mid_length = 1.8 SECONDS
	extra_range = 5
	volume = 15
	falloff_distance = 3
	falloff_exponent = 5

/datum/looping_sound/ms13/terminal
	start_sound = 'mojave/sound/ms13machines/terminals/startup.ogg'
	mid_sounds = list('mojave/sound/ms13machines/terminals/idle_1.ogg' = 1, 'mojave/sound/ms13machines/terminals/idle_2.ogg' = 1, 'mojave/sound/ms13machines/terminals/idle_3.ogg' = 1, 'mojave/sound/ms13machines/terminals/idle_4.ogg' = 1)
	start_length = 1.2 SECONDS
	mid_length = 1 SECONDS
	extra_range = 5
	volume = 15
	falloff_exponent = 3
	extra_range = -12
	falloff_distance = 1
