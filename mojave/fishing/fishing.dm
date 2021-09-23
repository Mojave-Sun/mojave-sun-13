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
		if(istype(W, /obj/item/fishing_rod))
			var/obj/item/fishing_rod/the_rod = W
			if(!can_fish(user))
				return TRUE

			if(!isturf(user.loc))
				return

			to_chat(user, "<span class='notice'>You start fishing...</span>")

			if(do_after(user, /obj/item/fishing_rod.fish_speed))
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

// Fishing rods

/obj/item/ms13/fishing_rod
	name = "fishing rod"
	desc = "You shouldn't be seeing this. LOOK AWAY."
	icon = 'fallout/icons/objects/fishing_rods.dmi'
	var/fish_speed = 600 SECONDS

/obj/item/ms13/fishing_rod/basic
	name = "wooden rod"
	desc = "A wooden fishing rod. Capable and proven."
	icon_state = "basic"
	lefthand_file = 'fallout/icons/mob/inhands/equipment/basic_lefthand.dmi'
	righthand_file = 'fallout/icons/mob/inhands/equipment/basic_righthand.dmi'
	w_class_on = WEIGHT_CLASS_NORMAL
	fish_speed = 60 SECONDS

/obj/item/ms13/fishing_rod/telescopic
	name = "telescoping rod"
	desc = "A telescoping fishing rod, perfect to store away in your bag."
	icon_state = "telescopic"
	lefthand_file = 'fallout/icons/mob/inhands/equipment/telescopic_lefthand.dmi'
	righthand_file = 'fallout/icons/mob/inhands/equipment/telescopic_righthand.dmi'
	w_class = WEIGHT_CLASS_SMALL
	var/on_sound = 'sound/weapons/batonextend.ogg'

/obj/item/ms13/fishing_rod/telescopic/Initialize()
	. = ..()
	AddComponent(/datum/component/transforming, \
		w_class_on = WEIGHT_CLASS_NORMAL, \
		fish_speed = 40 SECONDS
	RegisterSignal(src, COMSIG_TRANSFORMING_ON_TRANSFORM, .proc/on_transform)

/obj/item/ms13/fishing_rod/advanced
	name = "advanced rod"
	desc = "A professional, high-end fishing rod, state of the art fishing technology. They don't make them like this anymore."
	icon_state = "advanced"
	lefthand_file = 'fallout/icons/mob/inhands/equipment/advanced_lefthand.dmi'
	righthand_file = 'fallout/icons/mob/inhands/equipment/advanced_righthand.dmi'
	w_class_on = WEIGHT_CLASS_NORMAL
	fish_speed = 20 SECONDS
