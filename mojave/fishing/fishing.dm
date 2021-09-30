// Actual fishing, this will usher in a new era for Fallout13

// Fishing tiles

/obj/structure/ms13/ice_hole
	name = "ice hole"
	desc = "A hole in the ice. Good for fishing."
	icon = 'mojave/icons/turf/ice.dmi'
	icon_state = "hole_overlay"
	var/list/fish = list(/obj/item/reagent_containers/food/snacks/meat/slab/fish/sockeye,
		/obj/item/reagent_containers/food/snacks/meat/slab/fish/smallmouth,
		/obj/item/reagent_containers/food/snacks/meat/slab/fish/largemouth,
		/obj/item/reagent_containers/food/snacks/meat/slab/fish/lamprey,
		/obj/item/reagent_containers/food/snacks/meat/slab/fish/pink,
		/obj/item/reagent_containers/food/snacks/meat/slab/fish/chum,
		/obj/item/reagent_containers/food/snacks/meat/slab/fish/sturgeon,
		/obj/item/reagent_containers/food/snacks/meat/slab/fish/asian,
		/obj/item/reagent_containers/food/snacks/meat/slab/fish/blinky)
	var/fished = FALSE

/obj/structure/ms13/ice_hole/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(!.)
		if(W.tool_behaviour == TOOL_FISHINGROD)
			if(!can_fish(user))
				return TRUE

			if(!isturf(user.loc))
				return

			to_chat(user, "<span class='notice'>You start fishing...</span>")

			if(do_after(user, /obj/item/ms13/tools/fishing_rod.fish_speed))
			if(!can_fish(user))
				return TRUE
			to_chat(user, "<span class='notice'>You reel in your catch.</span>")
			getFished()

/obj/structure/ms13/ice_hole/proc/getFished()
	var/spawnFish = pickweight(fish)
	new spawnFish(src)
	fished = TRUE

/obj/structure/ms13/ice_hole/proc/can_fish(mob/user)
	if(!fished)
		return TRUE
	if(user)
		to_chat(user, "<span class='warning'>Looks like there's no fish here!</span>")
