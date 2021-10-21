/datum/looping_sound/active_outside_ashstorm
	mid_sounds = list(
		'sound/weather/ashstorm/outside/active_mid1.ogg'=1,
		'sound/weather/ashstorm/outside/active_mid1.ogg'=1,
		'sound/weather/ashstorm/outside/active_mid1.ogg'=1
		)
	mid_length = 80
	start_sound = 'sound/weather/ashstorm/outside/active_start.ogg'
	start_length = 130
	end_sound = 'sound/weather/ashstorm/outside/active_end.ogg'
	volume = 80

/datum/looping_sound/active_inside_ashstorm
	mid_sounds = list(
		'sound/weather/ashstorm/inside/active_mid1.ogg'=1,
		'sound/weather/ashstorm/inside/active_mid2.ogg'=1,
		'sound/weather/ashstorm/inside/active_mid3.ogg'=1
		)
	mid_length = 80
	start_sound = 'sound/weather/ashstorm/inside/active_start.ogg'
	start_length = 130
	end_sound = 'sound/weather/ashstorm/inside/active_end.ogg'
	volume = 60

/datum/looping_sound/weak_outside_ashstorm
	mid_sounds = list(
		'sound/weather/ashstorm/outside/weak_mid1.ogg'=1,
		'sound/weather/ashstorm/outside/weak_mid2.ogg'=1,
		'sound/weather/ashstorm/outside/weak_mid3.ogg'=1
		)
	mid_length = 80
	start_sound = 'sound/weather/ashstorm/outside/weak_start.ogg'
	start_length = 130
	end_sound = 'sound/weather/ashstorm/outside/weak_end.ogg'
	volume = 50

/datum/looping_sound/weak_inside_ashstorm
	mid_sounds = list(
		'sound/weather/ashstorm/inside/weak_mid1.ogg'=1,
		'sound/weather/ashstorm/inside/weak_mid2.ogg'=1,
		'sound/weather/ashstorm/inside/weak_mid3.ogg'=1
		)
	mid_length = 80
	start_sound = 'sound/weather/ashstorm/inside/weak_start.ogg'
	start_length = 130
	end_sound = 'sound/weather/ashstorm/inside/weak_end.ogg'
	volume = 30

/datum/looping_sound/void_loop
	mid_sounds = list('sound/ambience/VoidsEmbrace.ogg'=1)
	mid_length = 1669 // exact length of the music in ticks
	volume = 100
	extra_range = 30

// these could be clipped to less silly lengths
/datum/looping_sound/dust_storm
	mid_sounds = 'sound/weather/weather_dust.ogg'
	mid_length = 80
	volume = 150

/datum/looping_sound/rad_storm
	mid_sounds = 'sound/weather/weather_rad.ogg'
	mid_length = 110 SECONDS
	volume = 150

/datum/looping_sound/rain
	mid_sounds = 'sound/weather/weather_rain.ogg'
	mid_length = 40 SECONDS
	volume = 150

/datum/looping_sound/snow
	mid_sounds = 'sound/weather/weather_snow.ogg'
	mid_length = 50 SECONDS
	volume = 150

/datum/looping_sound/storm
	mid_sounds = 'sound/weather/weather_storm.ogg'
	mid_length = 30 SECONDS
	volume = 150
