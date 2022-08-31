/obj/effect/landmark/start/bountyhunter
	name = "bounty hunter"
	icon = 'mojave/icons/effects/landmarks_static.dmi'
	icon_state = "bhunter_spawn"

/obj/effect/landmark/start/bountyhunter/Initialize(mapload)
	..()
	GLOB.bountyhunterstart += loc
	return INITIALIZE_HINT_QDEL
