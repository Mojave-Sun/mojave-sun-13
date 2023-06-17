//Mojave Sun general flora directory

//Ash Flora Type Plants but MS13 FORAGE EDITION

/obj/structure/flora/ms13/forage
	gender = PLURAL
	icon = 'mojave/icons/flora/wastelandflora.dmi'
	name = "Base type MS13 foragable plant"
	desc = "I sure hope these don't spawn in."
	var/harvested_name = "placeholderberry"
	var/harvested_desc = "A dark and sticky berry. Describe ONLY appearance!"
	var/needs_sharp_harvest = FALSE
	var/harvest = /obj/item/food/grown/ms13/tarberry
	var/harvest_amount_low = 1
	var/harvest_amount_high = 4
	var/harvest_time = 6 SECONDS
	var/harvest_message_low = "You harvest the berries, but fail to attain many of them."
	var/harvest_message_med = "You harvest the berries, collecting a decent amount from the forage."
	var/harvest_message_high = "You harvest and collect many berries from the wild plant."
	var/harvested = FALSE
	var/base_icon
	var/regrowth_time_low = 8 MINUTES
	var/regrowth_time_high = 16 MINUTES
	var/stick_around = TRUE // If the plant comes back later on
	var/variants = 3 // How many variants of the plant sprite there are

/obj/structure/flora/ms13/forage/Initialize()
	. = ..()
	base_icon = "[icon_state][rand(1, (variants))]"
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

	if(stick_around)
		icon_state = "[base_icon]p"
	else
		qdel(src)
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

/obj/structure/flora/ms13/forage/brocflower
	icon_state = "brocflower"
	name = "brocflower"
	desc = "A lanky plant bearing broc flowers"
	harvested_name = "broc flower"
	harvested_desc = "A broc flower."
	harvest = /obj/item/food/grown/ms13/brocflower
	harvest_amount_high = 3
	variants = 2

/obj/structure/flora/ms13/forage/brocflower/drought
	icon_state = "d_brocflower"
	variants = 1

/obj/structure/flora/ms13/forage/xander
	icon_state = "xander"
	name = "xander"
	desc = "A bunch of xander root plants"
	harvested_name = "xander"
	harvested_desc = "A xander root."
	harvest = /obj/item/food/grown/ms13/xander
	harvest_amount_high = 3
	variants = 2

/obj/structure/flora/ms13/forage/xander/drought
	icon_state = "d_xander"
	variants = 1

/obj/structure/flora/ms13/forage/yucca
	icon_state = "yucca"
	name = "yucca"
	desc = "A yucca plant, bearing starchy yucca fruits."
	harvested_name = "yucca"
	harvested_desc = "A yucca fruit."
	harvest = /obj/item/food/grown/ms13/yucca
	harvest_amount_high = 3
	variants = 1

/obj/structure/flora/ms13/forage/barrel_cactus
	icon_state = "barrelc"
	name = "barrel cactus"
	desc = "A barrel cactus, be careful of the spines."
	harvested_name = "barrel cactus fruit"
	harvested_desc = "Some barrel cactus fruit."
	harvest = /obj/item/food/grown/ms13/barrelcactus
	harvest_amount_high = 3
	variants = 3

/obj/structure/flora/ms13/forage/tarberry
	icon_state = "tarberry"
	name = "tarberry shrub"
	desc = "A plant bearing tarberries."
	harvested_name = "tarberry"
	harvested_desc = "A tarberry."
	harvest = /obj/item/food/grown/ms13/tarberry

/obj/structure/flora/ms13/forage/blackberry
	icon_state = "blackberry"
	name = "blackberry shrub"
	desc = "A plant bearing blackberries."
	harvested_name = "blackberry"
	harvested_desc = "A blackberry."
	harvest = /obj/item/food/grown/ms13/blackberry

/obj/structure/flora/ms13/forage/mutfruit
	icon_state = "mutfruit"
	name = "mutfruit plant"
	desc = "A plant bearing Mutfruits."
	harvested_name = "mutfruit"
	harvested_desc = "A Mutfruit."
	harvest = /obj/item/food/grown/ms13/mutfruit
	harvest_message_low = "You harvest the fruits, but fail to attain many of them."
	harvest_message_med = "You harvest the fruits, collecting a decent amount from the forage."
	harvest_message_high = "You harvest and collect many fruits from the wild plant."
	harvest_amount_high = 2

/obj/structure/flora/ms13/forage/ashrose
	icon_state = "ashrose"
	name = "ashrose flowers"
	desc = "A patch of ash rose."
	harvested_name = "ash rose"
	harvested_desc = "A potent radiation and toxin healing flower."
	harvest = /obj/item/food/grown/ms13/ashrose
	harvest_message_low = "You harvest the flowers, but fail to salvage many of them."
	harvest_message_med = "You harvest the flowers, collecting a small bunch of them."
	harvest_message_high = "You harvest and collect many flowers from the patch."
	harvest_amount_high = 4
	regrowth_time_high = 30 MINUTES

/obj/structure/flora/ms13/forage/ashrose/drought
	icon_state = "d_ashrose"
	variants = 1

/obj/structure/flora/ms13/forage/wildcarrot
	icon_state = "root"
	name = "wild carrot patch"
	desc = "A patch of wild carrots."
	harvested_name = "wild carrot"
	harvested_desc = "A wild root vegetable."
	harvest = /obj/item/food/grown/ms13/carrot
	harvest_message_low = "You dig up the roots, but fail to salvage many produce."
	harvest_message_med = "You dig up the roots, collecting a small bunch of carrots."
	harvest_message_high = "You dig up many roots from the patch, collecting a good harvest."
	harvest_amount_high = 3

/obj/structure/flora/ms13/forage/aster
	icon_state = "aster"
	name = "aster flowers"
	desc = "A patch of wild aster flowers."
	harvested_name = "aster flower"
	harvested_desc = "Some aster flowers."
	harvest = /obj/item/food/grown/ms13/aster
	harvest_message_low = "You accidentally destroy the delicate flowers, salvaging nothing."
	harvest_message_med = "You collect a handful of delicate flowers."
	harvest_message_high = "You delicately pick many flowers, collecting a good harvest."
	harvest_amount_low = 0
	harvest_amount_high = 4
	regrowth_time_high = 20 MINUTES

/obj/structure/flora/ms13/forage/aster/drought
	icon_state = "d_aster"
	variants = 1

/obj/structure/flora/ms13/forage/mushroom
	icon_state = "shroom"
	name = "cave fungus"
	desc = "A patch of cave mushrooms"
	harvested_name = "cave fungus"
	harvested_desc = "A common mushroom"
	harvest = /obj/item/food/grown/ms13/cavefungus
	harvest_message_low = "Gather a small amount of mushrooms from the cluster."
	harvest_message_med = "You collect a decent amount of mushrooms from the cluster."
	harvest_message_high = "You collect a hearty harvest from the mushroom cluster."
	harvest_amount_high = 4

/obj/structure/flora/ms13/forage/mushroom/glowing
	icon_state = "glowshroom"
	name = "glowing cave fungus"
	desc = "A patch of glowing mushrooms"
	harvested_name = "glowing fungus"
	harvested_desc = "A glowing mushroom"
	harvest = /obj/item/food/grown/ms13/glowfungus
	light_range = 2
	light_power = 0.25
	light_color = "#3eff3e"

/obj/structure/flora/ms13/forage/blight
	icon_state = "blightshroom"
	name = "blight mushroom"
	desc = "A patch of blight mushrooms"
	harvested_name = "blight fungus"
	harvested_desc = "A blight mushroom"
	harvest = /obj/item/food/grown/ms13/blight
	harvest_message_low = "Gather a small amount of mushrooms from the cluster."
	harvest_message_med = "You collect a decent amount of mushrooms from the cluster."
	harvest_message_high = "You collect a hearty harvest from the mushroom cluster."
	harvest_amount_high = 3

/obj/structure/flora/ms13/forage/brainshroom
	icon_state = "brainshroom"
	name = "brain fungus"
	desc = "A patch of brain fungus"
	harvested_name = "brain fungus"
	harvested_desc = "A brain fungus"
	harvest = /obj/item/food/grown/ms13/brainfung
	harvest_message_low = "Gather a small amount of fungus from the cluster."
	harvest_message_med = "You collect a decent amount of fungus from the cluster."
	harvest_message_high = "You collect a hearty harvest from the fungus cluster."
	harvest_amount_high = 2

/obj/structure/flora/ms13/forage/fireshroom
	icon_state = "fireshroom"
	name = "firecap mushroom"
	desc = "A patch of firecap mushrooms"
	harvested_name = "firecap mushroom"
	harvested_desc = "A firecap mushroom"
	harvest = /obj/item/food/grown/ms13/firecap
	harvest_message_low = "Gather a small amount of mushrooms from the patch."
	harvest_message_med = "You collect a decent amount of mushrooms from the patch."
	harvest_message_high = "You collect a hearty harvest from the mushroom patch."
	harvest_amount_high = 4

/obj/structure/flora/ms13/forage/gutshroom
	icon_state = "gutshroom"
	name = "gutshroom fungus"
	desc = "A patch of gutshroom fungus"
	harvested_name = "gutshroom fungus"
	harvested_desc = "A gutshroom fungus"
	harvest = /obj/item/food/grown/ms13/gutshroom
	harvest_message_low = "Gather a small amount of mushrooms from the cluster."
	harvest_message_med = "You collect a decent amount of mushrooms from the cluster."
	harvest_message_high = "You collect a hearty harvest from the mushroom cluster."
	harvest_amount_high = 3

/obj/structure/flora/ms13/forage/lure
	icon_state = "lure weed"
	name = "lure weed"
	desc = "A patch of lure weed"
	harvested_name = "lure weed"
	harvested_desc = "A nlure weed"
	harvest = /obj/item/food/grown/ms13/lureweed
	harvest_message_low = "Gather a small amount of lureweed from the patch."
	harvest_message_med = "You collect a decent amount of lureweed from the patch."
	harvest_message_high = "You collect a hearty harvest from the lureweed patch."
	harvest_amount_high = 2

/obj/structure/flora/ms13/forage/nara
	icon_state = "nara root"
	name = "nara root"
	desc = "A patch of nara root"
	harvested_name = "nara root"
	harvested_desc = "A nara root"
	harvest = /obj/item/food/grown/ms13/nara
	harvest_message_low = "Gather a small amount of root from the patch."
	harvest_message_med = "You collect a decent amount of root from the patch."
	harvest_message_high = "You collect a hearty harvest from the root patch."
	harvest_amount_high = 2

//Grasses

/obj/structure/flora/grass/wasteland
	icon = 'mojave/icons/flora/flora.dmi'
	desc = "Some dry, virtually dead grass."
	icon_state = "drygrass_1"

/obj/structure/flora/grass/wasteland/Initialize()
	. = ..()
	icon_state = "drygrass_[rand(1,15)]"
	var/matrix/M = new
	M.Translate(rand(-5,5),rand(-5,5))
	transform = M

/obj/structure/flora/grass/wasteland/snow
	icon = 'mojave/icons/flora/flora.dmi'
	desc = "Some frozen, virtually dead grass."
	icon_state = "snowgrass_1"

/obj/structure/flora/grass/wasteland/snow/New()
	..()
	icon_state = "snowgrass_[rand(1,8)]"

//Mojave Sun Trees/Large Foliage

//trees

/obj/structure/flora/ms13/tree
	name = "tree"
	desc = "A large tree."
	icon = 'mojave/icons/flora/trees.dmi'
	density = TRUE
	layer = 4.9
	plane = ABOVE_GAME_PLANE
	pixel_x = -16
	pixel_y = 5
	var/log_amount = 1
	projectile_passchance = 60 // mf tree

/obj/structure/flora/ms13/tree/Initialize()
	. = ..()
	pixel_x = rand(-20,-16)
	//AddComponent(/datum/component/largetransparency, 1, 1, -1, 1) // Busted right now. After the first time it turns the icon transparent, the entire icon's dimensions block mouse clicks.
	AddElement(/datum/element/climbable) // People should be able to pass trees hypothetically. Just not quickly... One day, unscuff the text for this.

/obj/structure/flora/ms13/tree/attackby(obj/item/W, mob/user, params)
	if(log_amount && (!(flags_1 & NODECONSTRUCT_1)))
		if(W.sharpness & SHARP_AXE)
			if(W.hitsound)
				playsound(get_turf(src), 'mojave/sound/ms13effects/wood_cutting.ogg', 80, FALSE, FALSE)
				user.visible_message("<span class='notice'>[user] begins to cut down [src] with [W].</span>","<span class='notice'>You begin to cut down [src] with [W].</span>", "<span class='hear'>You hear the sound of chopping.</span>")
				if(do_after(user, 30 SECONDS * W.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_CHOPTREE))
					user.visible_message("<span class='notice'>[user] fells [src] with the [W].</span>","<span class='notice'>You fell [src] with the [W].</span>", "<span class='hear'>You hear the sound of a tree falling.</span>")
					playsound(get_turf(src), 'sound/effects/meteorimpact.ogg', 80, FALSE, FALSE)
					user.log_message("cut down [src] at [AREACOORD(src)]", LOG_ATTACK)
					for(var/i=1 to log_amount)
						new /obj/item/stack/sheet/ms13/wood/log(get_turf(src))
					qdel(src)
		else
			user.visible_message("<span class='notice'>The [W] is uncapable of cutting down the [src].</span>")
			return ..()

/obj/structure/flora/ms13/tree/tallpine
	name = "pine tree"
	desc = "An tall evergreen, Evergreen even when the bombs dropped."
	icon_state = "pine_1"
	log_amount = 4
	max_integrity = 400

/obj/structure/flora/ms13/tree/tallpine/snow
	icon_state = "pine_1_snow"

/obj/structure/flora/ms13/tree/tallpine/alt
	icon_state = "pine_1_alt"

/obj/structure/flora/ms13/tree/tallpine/dead //uh oh placeholder alert
	icon_state = "bald"
	log_amount = 1

/obj/structure/flora/ms13/tree/drought/dead
	name = "dead tree"
	desc = "This tree lived a long life to get this big. Now it's dead."
	icon_state = "dead_tree1"
	max_integrity = 400

/obj/structure/flora/ms13/tree/drought/dead/Initialize()
	. = ..()
	icon_state = "dead_tree[rand(1,3)]"


// Cacti

/obj/structure/flora/ms13/cactus
	name = "cactus"
	desc = "A short cactus, spiny and spiky."
	icon = 'mojave/icons/flora/flora.dmi'
	icon_state = "short_cactus1"
	max_integrity = 200

/obj/structure/flora/ms13/cactus/Initialize()
	icon_state = "short_cactus[rand(1,3)]"
	..()

/obj/structure/flora/ms13/cactus/tall
	desc = "A tall cactus, spiky and spiny."
	icon_state = "tall_cactus1"
	max_integrity = 250

/obj/structure/flora/ms13/cactus/tall/Initialize()
	icon_state = "tall_cactus[rand(1,3)]"
	..()

// Generic leaf-plant

/obj/structure/flora/ms13/leafy
	name = "leafy plant"
	desc = "A tuft of leaf-blades, it's some hardy desert plant."
	icon = 'mojave/icons/flora/flora.dmi'
	icon_state = "leafy_plant1"

/obj/structure/flora/ms13/leafy/Initialize()
	icon_state = "leafy_plant[rand(1,3)]"
	..()

//for more ms13 snow plants (grass etc. search /obj/structure/flora/grass)
