/obj/item/shard
	grind_results = list(
		/datum/reagent/toxin/ms13/fiberglass = 10,
	)

//yummy glass shard yum yum
/obj/item/shard/Initialize(mapload)
	. = ..()
	var/static/list/glass_reagents = list(/datum/reagent/toxin/ms13/fiberglass = 10)
	AddComponent(/datum/component/edible,\
				initial_reagents = glass_reagents,\
				foodtypes = GROSS,\
				volume = 10)
