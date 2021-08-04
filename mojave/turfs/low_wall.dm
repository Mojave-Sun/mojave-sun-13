/obj/structure/table/low_wall
	name = "base class low wall"
	desc = "Abandon hope"
	icon = 'icons/obj/smooth_structures/table.dmi'
	icon_state = "low-0"
	base_icon_state = "low"
	frame = null
	max_integrity = 1000
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_LOW_WALL)
	canSmoothWith= list(SMOOTH_GROUP_MS13_LOW_WALL)

/obj/structure/table/low_wall/Initialize(mapload)
	. = ..()
	for(var/obj/structure/table/low_wall/LAT in loc)
		if(LAT == src)
			continue
		stack_trace("multiple low_walls found in ([loc.x], [loc.y], [loc.z])")
		return INITIALIZE_HINT_QDEL

/obj/structure/table/low_wall/metal
	name = "low metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/metal.dmi'

/obj/structure/table/low_wall/metal/rust
	name = "low rusted metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rustmetal.dmi'

/obj/structure/table/low_wall/wood
	name = "low wood wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/wood.dmi'

/obj/structure/table/low_wall/wood/log
	name = "low log wall"
	icon = 'mojave/icons/turf/walls/woodlog.dmi'

/obj/structure/table/low_wall/scrap
	name = "low scrap wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/scrap.dmi'

/obj/structure/table/low_wall/scrap/white
	icon = 'mojave/icons/turf/walls/scrapwhite.dmi'

/obj/structure/table/low_wall/scrap/red
	icon = 'mojave/icons/turf/walls/scrapred.dmi'

/obj/structure/table/low_wall/scrap/blue
	icon = 'mojave/icons/turf/walls/scrapblue.dmi'

/obj/structure/table/low_wall/concrete
	icon = 'mojave/icons/turf/walls/concrete.dmi'

/obj/structure/table/low_wall/adobe
	name = "low adobe wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/adobe.dmi'

/obj/structure/table/low_wall/brick
	name = "low brick wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/brick.dmi'

/obj/structure/table/low_wall/brick/alt
	icon = 'mojave/icons/turf/walls/brickalt.dmi'

/obj/structure/table/low_wall/brick/gray
	icon = 'mojave/icons/turf/walls/brickgray.dmi'

/obj/structure/table/low_wall/reinforced
	name = "base class low reinforced wall"
	desc = ""
	icon = 'icons/obj/smooth_structures/table.dmi'

/obj/structure/table/low_wall/reinforced/metal
	name = "low reinforced metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rmetal.dmi'

/obj/structure/table/low_wall/reinforced/metal/rust
	name = "rusted low reinforced metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rrustmetal.dmi'
	base_icon_state = "reinforced_rust_low"

/obj/structure/table/low_wall/reinforced/bunker
	name = "low bunker wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/bunker.dmi'
