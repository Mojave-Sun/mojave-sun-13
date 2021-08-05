//Mojave Sun general flora directory

//Ash Flora Type Plants but MS13 FORAGE EDITION

/obj/structure/flora/ms13/forage
	gender = PLURAL
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER
	icon = 'mojave/icons/flora/wastelandflora.dmi'
	icon_state = "tarberry"
	name = "tarberry shrub"
	desc = "A plant bearing a dark and sticky berry, found in cold and damp environments."
	var/harvested_name = "tarberry"
	var/harvested_desc = "A dark and sticky berry, found in cold and damp environments."
	var/needs_sharp_harvest = FALSE
	var/harvest = /obj/item/food/grown/ms13/tarberry
	var/harvest_amount_low = 1
	var/harvest_amount_high = 4
	var/harvest_time = 60
	var/harvest_message_low = "You harvest the berries, but fail to attain many of them."
	var/harvest_message_med = "You harvest the berries, collecting a decent amount from the forage."
	var/harvest_message_high = "You harvest and collect many berries from the wild plant."
	var/harvested = FALSE
	var/base_icon
	var/regrowth_time_low = 8 MINUTES
	var/regrowth_time_high = 16 MINUTES

/obj/structure/flora/ms13/forage/Initialize()
	. = ..()
	base_icon = "[icon_state][rand(1, 3)]"
	icon_state = base_icon
	pixel_x = rand(-3, 3)
	pixel_y = rand(-3, 3)

/obj/structure/flora/ms13/forage/proc/harvest(user)
	if(harvested)
		return 0

	var/rand_harvested = rand(harvest_amount_low, harvest_amount_high)
	if(rand_harvested)
		if(user)
			var/msg = harvest_message_med
			if(rand_harvested == harvest_amount_low)
				msg = harvest_message_low
			else if(rand_harvested == harvest_amount_high)
				msg = harvest_message_high
			to_chat(user, "<span class='notice'>[msg]</span>")
		for(var/i in 1 to rand_harvested)
			new harvest(get_turf(src))

	icon_state = "[base_icon]p"
	name = harvested_name
	desc = harvested_desc
	harvested = TRUE
	addtimer(CALLBACK(src, .proc/regrow), rand(regrowth_time_low, regrowth_time_high))
	return 1

/obj/structure/flora/ms13/forage/proc/regrow()
	icon_state = base_icon
	name = initial(name)
	desc = initial(desc)
	harvested = FALSE

/obj/structure/flora/ms13/forage/attackby(obj/item/W, mob/user, params)
	if(!harvested && needs_sharp_harvest && W.get_sharpness())
		user.visible_message("<span class='notice'>[user] starts to harvest from [src] with [W].</span>","<span class='notice'>You begin to harvest from [src] with [W].</span>")
		if(do_after(user, harvest_time, target = src))
			harvest(user)
	else
		return ..()

/obj/structure/flora/ms13/forage/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(!harvested && !needs_sharp_harvest)
		user.visible_message("<span class='notice'>[user] starts to harvest from [src].</span>","<span class='notice'>You begin to harvest from [src].</span>")
		if(do_after(user, harvest_time, target = src))
			harvest(user)

/obj/structure/flora/ms13/forage/blackberry
	icon_state = "blackberry"
	name = "blackberry shrub"
	desc = "A plant bearing a mutated version of blackberries, a sweet and bitter fruit."
	harvested_name = "blackberry"
	harvested_desc = "A radiation-induced mutated version of the pre-war blackberry."
	harvest = /obj/item/food/grown/ms13/blackberry

/obj/structure/flora/ms13/forage/mutfruit
	icon_state = "mutfruit"
	name = "mutfruit plant"
	desc = "A plant bearing Mutfruits, a native fruit providing both hydration and sustance, with the slight factor of radiation too."
	harvested_name = "mutfruit"
	harvested_desc = "A Mutfruit provides both hydration and sustenance, but the mutated plant also carries small amounts of radiation."
	harvest = /obj/item/food/grown/ms13/mutfruit
	harvest_message_low = "You harvest the fruits, but fail to attain many of them."
	harvest_message_med = "You harvest the fruits, collecting a decent amount from the forage."
	harvest_message_high = "You harvest and collect many fruits from the wild plant."
	harvest_amount_high = 2

/obj/structure/flora/ms13/forage/ashrose
	icon_state = "ashrose"
	name = "ashrose flowers"
	desc = "A patch of ash rose, a flower widely known for its use in expelling radiation and toxins from the body."
	harvested_name = "ash rose"
	harvested_desc = "A potent radiation and toxin healing flower."
	harvest = /obj/item/food/grown/ms13/ashrose
	harvest_message_low = "You harvest the flowers, but fail to salvage many of them."
	harvest_message_med = "You harvest the flowers, collecting a small bunch of them."
	harvest_message_high = "You harvest and collect many flowers from the patch."
	harvest_amount_high = 3
	regrowth_time_high = 30 MINUTES

/obj/structure/flora/ms13/forage/wildcarrot
	icon_state = "root"
	name = "wild carrot patch"
	desc = "A patch of wild carrots, a starchy mutated tuber carrying minor amounts of ardiation and well known for impromptu eye healing."
	harvested_name = "wild carrot"
	harvested_desc = "A wild root vegetable, useful for its mild sweetness and eye healing properties."
	harvest = /obj/item/food/grown/ms13/carrot
	harvest_message_low = "You dig up the roots, but fail to salvage many produce."
	harvest_message_med = "You dig up the roots, collecting a small bunch of carrots."
	harvest_message_high = "You dig up many roots from the patch, collecting a good harvest."
	harvest_amount_high = 3

/obj/structure/flora/ms13/forage/aster
	icon_state = "aster"
	name = "aster flowers"
	desc = "A patch of wild aster flowers, known for being a tasty additive to any meal, and also quite beautiful."
	harvested_name = "aster flower"
	harvest_time = 120
	harvested_desc = "Some tasty aster flowers."
	harvest = /obj/item/food/grown/ms13/aster
	harvest_message_low = "You accidentally destroy the delicate flowers, salvaging nothing."
	harvest_message_med = "You collect a handful of delicate flowers."
	harvest_message_high = "You delicately pick many flowers, collecting a good harvest."
	harvest_amount_low = 0
	harvest_amount_high = 7
	regrowth_time_high = 20 MINUTES

/obj/structure/flora/ms13/forage/mushroom
	icon = 'icons/obj/lavaland/ash_flora.dmi'
	color =  "#cd6c4b"
	icon_state = "t_mushroom"
	name = "cave fungus"
	desc = "A patch of edible cave mushroom, with multiple toxin healing and cooking properties."
	harvested_name = "cave fungus"
	harvested_desc = "An edible mushroom, with multiple toxin healing and cooking properties."
	harvest = /obj/item/food/grown/ms13/cavefungus
	harvest_message_low = "Gather a small amount of mushrooms from the cluster."
	harvest_message_med = "You collect a decent amount of mushrooms from the cluster."
	harvest_message_high = "You collect a hearty harvest from the mushroom cluster."
	harvest_amount_high = 3

/obj/structure/flora/ms13/forage/mushroom/glowing
	color =  "#98b752"
	icon_state = "r_mushroom"
	name = "glowing cave fungus"
	desc = "A patch of radioactive cave mushroom, with multiple potent toxin healing and radioactive properties."
	harvested_name = "glowing fungus"
	harvested_desc = "A radioactive cave mushroom, with multiple potent toxin healing and radioactive properties."
	harvest = /obj/item/food/grown/ms13/glowfungus
	light_range = 1.5
	light_power = 2.1
	light_color = "#3eff3e"

//Grasses

/obj/structure/flora/grass/wasteland
	icon = 'mojave/icons/flora/flora.dmi'
	desc = "Some dry, virtually dead grass."
	icon_state = "tall_grass_1"

/obj/structure/flora/grass/wasteland/New()
	..()
	icon_state = "tall_grass_[rand(5,8)]"

/obj/structure/flora/grass/wasteland/attackby(obj/item/W, mob/user, params) //we dont use /weapon any more
	if(W.sharpness && W.force > 0 && !(NODECONSTRUCT_1 in flags_1))
		to_chat(user, "You begin to harvest [src]...")
		if(do_after(user, 100/W.force, target = user))
			to_chat(user, "<span class='notice'>You've collected [src]</span>")
			var/obj/item/stack/sheet/hay/H = user.get_inactive_held_item()
			if(istype(H))
				H.add(1)
			else
				new /obj/item/stack/sheet/hay/(get_turf(src))
			qdel(src)
			return 1
	else
		. = ..()

/obj/structure/flora/grass/wasteland/snow
	icon = 'mojave/icons/flora/flora.dmi'
	desc = "Some frozen, virtually dead grass."
	icon_state = "snowgrass_1"

/obj/structure/flora/grass/wasteland/snow/New()
	..()
	icon_state = "snowgrass_[rand(1,8)]"

//Mojave Sun Trees/Large Foliage

//shrubs
/obj/structure/flora/ms13/shrub
	name = "shrub"
	desc = "An evergreen bush."
	anchored = TRUE
	pixel_x = -16
	layer = FLY_LAYER
	icon = 'mojave/icons/flora/trees.dmi'
	icon_state = "snowshrub_1"
	obj_integrity = 50
	max_integrity = 50
	var/proj_pass_rate = 100

/obj/structure/flora/ms13/shrub/New()
	icon_state = "snowshrub_[rand(1,3)]"
	..()

/obj/structure/flora/bush/ms13
	name = "bush"
	desc = "Some type of shrub."
	icon = 'mojave/icons/flora/flora.dmi'
	icon_state = "snowbush1"
	anchored = TRUE

/obj/structure/flora/bush/ms13/Initialize()
	icon_state = "snowbush_[rand(1,3)]"
	. = ..()

/obj/structure/flora/ms13/shrub/CanAllowThrough(atom/movable/mover, turf/target)//So bullets will fly over and stuff.
	. = ..()
	if(locate(/obj/structure/flora/ms13/shrub) in get_turf(mover))
		return TRUE
	else if(istype(mover, /obj/projectile))
		if(!anchored)
			return TRUE
		var/obj/projectile/proj = mover
		if(proj.firer && Adjacent(proj.firer))
			return TRUE
		if(prob(proj_pass_rate))
			return TRUE
		return FALSE

//trees

/obj/structure/flora/ms13/tree
	name = "tree"
	desc = "A large tree."
	density = TRUE
	pixel_x = -16
	layer = FLY_LAYER
	var/log_amount = 10
	opacity = 1

/obj/structure/flora/ms13/tree/attackby(obj/item/W, mob/user, params)
	if(log_amount && (!(flags_1 & NODECONSTRUCT_1)))
		if(W.sharpness == IS_SHARP_AXE)
			if(W.hitsound)
				playsound(get_turf(src), 'mojave/sound/ms13effects/wood_cutting.ogg', 100, FALSE, FALSE)
				user.visible_message("<span class='notice'>[user] begins to cut down [src] with [W].</span>","<span class='notice'>You begin to cut down [src] with [W].</span>", "<span class='hear'>You hear the sound of chopping.</span>")
				if(do_after(user, 1000/W.force, target = src)) //5 seconds with 20 force, 8 seconds with a hatchet, 20 seconds with a shard.
					user.visible_message("<span class='notice'>[user] fells [src] with the [W].</span>","<span class='notice'>You fell [src] with the [W].</span>", "<span class='hear'>You hear the sound of a tree falling.</span>")
					playsound(get_turf(src), 'sound/effects/meteorimpact.ogg', 100 , FALSE, FALSE)
					user.log_message("cut down [src] at [AREACOORD(src)]", LOG_ATTACK)
					for(var/i=1 to log_amount)
						new /obj/item/grown/log/tree(get_turf(src))
					var/obj/structure/flora/stump/S = new(loc)
					S.name = "[name]_stump"
					qdel(src)
		else
			user.visible_message("<span class='notice'>The [W] is uncapable of cutting down the [src].</span>")
			return ..()

/obj/structure/flora/ms13/tree/deadsnow
	name = "dead tree"
	desc = "It's a tree. Useful for combustion and/or construction."
	icon = 'mojave/icons/flora/trees.dmi'
	icon_state = "snowtree_1"
	log_amount = 3
	obj_integrity = 400
	max_integrity = 400

/obj/structure/flora/ms13/tree/deadsnow/New()
	icon_state = "snowtree_[rand(1,3)]"
	..()

/obj/structure/flora/ms13/tree/pine
	name = "pine tree"
	desc = "An small evergreen, Evergreen even when the bombs dropped."
	icon = 'mojave/icons/flora/trees.dmi'
	icon_state = "pine_1"
	log_amount = 1
	obj_integrity = 400
	max_integrity = 400

/obj/structure/flora/ms13/tree/pine/New()
	icon_state = "pine_[rand(1,2)]"
	..()

/obj/structure/flora/ms13/tree/tallpine
	name = "pine tree"
	desc = "An tall evergreen, Evergreen even when the bombs dropped."
	icon = 'mojave/icons/flora/talltrees.dmi'
	icon_state = "pine_1"
	log_amount = 4
	obj_integrity = 400
	max_integrity = 400

/obj/structure/flora/ms13/tree/tallpine/New()
	icon_state = "pine_[rand(1,3)]"
	..()

/obj/structure/flora/ms13/tree/wasteland
	name = "dead tree"
	desc = "It's a tree. Useful for combustion and/or construction."
	icon = 'mojave/icons/flora/trees.dmi'
	icon_state = "deadtree_1"
	log_amount = 4
	obj_integrity = 400
	max_integrity = 400

/obj/structure/flora/ms13/tree/wasteland/New()
	icon_state = "deadtree_[rand(1,6)]"
	..()

/obj/structure/flora/ms13/tree/joshua
	name = "joshua tree"
	desc = "A tree named by mormons, who said it's branches mimiced the biblical Joshua, raising his hands in prayer."
	icon = 'mojave/icons/flora/trees.dmi'
	log_amount = 3
	icon_state = "joshua_1"
	obj_integrity = 400
	max_integrity = 400

/obj/structure/flora/tree/joshua/ms13/Initialize()
	. = ..()
	icon_state = "joshua_[rand(1,4)]"

/obj/structure/flora/ms13/tree/cactus
	name = "cactus"
	desc = "It's a giant cowboy hat! It's waving hello! It wants you to hug it!"
	icon = 'mojave/icons/flora/trees.dmi'
	icon_state = "cactus"
	log_amount = 2
	obj_integrity = 400
	max_integrity = 400

//for more ms13 snow plants (grass etc. search /obj/structure/flora/grass)
