// Actual fishing, this will usher in a new era for Fallout13

// Fishing structures

/obj/structure/ms13/ice_hole
	name = "ice hole"
	desc = "A hole in the ice. Good for fishing."
	icon = 'mojave/icons/turf/fishing_hole.dmi'
	icon_state = "ice_hole"
	var/list/fish = list(/obj/item/food/meat/slab/ms13/fish/sockeye = 1,
		/obj/item/food/meat/slab/ms13/fish/smallmouth = 1,
		/obj/item/food/meat/slab/ms13/fish/largemouth = 1,
		/obj/item/food/meat/slab/ms13/fish/lamprey = 1,
		/obj/item/food/meat/slab/ms13/fish/pink = 1,
		/obj/item/food/meat/slab/ms13/fish/chum = 1,
		/obj/item/food/meat/slab/ms13/fish/sturgeon = 1,
		/obj/item/food/meat/slab/ms13/fish/asian = 1,
		/obj/item/food/meat/slab/ms13/fish/blinky = 1)
	var/fished = FALSE

/obj/structure/ms13/ice_hole/attackby(obj/item/W, mob/user, params)
	. = ..()
	if(W.tool_behaviour == TOOL_FISHINGROD)
		if(!can_fish(user))
			return TRUE

		if(!isturf(user.loc))
			return

		to_chat(user, "<span class='notice'>You start fishing...</span>")

		if(do_after(user, 30 SECONDS))
			if(!can_fish(user))
				return TRUE
			to_chat(user, "<span class='notice'>You reel in your catch.</span>")
			getFished(user)

/obj/structure/ms13/ice_hole/proc/getFished(mob/user)
	var/spawnFish = pick_weight(fish)
	new spawnFish(user.loc)
	fished = TRUE

/obj/structure/ms13/ice_hole/proc/can_fish(mob/user)
	if(!fished)
		return TRUE
	if(user)
		to_chat(user, "<span class='warning'>Looks like there's no fish here!</span>")
