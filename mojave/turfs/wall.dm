/turf/closed/wall/ms13
	name = "base class wall"
	desc = "God has abandoned us"
	icon_state = "wall-0"
	base_icon_state = "wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_WALL)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WALL)
	var/weldable = FALSE

/turf/closed/wall/ms13/try_decon(obj/item/I, mob/user, turf/T)
	if(!weldable)
		return
	else
		. = ..()

/turf/closed/wall/ms13/ex_act()
	return

/turf/closed/wall/ms13/deconstruction_hints()
	return

/turf/closed/wall/ms13/metal
	name = "metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/metal.dmi'
	frill_icon = 'mojave/icons/turf/walls/metal_frill.dmi'

/turf/closed/wall/ms13/metal/rust
	name = "rusted metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rustmetal.dmi'
	frill_icon = 'mojave/icons/turf/walls/rustmetal_frill.dmi'

/turf/closed/wall/ms13/wood
	name = "log wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/wood.dmi'
	frill_icon = 'mojave/icons/turf/walls/wood_frill.dmi'

/turf/closed/wall/ms13/wood/fresh
	name = "fresh log wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/woodfresh.dmi'
	frill_icon = 'mojave/icons/turf/walls/woodfresh_frill.dmi'

/turf/closed/wall/ms13/scrap
	name = "scrap wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/scrap.dmi'
	frill_icon = 'mojave/icons/turf/walls/scrap_frill.dmi'

/turf/closed/wall/ms13/scrap/white
	icon = 'mojave/icons/turf/walls/scrapwhite.dmi'
	frill_icon = 'mojave/icons/turf/walls/scrapwhite_frill.dmi'

/turf/closed/wall/ms13/scrap/red
	icon = 'mojave/icons/turf/walls/scrapred.dmi'
	frill_icon = 'mojave/icons/turf/walls/scrapred_frill.dmi'

/turf/closed/wall/ms13/scrap/blue
	icon = 'mojave/icons/turf/walls/scrapblue.dmi'
	frill_icon = 'mojave/icons/turf/walls/scrapblue_frill.dmi'

/turf/closed/wall/ms13/adobe //need
	name = "adobe wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/adobe.dmi'
	frill_icon = 'mojave/icons/turf/walls/adobe_frill.dmi'

/turf/closed/wall/ms13/brick
	name = "brick wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/brick.dmi'
	frill_icon = 'mojave/icons/turf/walls/brick_frill.dmi'

/turf/closed/wall/ms13/brick/alt
	icon = 'mojave/icons/turf/walls/brickalt.dmi'
	frill_icon = 'mojave/icons/turf/walls/brickalt_frill.dmi'

/turf/closed/wall/ms13/brick/gray
	icon = 'mojave/icons/turf/walls/brickgray.dmi'
	frill_icon = 'mojave/icons/turf/walls/brickgray_frill.dmi'

/turf/closed/wall/ms13/metal/reinforced
	name = "reinforced metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rmetal.dmi'
	frill_icon = 'mojave/icons/turf/walls/rmetal_frill.dmi'

/turf/closed/wall/ms13/metal/reinforced/industrial
	name = "reinforced metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rusty_industrial.dmi'
	frill_icon = 'mojave/icons/turf/walls/rusty_industrial_frill.dmi'

/turf/closed/wall/ms13/metal/reinforced/rust
	name = "rusted reinforced metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/rrustmetal.dmi'
	frill_icon = 'mojave/icons/turf/walls/rrustmetal_frill.dmi'

/turf/closed/wall/ms13/concrete
	name = "concrete wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/concrete.dmi'
	frill_icon = 'mojave/icons/turf/walls/concrete_frill.dmi'

/turf/closed/wall/ms13/concrete/alt
	icon = 'mojave/icons/turf/walls/concretealt.dmi'
	frill_icon = 'mojave/icons/turf/walls/concretealt_frill.dmi'

/turf/closed/wall/ms13/sewer
	name = "sewer wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/sewer.dmi'
	frill_icon = 'mojave/icons/turf/walls/sewer_frill.dmi'

/turf/closed/wall/ms13/bunker
	name = "bunker wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/bunker.dmi'
	frill_icon = 'mojave/icons/turf/walls/bunker_frill.dmi'

/turf/closed/indestructible/ms13/metal
	name = "metal wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/metal.dmi'
	frill_icon = 'mojave/icons/turf/walls/metal_frill.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_WALL)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WALL)

/turf/closed/indestructible/ms13/comb
	name = "comb wall"
	desc = "honeybeast comb, lining the walls. They subtly drip a substance."
	icon = 'mojave/icons/turf/walls/comb.dmi'
	frill_icon = 'mojave/icons/turf/walls/comb_frill.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
	smoothing_flags = SMOOTH_BITMASK
	smoothing_groups = list(SMOOTH_GROUP_MS13_WALL)
	canSmoothWith= list(SMOOTH_GROUP_MS13_WALL)

// Vault Walls //

/turf/closed/wall/ms13/vault
	name = "vault wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/vault_wall.dmi'
	frill_icon = 'mojave/icons/turf/walls/vault_wall_rust_frill.dmi'

/turf/closed/wall/ms13/vault/vent
	name = "vent section"
	desc = ""
	icon_state = "wall-141"
	icon = 'mojave/icons/turf/walls/vault_vent.dmi'
	frill_icon = 'mojave/icons/turf/walls/vault_vent_frill.dmi'

/turf/closed/wall/ms13/vault/rust
	name = "vault wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/vault_wall_rust.dmi'
	frill_icon = 'mojave/icons/turf/walls/vault_wall_rust_frill.dmi'

/turf/closed/wall/ms13/vault/rust/vent
	name = "vent section"
	desc = ""
	icon_state = "wall-141"
	icon = 'mojave/icons/turf/walls/vault_vent_rust.dmi'
	frill_icon = 'mojave/icons/turf/walls/vault_vent_rust_frill.dmi'

// Dungeon Walls //

/turf/closed/wall/ms13/dungeon
	name = "reinforced bunker wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/dungeon_1.dmi'
	frill_icon = 'mojave/icons/turf/walls/dungeon_1_frill.dmi'

/turf/closed/wall/ms13/dungeon/Initialize()
	. = ..()
	var/state = rand(1,4)
	switch(state)
		if(1)
			icon = 'mojave/icons/turf/walls/dungeon_1.dmi'
			frill_icon = 'mojave/icons/turf/walls/dungeon_1_frill.dmi'
		if(2)
			icon = 'mojave/icons/turf/walls/dungeon_2.dmi'
			frill_icon = 'mojave/icons/turf/walls/dungeon_2_frill.dmi'
		if(3)
			icon = 'mojave/icons/turf/walls/dungeon_3.dmi'
			frill_icon = 'mojave/icons/turf/walls/dungeon_3_frill.dmi'
		if(4)
			icon = 'mojave/icons/turf/walls/dungeon_4.dmi'
			frill_icon = 'mojave/icons/turf/walls/dungeon_4_frill.dmi'
		else
			return

/turf/closed/wall/ms13/dungeon/rust
	name = "reinforced bunker wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/dungeon_rust_1.dmi'
	frill_icon = 'mojave/icons/turf/walls/dungeon_rust_1_frill.dmi'

/turf/closed/wall/ms13/dungeon/rust/Initialize()
	. = ..()
	var/state = rand(1,4)
	switch(state)
		if(1)
			icon = 'mojave/icons/turf/walls/dungeon_rust_1.dmi'
			frill_icon = 'mojave/icons/turf/walls/dungeon_rust_1_frill.dmi'
		if(2)
			icon = 'mojave/icons/turf/walls/dungeon_rust_2.dmi'
			frill_icon = 'mojave/icons/turf/walls/dungeon_rust_2_frill.dmi'
		if(3)
			icon = 'mojave/icons/turf/walls/dungeon_rust_3.dmi'
			frill_icon = 'mojave/icons/turf/walls/dungeon_rust_3_frill.dmi'
		if(4)
			icon = 'mojave/icons/turf/walls/dungeon_rust_4.dmi'
			frill_icon = 'mojave/icons/turf/walls/dungeon_rust_4_frill.dmi'
		else
			return

//Player Craftable Walls

/turf/closed/wall/ms13/craftable
	name = "base class craftable wall"
	desc = "God has abandoned us, with functionality"
	baseturfs = /turf/open/floor/plating/ms13/ground/desert
	weldable = TRUE

/turf/closed/wall/ms13/craftable/scrap
	name = "rough scrap wall"
	desc = ""
	icon = 'mojave/icons/turf/walls/roughscrap.dmi'
	frill_icon = 'mojave/icons/turf/walls/roughscrap_1_frill.dmi'

/turf/closed/wall/ms13/craftable/scrap/Initialize()
	. = ..()
	var/state = rand(1,3)
	switch(state)
		if(1)
			icon = 'mojave/icons/turf/walls/roughscrap_2.dmi'
			frill_icon = 'mojave/icons/turf/walls/roughscrap_2_frill.dmi'
		if(2)
			icon = 'mojave/icons/turf/walls/roughscrap_3.dmi'
			frill_icon = 'mojave/icons/turf/walls/roughscrap_3_frill.dmi'
		else
			return

//Wall Supports

/obj/structure/girder/ms13
	name = "base class wall support"
	desc = "No more girder spam, circa mojave sun - 2021"
	can_displace = FALSE
	girderpasschance = 100
	icon = 'mojave/icons/turf/walls/girder.dmi'
	var/list/material_used
	var/wall_type = /turf/closed/wall/ms13/craftable

/obj/structure/girder/ms13/bars
	name = "rebar supports"
	desc = "Quick and cheap building supports for ghetto constructions."
	icon_state = "rebar"
	material_used = list(/obj/item/stack/sheet/ms13/scrap)
	wall_type = /turf/closed/wall/ms13/craftable/scrap

/obj/structure/girder/ms13/bars/Initialize()
	. = ..()
	AddElement(/datum/element/climbable, 3 SECONDS, climb_stun = 0)
