/////////////////////////////////////////////////////////////
/////////////  MOJAVE SUN CREATURE PRODUCE //////////////////
/////////////////////////////////////////////////////////////

/obj/item/food/ms13/egg
	name = "generic egg"
	desc = "The most generic of ms13 eggs, shoot the admin that spawned this."
	icon = 'mojave/icons/mob/animalproduce.dmi'
	icon_state = "egg"
	food_reagents = list(/datum/reagent/consumable/eggyolk = 2, /datum/reagent/consumable/eggwhite = 4)
	foodtypes = GROSS | TOXIC

/obj/item/food/ms13/egg/ms13/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	if(!..())
		var/turf/T = get_turf(hit_atom)
		new /obj/effect/decal/cleanable/food/egg_smudge(T)
		qdel(src)

/obj/item/food/ms13/egg/ms13/clucker
	name = "clucker egg"
	desc = "The egg of a clucker, large and nutritious."
	color = "#a39734"

/obj/item/food/ms13/egg/ms13/radroach
	name = "radroach egg"
	desc = "The slimy egg of a radroach, round and gross."
	icon_state = "egg_round"
	color = "#2e2900"

/obj/item/food/ms13/egg/ms13/gecko
	name = "gecko egg"
	desc = "The smooth egg of a gecko, extremely nutritious."
	color = "#383e47"
	food_reagents = list(/datum/reagent/consumable/eggyolk = 5, /datum/reagent/consumable/eggwhite = 15)

/obj/item/food/ms13/egg/ms13/mirelurk
	name = "mirelurk egg"
	desc = "The slimy egg of a mirelurk, round and nutritious."
	icon_state = "egg_round"
	color = "#253f1dff"

/obj/item/food/ms13/egg/ms13/ant
	name = "ant egg"
	desc = "The bumpy egg of a ant, gross."
	icon_state = "egg_round"
	color = "#642d18"

/obj/item/food/ms13/egg/ms13/nightstalker
	name = "nightstalker egg"
	desc = "The huge egg of a nightstalker, extremely nutritious."
	color = "#006370"
	food_reagents = list(/datum/reagent/consumable/eggyolk = 15, /datum/reagent/consumable/eggwhite = 35)
