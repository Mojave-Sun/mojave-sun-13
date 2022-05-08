/mob/living/basic/ms13/hostile_animal
	name = "hostile animal"
	desc = "Generic animal that does not like you. (Most of them)"
	icon = 'mojave/icons/mob/ms13animals.dmi'
	icon_state = "pigrat"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	gender = PLURAL
	health = 150
	maxHealth = 150
	speed = 1
	attack_verb_continuous = "chomps"
	attack_verb_simple = "bites"
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_sound = 'sound/weapons/bite.ogg'
	combat_mode = TRUE
	speak_emote = list("roars","chirps", "squeals")

	ai_controller = /datum/ai_controller/basic_controller/ms13/hostile_animal

/mob/living/basic/ms13/hostile_animal/Initialize(mapload)
	. = ..()

/datum/ai_controller/basic_controller/ms13/hostile_animal
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic()
	)

	ai_movement = /datum/ai_movement/basic_avoidance/bypass_tables
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_melee_attack_subtree/ms13/hostile_animal,
	)

/datum/ai_planning_subtree/basic_melee_attack_subtree/ms13/hostile_animal
	melee_attack_behavior = /datum/ai_behavior/basic_melee_attack/ms13/hostile_animal

/datum/ai_behavior/basic_melee_attack/ms13/hostile_animal
	action_cooldown = 1.5 SECONDS

//Some things will be commented out, mostly relating to Scar's taming and domestication code, since it isn't ported over with this.

/mob/living/basic/ms13/hostile_animal/radroach
	name = "radroach"
	desc = "A large mutated cockroach, an angry beast that is extremely territorial."
	icon_state = "radroach"
	icon_dead = "radroach_dead"
	speak_emote = list("screeches")
	attack_verb_continuous = "pincers"
	attack_verb_simple = "pincer"
	attack_sound = 'sound/weapons/bite.ogg'
	health = 35
	maxHealth = 35
	melee_damage_lower = 5
	melee_damage_upper = 10
	speed = -0.5
	sharpness = NONE
	wound_bonus = CANT_WOUND
	faction = list("insect")
	/*food_type = list(/obj/item/food/)//they eat anything
	tame_chance = 5
	bonus_tame_chance = 5
	eggable = TRUE
	egg_type = /obj/item/food/ms13/egg/ms13/radroach */

/mob/living/basic/ms13/hostile_animal/gecko
	name = "gecko"
	desc = "A large mutated bipedal lizard, an angry squatter of the wastes, keen to fish-like prey and also rarely used as a mount."
	icon_state = "gecko"
	icon_dead = "gecko_dead"
	gender = PLURAL
	speak_emote = list("hisses")
	attack_verb_continuous = "scratches"
	attack_verb_simple = "scratch"
	attack_sound = 'sound/weapons/slash.ogg'//scratch
	health = 60
	maxHealth = 60
	melee_damage_lower = 10
	melee_damage_upper = 10
	speed = -0.5
	sharpness = SHARP_EDGED
	wound_bonus = 6
	bare_wound_bonus = 4
	faction = list("gecko")
	/*food_type = null //insert TECHNOFISH TM HERE
	tame_chance = 5
	bonus_tame_chance = 15
	rideable = TRUE
	eggable = TRUE
	egg_type = /obj/item/food/ms13/egg/ms13/gecko*/

/mob/living/basic/ms13/hostile_animal/gecko/ice
	icon_state = "icegecko"
	icon_dead = "icegecko_dead"
	butcher_results = list(/obj/item/ms13/hide/gecko/ice = 1, /obj/item/food/meat/slab/ms13/carcass/gecko = 1, /obj/item/ms13/animalitem/gecko/claws = 1)

/mob/living/basic/ms13/hostile_animal/gecko/sand
	icon_state = "sandgecko"
	icon_dead = "sandgecko_dead"

/mob/living/basic/ms13/hostile_animal/molerat
	name = "molerat"
	desc = "A disgusting flesh beast, known for it's hostility and edible meat."
	icon_state = "molerat"
	icon_dead = "molerat_dead"
	gender = PLURAL
	speak_emote = list("screeches")
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/weapons/bite.ogg'
	health = 50
	maxHealth = 50
	melee_damage_lower = 10
	melee_damage_upper = 10
	speed = 0
	sharpness = SHARP_POINTY
	wound_bonus = 6
	bare_wound_bonus = 4
	butcher_results = list(/obj/item/ms13/hide/molerat = 1, /obj/item/food/meat/slab/ms13/carcass/molerat = 1)
	faction = list("rat")
	/*food_type = list(/obj/item/food/grown/ms13/potato)
	tame_chance = 20
	bonus_tame_chance = 5
	breedable = TRUE
	young_type = /mob/living/simple_animal/ms13/moleratyoung
	adult_type = /mob/living/simple_animal/hostile/ms13/molerat/tamed

/mob/living/simple_animal/hostile/ms13/molerat/tamed
	faction = list("neutral")*/

/mob/living/basic/ms13/hostile_animal/molerat/young
	name = "young molerat"
	desc = "A small disgusting flesh beast, known for it's hostility and edible meat. Almost cute"
	attack_verb_continuous = "nips"
	attack_verb_simple = "nip"
	melee_damage_lower = 1
	melee_damage_upper = 5
	health = 15
	maxHealth = 15
	/*is_young = TRUE
	adult_type = /mob/living/simple_animal/hostile/ms13/molerat/tamed*/

/mob/living/basic/ms13/hostile_animal/pigrat
	name = "pigrat"
	desc = "A foul abomination of the earth's two most filthy creatures, initially wild beasts but if tamed are known to be a source of nutritious meat and milk."
	icon_state = "pigrat"
	icon_dead = "pigrat_dead"
	gender = PLURAL
	speak_emote = list("screeches")
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/weapons/bite.ogg'
	health = 80
	maxHealth = 80
	melee_damage_lower = 15
	melee_damage_upper = 20
	armour_penetration = 5
	speed = 0.5
	sharpness = SHARP_POINTY
	wound_bonus = 4
	bare_wound_bonus = 4
	butcher_results = list(/obj/item/ms13/hide/pigrat = 1, /obj/item/food/meat/slab/ms13/carcass/molerat/pig = 1, /obj/item/ms13/animalitem/pigrat/snout = 1)
	faction = list("rat")
	/*food_type = list(/obj/item/food/grown/ms13/xander, /obj/item/food/grown/ms13/carrot)
	tame_chance = 5
	bonus_tame_chance = 5
	breedable = TRUE
	young_type = /mob/living/simple_animal/ms13/pigratyoung
	adult_type = /mob/living/simple_animal/hostile/ms13/pigrat/tamed*/

/mob/living/basic/ms13/hostile_animal/pigrat/young
	name = "young pigrat"
	desc = "A small but foul abomination of the earth's two most filthy creatures, initially wild beasts but if tamed are known to be a source of nutritious meat and milk."
	icon_state = "pigrat"
	icon_dead = "pigrat_dead"
	speak_emote = list("screeches")
	attack_verb_continuous = "nips"
	attack_verb_simple = "nip"
	melee_damage_lower = 5
	melee_damage_upper = 10
	health = 25
	maxHealth = 25
	/*is_young = TRUE
	adult_type = /mob/living/simple_animal/hostile/ms13/pigrat/tamed

/mob/living/simple_animal/hostile/ms13/pigrat/tamed
	faction = list("neutral")*/

/mob/living/basic/ms13/hostile_animal/giantant
	name = "giant ant"
	desc = "A large mutated ant, loyal to the hive and will protect it at all costs."
	icon_state = "ant"
	icon_dead = "ant_dead"
	speak_emote = list("chitters")
	attack_verb_continuous = "pincers"
	attack_verb_simple = "pincer"
	attack_sound = 'sound/weapons/bite.ogg'
	health = 100
	maxHealth = 100
	melee_damage_lower = 15
	melee_damage_upper = 20
	armour_penetration = 10
	speed = 0.5
	sharpness = NONE
	wound_bonus = 8
	bare_wound_bonus = 4
	faction = list("insect")
	/*food_type = list(/obj/item/food/grown/ms13/pungafruit, /obj/item/food/grown/ms13/geigpungafruit)
	tame_chance = 5
	bonus_tame_chance = 5
	eggable = TRUE
	egg_type = /obj/item/food/ms13/egg/ms13/ant*/

/mob/living/basic/ms13/hostile_animal/wolf
	name = "wolf"
	desc = "An extremely hostile pack wolf,hardened by radiation, a fearsome hunter-killer."
	icon_state = "wolf"
	icon_dead = "wolf_dead"
	speak_emote = list("howls")
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/weapons/bite.ogg'
	health = 75
	maxHealth = 75
	melee_damage_lower = 15
	melee_damage_upper = 20
	speed = -1
	sharpness = SHARP_EDGED
	wound_bonus = 6
	bare_wound_bonus = 6
	butcher_results = list(/obj/item/ms13/hide/wolf = 1, /obj/item/food/meat/slab/ms13/carcass/wolf = 1, /obj/item/ms13/animalitem/wolf/teeth = 2)
	faction = list("dog_city")
	/*food_type = list(/obj/item/food/meat/slab)
	tame_chance = 5
	bonus_tame_chance = 5*/

/mob/living/basic/ms13/hostile_animal/mirelurk
	name = "mirelurk"
	desc = "A large mutated crab monster, lurks its prey from the deep, keen to meat and a vital food source for many roamers."
	icon_state = "cavelurk"
	icon_dead = "cavelurk_dead"
	speak_emote = list("histles")
	attack_verb_continuous = "claws"
	attack_verb_simple = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	health = 210
	maxHealth = 210
	melee_damage_lower = 25
	melee_damage_upper = 30
	armour_penetration = 15
	speed = 2
	sharpness = SHARP_EDGED
	wound_bonus = 4
	bare_wound_bonus = 6
	faction = list("shellfish")
	/*food_type = list(/obj/item/food/meat/slab)
	tame_chance = 5
	bonus_tame_chance = 5
	rideable = TRUE
	eggable = TRUE
	egg_type = /obj/item/food/ms13/egg/ms13/mirelurk*/

/mob/living/basic/ms13/hostile_animal/yaoguai
	name = "yao guai"
	desc = "A massive mutated bear wolf. You better get running!"
	icon = 'mojave/icons/mob/32x64.dmi'
	icon_state = "yaoguai"
	icon_dead = "yaoguai_dead"
	gender = PLURAL
	speak_emote = list("growls")
	attack_verb_continuous = "mauls"
	attack_verb_simple = "maul"
	attack_sound = 'mojave/sound/ms13weapons/meleesounds/slam.ogg'
	health = 400
	maxHealth = 400
	melee_damage_lower = 50
	melee_damage_upper = 60
	armour_penetration = 10
	speed = 1.5
	sharpness = SHARP_EDGED
	wound_bonus = 10
	bare_wound_bonus = 5
	butcher_results = list(/obj/item/ms13/hide/large/yaoguai = 1, /obj/item/food/meat/slab/ms13/carcass/large/yaoguai/front = 1, /obj/item/food/meat/slab/ms13/carcass/large/yaoguai/back = 1)
	faction = list("bear")
	/*food_type = list(/obj/item/food/meat/slab/human)
	tame_chance = 5
	bonus_tame_chance = 2
	rideable = TRUE*/
	base_pixel_x = -64

/mob/living/basic/ms13/hostile_animal/hellpig
	name = "hellpig"
	desc = "A massive mutated pig. Wild and deadly."
	icon = 'mojave/icons/mob/64x64.dmi'
	icon_state = "hellpig"
	icon_dead = "hellpig_dead"
	gender = MALE
	speak_emote = list("honks")
	attack_verb_continuous = "chomps"
	attack_verb_simple = "chomp"
	attack_sound = 'mojave/sound/ms13weapons/meleesounds/slam.ogg'
	health = 550
	maxHealth = 550
	melee_damage_lower = 50
	melee_damage_upper = 60
	armour_penetration = 20
	speed = 2
	sharpness = NONE
	wound_bonus = 10
	bare_wound_bonus = 5
	butcher_results = list(/obj/item/ms13/hide/large/hellpig = 1, /obj/item/food/meat/slab/ms13/carcass/large/hellpig/front = 1, /obj/item/food/meat/slab/ms13/carcass/large/hellpig/back = 1, /obj/item/food/meat/slab/ms13/carcass/large/hellpig/leg = 4)
	faction = list("pig")
	/*food_type = list(/obj/item/food/meat/slab/human)
	tame_chance = 1
	bonus_tame_chance = 1
	rideable = TRUE*/
	base_pixel_x = -48
	status_flags = null
