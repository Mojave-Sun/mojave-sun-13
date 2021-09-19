//I am a developer not artiste





//Rain - goes down
/particles/weather/rain
	icon_state             = "particle_drop"
	color                  = "#ccffff"
	// There is an issue with BOX where it spawns like a vector, so update this when Lum fixes it - Otherwise spawn at the top of the screen with some overlap on each side to account for wind
	position               = generator("vector", list(-1000,256,50), list(1000,256,50))
	//Some slight randomness in size to make some drops bigger
	scale                  = generator("vector", list(1,0.5), list(1.5,3))

	// control how the rain falls
	gravity                = list(2,-10)
	drift                  = generator("vector", list(-1,-1), list(1,1)) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s

	//Weather effects, max values
	maxSpawning           = 100
	minSpawning           = 20
	wind                  = 4


//Snow - goes down and swirls
/particles/weather/snow
	icon_state             = null
	color                  = "#ccffff"
	// There is an issue with BOX where it spawns like a vector, so update this when Lum fixes it - Otherwise spawn at the top of the screen with some overlap on each side to account for wind
	position               = generator("vector", list(-1000,256,50), list(1000,256,50))
	//Some slight randomness in size to make some drops bigger
	scale                  = generator("vector", list(1,0.5), list(1.5,3))

	// control how the rain falls
	gravity                = list(2,-2)
	drift                  = generator("circle", 0, 3) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s

	//Weather effects, max values
	maxSpawning           = 100
	minSpawning           = 10
	wind                  = 1


//Dust - goes sideways and swirls
/particles/weather/dust
	icon_state             = null
	color                  = "#f0a982e3"
	// There is an issue with BOX where it spawns like a vector, so update this when Lum fixes it - Otherwise spawn at the top of the screen with some overlap on each side to account for wind
	position               = generator("vector", list(-1000,256,50), list(1000,256,50))
	//Some slight randomness in size to make some drops bigger
	scale                  = generator("vector", list(1,0.5), list(1.5,3))

	// control how the rain falls
	gravity                = list(2,-2)
	drift                  = generator("circle", 0, 3) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s

	//Weather effects, max values
	maxSpawning           = 100
	minSpawning           = 20
	wind                  = 10

//Rads - goes fucking everywhere
/particles/weather/rads
	icon_state             = null
	color                  = "#0b3700"
	// There is an issue with BOX where it spawns like a vector, so update this when Lum fixes it - Otherwise spawn at the top of the screen with some overlap on each side to account for wind
	position               = generator("vector", list(-1000,256,50), list(1000,256,50))
	//Some slight randomness in size to make some drops bigger
	scale                  = generator("vector", list(1,0.5), list(1.5,3))

	// control how the rain falls
	gravity                = list(2,-10)
	drift                  = generator("circle", 0, 10) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s

	//Weather effects, max values
	maxSpawning           = 100
	minSpawning           = 20
	wind                  = 10

