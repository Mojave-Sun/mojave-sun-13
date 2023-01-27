/particles/weather
	spawning = 0
	var/wind = 0 //Left/Right maximum movement increase per tick
	var/maxSpawning = 0 //Max spawner - Recommend you use this over Spawning, so severity can ease it in
	var/minSpawning = 0 //Weather should start with 0, but when easing, it will never go below this
	icon = 'icons/effects/particles/particle.dmi'


	spawning = 0
	width                  = 800  // I think this is supposed to be in pixels, but it doesn't match bounds, so idk - 800x800 seems to prevent particle-less edges
	height                 = 800
	count                  = 3000 // 3000 particles
	//Set bounds to rough screensize + some extra on the side and top movement for "wind"
	bound1                 = list(-500,-256,-10)
	bound2                 = list(500,500,10)
	lifespan               = 285   // live for 30s max (fadein + lifespan + fade)
	fade                   = 10    // 1s fade out
	fadein				   = 5     // 0.5s fade in

	//Obnoxiously 3D -- INCREASE Z level to make them further away
	transform			   = list( 1, 0, 0,  0  ,
								   0, 1, 0,  0  ,
								   0, 0, 1, 1/10, //Get twice as Small every 10 Z
								   0, 0, 0,  1  )

//Animate particle effect to a severity
/particles/weather/proc/animateSeverity(severity_mod)

	//If we have no severity, just stop spawning
	if(!severity_mod)
		spawning = 0
		return

	var newWind = wind * severity_mod * pick(-1,1) //Wind can go left OR right!
	var newSpawning = max(minSpawning, maxSpawning * severity_mod)

	//gravity might be x, xy, or xyz
	var/newGravity = gravity
	if(length(newGravity))
		newGravity[1] = newWind
	else
		newGravity = list(newWind)

	//The higher the severity, the faster the change - elastic easing for flappy wind
	gravity = newGravity
	spawning = newSpawning
	// animate(src, gravity=newGravity, spawning=newSpawning, time=1/severity * 10, easing=ELASTIC_EASING)


//Rain - goes down
/particles/weather/rain
	icon_state             = "drop"
	color                  = "#ccffff"
	position               = generator("box", list(-500,-256,0), list(400,500,0))
	grow			       = list(-0.01,-0.01)
	gravity                = list(0, -10, 0.5)
	drift                  = generator("circle", 0, 1) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	transform 			   = null // Rain is directional - so don't make it "3D"
	//Weather effects, max values
	maxSpawning            = 100
	minSpawning            = 50
	wind                   = 2
	spin                   = 0 // explicitly set spin to 0 - there is a bug that seems to carry generators over from old particle effects


//Snow - goes down and swirls
/particles/weather/snow
	icon_state             = list("cross"=2, "snow_1"=5, "snow_2"=2, "snow_3"=2,)
	color                  = "#ffffff"
	position               = generator("box", list(-500,-256,5), list(500,500,0))
	spin                   = generator("num",-10,10)
	gravity                = list(0, -2, 0.1)
	drift                  = generator("circle", 0, 3) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	//Weather effects, max values
	maxSpawning           = 50
	minSpawning           = 10
	wind                  = 2

/particles/weather/snowstorm
	icon_state             = list("cross"=2, "snow_1"=5, "snow_2"=2, "snow_3"=2,)
	color                  = "#ffffff"
	position               = generator("box", list(-500,-256,5), list(500,500,0))
	spin                   = generator("num",-10,10)
	gravity                = list(0, -2, 0.1)
	drift                  = generator("circle", 0, 3.5) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	//Weather effects, max values
	maxSpawning           = 80
	minSpawning           = 50
	wind                  = 2.5


//Dust - goes sideways and swirls
/particles/weather/dust
	icon_state             = list("dot"=5, "cross"=1)
	gradient               = list(0,"#422a1de3",10,"#853e1be3","loop")
	color                  = 0
	color_change		   = generator("num",0,3)
	spin                   = generator("num",-5,5)
	position               = generator("box", list(-500,-256,0), list(500,500,0))
	gravity                = list(-5 -1, 0.1)
	drift                  = generator("circle", 0, 3) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	//Weather effects, max values
	maxSpawning           = 50
	minSpawning           = 20
	wind                  = 10


//Rads - goes fucking everywhere
/particles/weather/rads
	icon_state              = list("dot"=5, "cross"=1)

	gradient               = list(0,"#54d832",1,"#1f2720",2,"#aad607",3,"#5f760d",4,"#484b3f","loop")
	color                  = 0
	color_change		   = generator("num",-5,5)
	position               = generator("box", list(-500,-256,0), list(500,500,0))
	gravity                = list(-5 -1, 0.1)
	drift                  = generator("circle", 0, 5) // Some random movement for variation
	friction               = 0.3  // shed 30% of velocity and drift every 0.1s
	//Weather effects, max values
	maxSpawning           = 50
	minSpawning           = 20
	wind                  = 10
