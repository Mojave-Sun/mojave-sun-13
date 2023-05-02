/////////////////////////////////////////////////////////////
/////////////////// MOJAVE SUN DECALS ///////////////////////
/////////////////////////////////////////////////////////////

//Most decals are automatically added by the code to save mapping hassle but additonal customisation code is found here.

//Road Decals

/obj/effect/turf_decal/ms13/road
	icon = 'mojave/icons/decals/road_decals.dmi'

/obj/effect/turf_decal/ms13/road/Initialize(mapload)
	. = ..()
	if(prob(35))
		icon_state = "[initial(icon_state)]-[rand(1,2)]"

/obj/effect/turf_decal/ms13/road/horizontalline
	icon_state = "horizontal_line"

/obj/effect/turf_decal/ms13/road/verticalline
	icon_state = "vertical_line"

/obj/effect/turf_decal/ms13/road/horizontalcrossing
	icon_state = "horizontal_crossing"

/obj/effect/turf_decal/ms13/road/verticalcrossing
	icon_state = "vertical_crossing"

// Street drains

/obj/effect/turf_decal/ms13/road/drain
	icon_state = "drain"

//Water drains

/obj/effect/turf_decal/ms13/showerdrains
	icon = 'mojave/icons/decals/shower_drains.dmi'

/obj/effect/turf_decal/ms13/showerdrains/small
	icon_state = "small"

/obj/effect/turf_decal/ms13/showerdrains/square
	icon_state = "square"

/obj/effect/turf_decal/ms13/showerdrains/long
	icon_state = "long"

// Fallout shelter signage

/obj/effect/turf_decal/ms13/sheltersigns
	icon = 'mojave/icons/decals/shelter_signs.dmi'

/obj/effect/turf_decal/ms13/sheltersigns/arrow_left
	icon_state = "arrowshelter_left"

/obj/effect/turf_decal/ms13/sheltersigns/arrow_right
	icon_state = "arrowshelter_right"

/obj/effect/turf_decal/ms13/sheltersigns/fallout
	icon_state = "falloutshelter"

/obj/effect/turf_decal/ms13/sheltersigns/shelteryellow
	icon_state = "shelteryellow"

/obj/effect/turf_decal/ms13/sheltersigns/shelteryellow_left
	icon_state = "shelteryellow_left"

/obj/effect/turf_decal/ms13/sheltersigns/shelteryellow_right
	icon_state = "shelteryellow_right"

/obj/effect/turf_decal/ms13/sheltersigns/shelteryellow_circle
	icon_state = "shelteryellow_circle"

// Graffiti

/obj/effect/turf_decal/ms13/graffiti
	icon = 'mojave/icons/decals/graffiti.dmi'

/obj/effect/turf_decal/ms13/graffiti/questionmarks
	icon_state = "riddler1"

/obj/effect/turf_decal/ms13/graffiti/questionmarks2
	icon_state = "riddler2"

/obj/effect/turf_decal/ms13/graffiti/questionmarks3
	icon_state = "riddler3"

/obj/effect/turf_decal/ms13/graffiti/fuckncr
	icon_state = "fuckncr"

/obj/effect/turf_decal/ms13/graffiti/fuckyou
	icon_state = "fuckyou"

/obj/effect/turf_decal/ms13/graffiti/legion
	icon_state = "legion"

/obj/effect/turf_decal/ms13/graffiti/phoenix
	icon_state = "phoenix"

/obj/effect/turf_decal/ms13/graffiti/desertrangers
	icon_state = "rangers"

/obj/effect/turf_decal/ms13/graffiti/fortretard
	icon_state = "fort"

/obj/effect/turf_decal/ms13/graffiti/stop
	icon_state = "stop"

/obj/effect/turf_decal/ms13/graffiti/clueless
	icon_state = "clueless"

/obj/effect/turf_decal/ms13/graffiti/clueless/green
	icon_state = "clueless_green"

/obj/effect/turf_decal/ms13/graffiti/dontopen
	icon_state = "dontopen"

/obj/effect/turf_decal/ms13/graffiti/deadinside
	icon_state = "deadinside"

/obj/effect/turf_decal/ms13/graffiti/gangshit
	icon_state = "gangshit"

/obj/effect/turf_decal/ms13/graffiti/arrows_yellow
	icon_state = "arrows_yellow"

/obj/effect/turf_decal/ms13/graffiti/free
	icon_state = "free"

/obj/effect/turf_decal/ms13/graffiti/moyai
	icon_state = "moyai"

/obj/effect/turf_decal/ms13/graffiti/ourtown
	icon_state = "ourtown"

/obj/effect/turf_decal/ms13/graffiti/eyes
	icon_state = "eyes"

/obj/effect/turf_decal/ms13/graffiti/many_eyes
	icon_state = "many_eyes"

/obj/effect/turf_decal/ms13/graffiti/mirelurk
	icon_state = "mirelurk"

/obj/effect/turf_decal/ms13/graffiti/deadcount
	icon_state = "deadcount"

/obj/effect/turf_decal/ms13/graffiti/ghouls
	icon_state = "ghouls"

/obj/effect/turf_decal/ms13/graffiti/crabs
	icon_state = "crabs"

/obj/effect/turf_decal/ms13/graffiti/aid
	icon_state = "aid"

/obj/effect/turf_decal/ms13/graffiti/guns
	icon_state = "guns"

/obj/effect/turf_decal/ms13/graffiti/below
	icon_state = "below"

/obj/effect/turf_decal/ms13/graffiti/followwater
	icon_state = "follow"

/obj/effect/turf_decal/ms13/graffiti/no_way
	icon_state = "noway"

/obj/effect/turf_decal/ms13/graffiti/dead
	icon_state = "dead"

/obj/effect/turf_decal/ms13/graffiti/verydead
	icon_state = "verydead"

/obj/effect/turf_decal/ms13/graffiti/camp_east
	icon_state = "camp_east"

/obj/effect/turf_decal/ms13/graffiti/camp_west
	icon_state = "camp_west"

/obj/effect/turf_decal/ms13/graffiti/camp_north
	icon_state = "camp_north"

/obj/effect/turf_decal/ms13/graffiti/camp_south
	icon_state = "camp_south"

/obj/effect/turf_decal/ms13/graffiti/ladder_east
	icon_state = "ladder_east"

/obj/effect/turf_decal/ms13/graffiti/ladder_west
	icon_state = "ladder_west"

/obj/effect/turf_decal/ms13/graffiti/ladder_north
	icon_state = "ladder_north"

/obj/effect/turf_decal/ms13/graffiti/ladder_south
	icon_state = "ladder_south"

/obj/effect/turf_decal/ms13/graffiti/scorpion_east
	icon_state = "scorpion_east"

/obj/effect/turf_decal/ms13/graffiti/scorpion_west
	icon_state = "scorpion_west"

/obj/effect/turf_decal/ms13/graffiti/scorpion_north
	icon_state = "scorpion_north"

/obj/effect/turf_decal/ms13/graffiti/scorpion_south
	icon_state = "scorpion_south"

/obj/effect/turf_decal/ms13/graffiti/large
	icon = 'mojave/icons/decals/graffiti64x32.dmi'

/obj/effect/turf_decal/ms13/graffiti/large/nogod_red
	icon_state = "nogod_red"

/obj/effect/turf_decal/ms13/graffiti/large/nogod_black
	icon_state = "nogod_black"

/obj/effect/turf_decal/ms13/graffiti/large/nofuture_red
	icon_state = "nofuture_red"

/obj/effect/turf_decal/ms13/graffiti/large/nofuture_black
	icon_state = "nofuture_black"

// Posters

/obj/effect/turf_decal/ms13/poster
	icon = 'mojave/icons/decals/posters.dmi'

/obj/effect/turf_decal/ms13/poster/vault
	icon_state = "vault_sign"

//Wallpapers and Wall Coverings

/obj/effect/turf_decal/ms13/covering
	icon = 'mojave/icons/decals/wallcovering.dmi'

//Wallpapers

/obj/effect/turf_decal/ms13/covering/wallpaper/green
	icon_state = "wallpaper_green"

/obj/effect/turf_decal/ms13/covering/wallpaper/blue
	icon_state = "wallpaper_blue"

/obj/effect/turf_decal/ms13/covering/wallpaper/blue/stripes
	icon_state = "wallpaper_stripes"

/obj/effect/turf_decal/ms13/covering/wallpaper/red
	icon_state = "wallpaper_red"

//Tiles

/obj/effect/turf_decal/ms13/covering/tiles/blue
	icon_state = "tiles_cyan"

/obj/effect/turf_decal/ms13/covering/tiles/white
	icon_state = "tiles_white"

//Paint

/obj/effect/turf_decal/ms13/covering/paint/gray
	icon_state = "paint_gray"

/obj/effect/turf_decal/ms13/covering/paint/white
	icon_state = "paint_white"

/obj/effect/turf_decal/ms13/covering/paint/red
	icon_state = "paint_red"

/obj/effect/turf_decal/ms13/covering/paint/yellow
	icon_state = "paint_yellow"

/obj/effect/turf_decal/ms13/covering/paint/green
	icon_state = "paint_green"

/obj/effect/turf_decal/ms13/covering/paint/blue
	icon_state = "paint_blue"
