#define RIDING_LAYER 4.6

/mob/living/simple_animal
	var/subtractible_armour_penetration = 0

/////////////////////////////////////////////////////////////
///////// MOJAVE SUN ANIMALS AND RANCHING CHANGES ///////////
/////////////////////// BASE CODE ///////////////////////////
/////////////////////////////////////////////////////////////

//Cattle-Prod Functionality, hopefully allows for stunning simplemobs to feed and tame them

/obj/item/melee/baton/attack(mob/M, mob/living/carbon/human/user)
	. = ..()
	if(active)
		. = ..()
		if(isanimal(M))
			var/mob/living/simple_animal/critter = M
			critter.Stun(70 - critter.melee_damage_upper) //stronger mobs, smaller stun times

//Non-Aggresive Mobs, Defenceless Mobs, things like, babies and such

/mob/living/simple_animal/ms13
	name = "ms13 mob"
	desc = "If you see this, kill it, purge it and call the developer hotline, we will beat those mappers/admins, lickety split!"
	icon = 'mojave/icons/mob/ms13animals.dmi'
	icon_state = ""
	wander = TRUE
	gender = NEUTER
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list()
	speak_emote = list()
	emote_hear = list()
	emote_see = list()
	speak_chance = 15
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list()
	guaranteed_butcher_results = list()
	loot = list()
	response_help_continuous = "pats"
	response_help_simple = "pat"
	response_disarm_continuous = "pushes aside"
	response_disarm_simple = "push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	speak_emote = list()
	health = 100
	maxHealth = 100
	speed = 2
	blood_volume = BLOOD_VOLUME_NORMAL
	footstep_type = FOOTSTEP_MOB_HEAVY
	status_flags = CANSTUN
	environment_smash = ENVIRONMENT_SMASH_NONE
	mob_size = MOB_SIZE_LARGE
	stop_automated_movement_when_pulled = 1
	wound_bonus = -5
	bare_wound_bonus = 5
	var/food_type = list()
	var/tame_chance = 10
	var/bonus_tame_chance = 15
	var/tame = FALSE
	//does the homie lay eggs?
	var/eggable = FALSE
	var/egg_type = null
	var/eggsleft = 0
	//can the homie be ridden?
	var/rideable = FALSE
	//does the homie have a saddle to ride?
	var/saddled = FALSE
	//god I hate adding like 5000 variables but this one makes it so only certain things are baggable so slower, larger pack animals are used as caravan things and not just like nightstalkers and good shit.
	var/baggable = FALSE
	//does the homiehave da bag (backpack mode, for caravans and such, takes larger items than a backpack so very useful)
	var/bagged = FALSE
	//feed to clone system working?
	var/breedable = FALSE
	//small sprite lad? Jostle em
	var/smallasslad = FALSE
	//is it a bambino doe?
	var/is_young = FALSE
	//do they got a bambino tho????
	var/has_young = FALSE
	//bambino
	var/young_type = null
	//adult
	var/adult_type = null
	//timer on growing up
	var/growth
	//hunger for tamed mobs, dictates starvation and things like production of eggs/milk and such
	var/hunger = 200
	var/maxhunger = 200
	//changes the players sprite adjustment when riding
	var/offsetx = 0
	var/offsety = 0

/mob/living/simple_animal/ms13/Initialize()
	. = ..()
	AddComponent(/datum/component/tameable, tame_chance = 25, bonus_tame_chance = 15, after_tame = CALLBACK(src, .proc/tamed))
	icon_dead = "[icon_state]_dead"
	var/matrix/bambinoscale = matrix()
	if(is_young == TRUE)
		bambinoscale.Scale(0.7, 0.7)
		transform = bambinoscale
	if(smallasslad == TRUE)
		//makes them small ass lads look all funky n shi
		set_base_pixel_x(base_pixel_x + rand(-6, 6))
		set_base_pixel_y(base_pixel_y + rand(0, 10))
	if(tame)
		if(eggable == TRUE)
			eggsleft = 0

/mob/living/simple_animal/ms13/proc/tamed(mob/living/tamer)
	faction = list("neutral")
	tame = TRUE

//hunger and baby grow/birth/speed shitcode
/mob/living/simple_animal/ms13/Life()
	. =..()
	if(tame)
		var/hungerrate = rand(0.2,0.3)
		hunger -= hungerrate
		if(hunger == 0)
			hungerrate = 0
		if(stat == CONSCIOUS && breedable == TRUE)
			if((prob(3) && has_young))
				has_young++
			if(has_young > 10)
				has_young = 0
				visible_message("<span class='alertalien'>[src] has produced a baby.</span>")
				new young_type(src.loc)
			if(is_young)
				growth++
				if(growth > 50)
					is_young = 0
					new adult_type(src.loc)
					qdel(src)
					visible_message("<span class='alertalien'>[src] has fully grown.</span>")
					return
		if(eggable == TRUE)
			if(!stat)
				if(hunger >= 150 && eggsleft < 8)
					eggsleft += rand(1, 4)
					hunger -= 100
				if(hunger == 0)
					eggsleft = 0 //starvin now foo
				else
					return
			if((!stat && prob(3) && eggsleft > 0) && egg_type)
				visible_message("<span class='alertalien'>[src] [pick(EGG_LAYING_MESSAGES)]</span>")
				eggsleft--
				var/obj/item/E = new egg_type(get_turf(src))
				E.pixel_x = rand(-6,6)
				E.pixel_y = rand(-6,6)
				return

/mob/living/simple_animal/ms13/proc/saddleup()
	var/speedmodifier = speed/(hunger/maxhunger)
	if(saddled == TRUE)
		can_buckle = TRUE
		buckle_lying = FALSE
		add_overlay("[icon_state]_saddled")
		var/datum/component/riding/D = LoadComponent(/datum/component/riding)
		D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 8 + offsety), TEXT_SOUTH = list(0, 8 + offsety), TEXT_EAST = list(-2 - offsetx, 8 + offsety), TEXT_WEST = list(2 + offsetx, 8 + offsety)))
		D.vehicle_move_delay = speedmodifier

/mob/living/simple_animal/ms13/proc/bogged()
	if(bagged == TRUE)
		AddComponent(/datum/component/storage/concrete)
		var/datum/component/storage/STR = GetComponent(/datum/component/storage)
		STR.max_combined_w_class = 100
		STR.max_w_class = WEIGHT_CLASS_BULKY
		STR.max_items = 20
		add_overlay("[icon_state]_bagged")

/mob/living/simple_animal/ms13/attackby(obj/item/O, mob/user, params)
	. = ..()
	if(O == /obj/item/melee/baton)
		Stun(70 -  melee_damage_upper)
	if(is_type_in_list(O, food_type))
		user.visible_message("<span class='notice'>[user] hand-feeds [O] to [src].</span>", "<span class='notice'>You hand-feed [O] to [src].</span>")
		qdel(O)
		if(do_after(user, 3 SECONDS, target = src))
			if (prob(tame_chance)) //note: lack of feedback message is deliberate, keep them guessing!
				tame = TRUE
				tamed(user)
			else
				tame_chance += bonus_tame_chance
	if(stat == CONSCIOUS && tame)
		if(is_type_in_list(O, food_type))
			if(hunger <= maxhunger)
				user.visible_message("<span class='notice'>[user] hand-feeds the [O] to [src].</span>", "<span class='notice'>You hand-feed [O] to [src].</span>")
				hunger += 20
				if(is_young)
					visible_message("<span class='alertalien'>[src] adorably chews the [O].</span>")
					qdel(O)
				if(!has_young && !is_young && breedable == TRUE && hunger >= 150 && prob(30))
					has_young = 1
					visible_message("<span class='alertalien'>[src] hungrily consumes the [O].</span>")
					qdel(O)
				else
					visible_message("<span class='alertalien'>[src] absently munches the [O].</span>")
					qdel(O)
			else if(hunger >= maxhunger)
				user.visible_message("<span class='notice'>The [src] rejects the [O] they dont seem to be hungry right now.</span>")
/*		if(baggable == TRUE)
			if(istype(O, /obj/item/storage/ms13/sack) && !bagged)
				if(tame && do_after(user,55,target=src))
					playsound(get_turf(src), "rustle", 50, TRUE)
					user.visible_message("<span class='notice'>You manage to put [O] on [src], allowing them to store heavy goods.</span>")
					qdel(O)
					bagged = TRUE
					bogged()
					egg_type = null
					return */
		if(rideable == TRUE)
			if(istype(O, /obj/item/saddle) && !saddled)
				if(tame && do_after(user,55,target=src))
					playsound(get_turf(src), "rustle", 50, TRUE)
					user.visible_message("<span class='notice'>You manage to put [O] on [src], you can now ride [p_them()].</span>")
					qdel(O)
					saddled = TRUE
					saddleup()
					egg_type = null
					return
				else
					user.visible_message("<span class='warning'>[src] is rocking around! You can't put the saddle on!</span>")

//Aggressive Mobs - Things that Run/Attack you (TG shitcode, I know)

/mob/living/simple_animal/hostile/ms13
	name = "ms13 mob"
	desc = "If you see this, kill it, purge it and call the developer hotline, we will beat those mappers/admins, lickety split!"
	icon = 'mojave/icons/mob/ms13animals.dmi'
	icon_state = ""
	gender = NEUTER
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list()
	speak_emote = list()
	emote_hear = list()
	emote_see = list()
	speak_chance = 15
	see_in_dark = 6
	butcher_results = list()
	guaranteed_butcher_results = list()
	loot = list()
	response_help_continuous = "pats"
	response_help_simple = "pat"
	response_disarm_continuous = "pushes aside"
	response_disarm_simple = "push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	speak_emote = list()
	health = 100
	maxHealth = 100
	speed = 2
	blood_volume = BLOOD_VOLUME_NORMAL
	aggro_vision_range = 10
	see_in_dark = 8
	obj_damage = 10
	footstep_type = FOOTSTEP_MOB_HEAVY
	status_flags = CANSTUN
	environment_smash = ENVIRONMENT_SMASH_NONE
	mob_size = MOB_SIZE_LARGE
	stop_automated_movement_when_pulled = 1
	wound_bonus = -5
	bare_wound_bonus = 5
	var/food_type = list()
	var/tame_chance = 10
	var/bonus_tame_chance = 15
	var/tame = FALSE
	var/eggable = FALSE
	var/egg_type = null
	var/eggsleft = 0
	var/rideable = FALSE
	var/saddled = FALSE
	var/baggable = FALSE
	var/bagged = FALSE
	var/breedable = FALSE
	var/smallasslad = FALSE
	var/is_young = FALSE
	var/has_young = FALSE
	var/young_type = null
	var/adult_type = null
	var/growth
	var/hunger = 200
	var/maxhunger = 200
	var/offsetx = 0
	var/offsety = 0
	var/idlesound = null
	var/idlechance = 5

/mob/living/simple_animal/hostile/ms13/Initialize()
	. = ..()
	AddComponent(/datum/component/tameable, tame_chance = 10, bonus_tame_chance = 15, after_tame = CALLBACK(src, .proc/tamed))
	icon_dead = "[icon_state]_dead"
	var/matrix/bambinoscale = matrix()
	if(is_young == TRUE)
		bambinoscale.Scale(0.7, 0.7)
		transform = bambinoscale
	if(smallasslad == TRUE)
		//makes them small ass lads look all funky n shi
		set_base_pixel_x(base_pixel_x + rand(-6, 6))
		set_base_pixel_y(base_pixel_y + rand(0, 10))
	if(tame)
		if(eggable == TRUE)
			eggsleft = 0

/mob/living/simple_animal/hostile/ms13/proc/tamed(mob/living/tamer)
	faction = list("neutral")
	tame = TRUE

//hunger and baby grow/birth/speed shitcode
/mob/living/simple_animal/hostile/ms13/Life()
	. =..()
	if(tame)
		var/hungerrate = rand(0.2,0.3)
		hunger -= hungerrate
		if(hunger == 0)
			hungerrate = 0
		if(stat == CONSCIOUS && breedable == TRUE)
			if((prob(3) && has_young))
				has_young++
			if(has_young > 10)
				has_young = 0
				visible_message("<span class='alertalien'>[src] has produced a baby.</span>")
				new young_type(src.loc)
			if(is_young)
				growth++
				if(growth > 50)
					is_young = 0
					new adult_type(src.loc)
					qdel(src)
					visible_message("<span class='alertalien'>[src] has fully grown.</span>")
					return
			return
		if(eggable == TRUE)
			if(!stat)
				if(hunger >= 150 && eggsleft < 8)
					eggsleft += rand(1, 4)
					hunger -= 100
				if(hunger == 0)
					eggsleft = 0 //starvin now foo
				else
					return
			if((!stat && prob(3) && eggsleft > 0) && egg_type)
				visible_message("<span class='alertalien'>[src] [pick(EGG_LAYING_MESSAGES)]</span>")
				eggsleft--
				var/obj/item/E = new egg_type(get_turf(src))
				E.pixel_x = rand(-6,6)
				E.pixel_y = rand(-6,6)
				return
	if(stat)
		return
	if (idlesound)
		if (prob(idlechance))
			var/chosen_sound = pick(idlesound)
			playsound(src, chosen_sound, 60, FALSE)

/mob/living/simple_animal/hostile/ms13/proc/saddleup()
	var/speedmodifier = speed/(hunger/maxhunger)
	if(saddled == TRUE)
		can_buckle = TRUE
		buckle_lying = FALSE
		add_overlay("[icon_state]_saddled")
		var/datum/component/riding/D = LoadComponent(/datum/component/riding)
		D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 8 + offsety), TEXT_SOUTH = list(0, 8 + offsety), TEXT_EAST = list(-2 - offsetx, 8 + offsety), TEXT_WEST = list(2 + offsetx, 8 + offsety)))
		D.keytype = /obj/item/key/lasso
		D.vehicle_move_delay = speedmodifier

/mob/living/simple_animal/hostile/ms13/proc/bogged()
	if(bagged == TRUE)
		AddComponent(/datum/component/storage/concrete)
		var/datum/component/storage/STR = GetComponent(/datum/component/storage)
		STR.max_combined_w_class = 100
		STR.max_w_class = WEIGHT_CLASS_BULKY
		STR.max_items = 20
		add_overlay("[icon_state]_bagged")

/mob/living/simple_animal/hostile/ms13/attackby(obj/item/O, mob/user, params)
	. = ..()
	if(O == /obj/item/melee/baton)
		Stun(70 -  melee_damage_upper)
	if(is_type_in_list(O, food_type))
		user.visible_message("<span class='notice'>[user] hand-feeds [O] to [src].</span>", "<span class='notice'>You hand-feed [O] to [src].</span>")
		qdel(O)
		if(do_after(user, 3 SECONDS, target = src))
			if (prob(tame_chance)) //note: lack of feedback message is deliberate, keep them guessing!
				tame = TRUE
				tamed(user)
			else
				tame_chance += bonus_tame_chance
	if(stat == CONSCIOUS && tame)
		if(is_type_in_list(O, food_type))
			if(hunger <= maxhunger)
				user.visible_message("<span class='notice'>[user] hand-feeds the [O] to [src].</span>", "<span class='notice'>You hand-feed [O] to [src].</span>")
				hunger += 20
				if(is_young)
					visible_message("<span class='alertalien'>[src] adorably chews the [O].</span>")
					qdel(O)
				if(!has_young && !is_young && breedable == TRUE && hunger >= 150 && prob(30))
					has_young = 1
					visible_message("<span class='alertalien'>[src] hungrily consumes the [O].</span>")
					qdel(O)
				else
					visible_message("<span class='alertalien'>[src] absently munches the [O].</span>")
					qdel(O)
			else if(hunger >= maxhunger)
				user.visible_message("<span class='notice'>The [src] rejects the [O] they dont seem to be hungry right now.</span>")
		/*if(baggable == TRUE)
			if(istype(O, /obj/item/storage/ms13/sack) && !bagged)
				if(tame && do_after(user,55,target=src))
					playsound(get_turf(src), "rustle", 50, TRUE)
					user.visible_message("<span class='notice'>You manage to put [O] on [src], allowing them to store heavy goods.</span>")
					qdel(O)
					bagged = TRUE
					bogged()
					egg_type = null
					return */ //Sack no longer exists, so no packing rats
		if(rideable == TRUE)
			if(istype(O, /obj/item/saddle) && !saddled)
				if(tame && do_after(user,55,target=src))
					playsound(get_turf(src), "rustle", 50, TRUE)
					user.visible_message("<span class='notice'>You manage to put [O] on [src], you can now ride [p_them()].</span>")
					qdel(O)
					saddled = TRUE
					saddleup()
					egg_type = null
					return
				else
					user.visible_message("<span class='warning'>[src] is rocking around! You can't put the saddle on!</span>")
			else
				return ..()

//Mobs that attack in retaliation, Brahmin, etc. (oh yeah, boo hoo, no more slaughtering 85 brahmin for meat dawg)

/mob/living/simple_animal/hostile/retaliate/ms13
	name = "ms13 mob"
	desc = "If you see this, kill it, purge it and call the developer hotline, we will beat those mappers/admins, lickety split!"
	icon = 'mojave/icons/mob/ms13animals.dmi'
	icon_state = ""
	gender = NEUTER
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list()
	speak_emote = list()
	emote_hear = list()
	emote_see = list()
	speak_chance = 15
	turns_per_move = 5
	see_in_dark = 6
	butcher_results = list()
	guaranteed_butcher_results = list()
	loot = list()
	response_help_continuous = "pats"
	response_help_simple = "pat"
	response_disarm_continuous = "pushes aside"
	response_disarm_simple = "push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_sound = 'sound/weapons/punch1.ogg'
	speak_emote = list()
	health = 100
	maxHealth = 100
	speed = 2
	blood_volume = BLOOD_VOLUME_NORMAL
	footstep_type = FOOTSTEP_MOB_HEAVY
	status_flags = CANSTUN
	mob_size = MOB_SIZE_LARGE
	stop_automated_movement_when_pulled = 1
	wound_bonus = -5
	bare_wound_bonus = 5
	var/food_type = list()
	var/tame_chance = 10
	var/bonus_tame_chance = 15
	var/tame = FALSE
	var/eggable = FALSE
	var/egg_type = null
	var/eggsleft = 0
	var/rideable = FALSE
	var/saddled = FALSE
	var/baggable = FALSE
	var/bagged = FALSE
	var/breedable = FALSE
	var/smallasslad = FALSE
	var/is_young = FALSE
	var/has_young = FALSE
	var/young_type = null
	var/adult_type = null
	var/growth
	var/hunger = 200
	var/maxhunger = 200
	var/offsetx = 0
	var/offsety = 0
	var/idlesound = null
	var/idlechance = 5

/mob/living/simple_animal/hostile/retaliate/ms13/Initialize()
	. = ..()
	AddComponent(/datum/component/tameable, tame_chance = 10, bonus_tame_chance = 15, after_tame = CALLBACK(src, .proc/tamed))
	icon_dead = "[icon_state]_dead"
	var/matrix/bambinoscale = matrix()
	if(is_young == TRUE)
		bambinoscale.Scale(0.7, 0.7)
		transform = bambinoscale
	if(smallasslad == TRUE)
		//makes them small ass lads look all funky n shi
		set_base_pixel_x(base_pixel_x + rand(-6, 6))
		set_base_pixel_y(base_pixel_y + rand(0, 10))
	if(tame)
		if(eggable == TRUE)
			eggsleft = 0

/mob/living/simple_animal/hostile/retaliate/ms13/proc/tamed(mob/living/tamer)
	faction = list("neutral")
	tame = TRUE

//hunger and baby grow/birth/speed shitcode
/mob/living/simple_animal/hostile/retaliate/ms13/Life()
	. =..()
	if(enemies.len && prob(10))
		enemies = list()
		LoseTarget()
		src.visible_message("<span class='notice'>[src] calms down.</span>")
	if(tame)
		var/hungerrate = rand(0.2,0.3)
		hunger -= hungerrate
		if(hunger == 0)
			hungerrate = 0
		if(stat == CONSCIOUS && breedable == TRUE)
			if((prob(3) && has_young))
				has_young++
			if(has_young > 10)
				has_young = 0
				visible_message("<span class='alertalien'>[src] has produced a baby.</span>")
				new young_type(src.loc)
			if(is_young)
				growth++
				if(growth > 50)
					is_young = 0
					new adult_type(src.loc)
					qdel(src)
					visible_message("<span class='alertalien'>[src] has fully grown.</span>")
					return
		if(eggable == TRUE)
			if(!stat)
				if(hunger >= 150 && eggsleft < 8)
					eggsleft += rand(1, 4)
					hunger -= 100
				if(hunger == 0)
					eggsleft = 0 //starvin now foo
				else
					return
			if((!stat && prob(3) && eggsleft > 0) && egg_type)
				visible_message("<span class='alertalien'>[src] [pick(EGG_LAYING_MESSAGES)]</span>")
				eggsleft--
				var/obj/item/E = new egg_type(get_turf(src))
				E.pixel_x = rand(-6,6)
				E.pixel_y = rand(-6,6)
				return
	if(stat)
		return
	if (idlesound)
		if (prob(idlechance))
			var/chosen_sound = pick(idlesound)
			playsound(src, chosen_sound, 60, FALSE)

/mob/living/simple_animal/hostile/retaliate/ms13/proc/saddleup()
	var/speedmodifier = speed/(hunger/maxhunger)
	if(saddled == TRUE)
		can_buckle = TRUE
		buckle_lying = FALSE
		add_overlay("[icon_state]_saddled")
		var/datum/component/riding/D = LoadComponent(/datum/component/riding)
		D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 8 + offsety), TEXT_SOUTH = list(0, 8 + offsety), TEXT_EAST = list(-2 - offsetx, 8 + offsety), TEXT_WEST = list(2 + offsetx, 8 + offsety)))
		D.vehicle_move_delay = speedmodifier

/mob/living/simple_animal/hostile/retaliate/ms13/proc/bogged()
	if(bagged == TRUE)
		AddComponent(/datum/component/storage/concrete)
		var/datum/component/storage/STR = GetComponent(/datum/component/storage)
		STR.max_combined_w_class = 100
		STR.max_w_class = WEIGHT_CLASS_BULKY
		STR.max_items = 20
		add_overlay("[icon_state]_bagged")

/mob/living/simple_animal/hostile/retaliate/ms13/Retaliate()
	..()
	src.visible_message("<span class='danger'>The [src] starts kicking off!</span>")

/mob/living/simple_animal/hostile/retaliate/ms13/attackby(obj/item/O, mob/user, params)
	. = ..()
	if(O == /obj/item/melee/baton)
		Stun(70 -  melee_damage_upper)
	if(is_type_in_list(O, food_type))
		user.visible_message("<span class='notice'>[user] hand-feeds [O] to [src].</span>", "<span class='notice'>You hand-feed [O] to [src].</span>")
		qdel(O)
		if(do_after(user, 3 SECONDS, target = src))
			if (prob(tame_chance)) //note: lack of feedback message is deliberate, keep them guessing!
				tame = TRUE
				tamed(user)
			else
				tame_chance += bonus_tame_chance
	if(stat == CONSCIOUS && tame)
		if(is_type_in_list(O, food_type))
			if(hunger <= maxhunger)
				user.visible_message("<span class='notice'>[user] hand-feeds the [O] to [src].</span>", "<span class='notice'>You hand-feed [O] to [src].</span>")
				hunger += 20
				if(is_young)
					visible_message("<span class='alertalien'>[src] adorably chews the [O].</span>")
					qdel(O)
				if(!has_young && !is_young && breedable == TRUE && hunger >= 150 && prob(30))
					has_young = 1
					visible_message("<span class='alertalien'>[src] hungrily consumes the [O].</span>")
					qdel(O)
				else
					visible_message("<span class='alertalien'>[src] absently munches the [O].</span>")
					qdel(O)
			else if(hunger >= maxhunger)
				user.visible_message("<span class='notice'>The [src] rejects the [O] they dont seem to be hungry right now.</span>")
		/*if(baggable == TRUE)
			if(istype(O, /obj/item/storage/ms13/sack) && !bagged)
				if(tame && do_after(user,55,target=src))
					playsound(get_turf(src), "rustle", 50, TRUE)
					user.visible_message("<span class='notice'>You manage to put [O] on [src], allowing them to store heavy goods.</span>")
					qdel(O)
					bagged = TRUE
					bogged()
					egg_type = null
					return */ //Sack no longer exists, so no packing rats
		if(rideable == TRUE)
			if(istype(O, /obj/item/saddle) && !saddled)
				if(tame && do_after(user,55,target=src))
					playsound(get_turf(src), "rustle", 50, TRUE)
					user.visible_message("<span class='notice'>You manage to put [O] on [src], you can now ride [p_them()].</span>")
					qdel(O)
					saddled = TRUE
					saddleup()
					egg_type = null
					return
				else
					user.visible_message("<span class='warning'>[src] is rocking around! You can't put the saddle on!</span>")

/mob/living/simple_animal/hostile/ms13/robot
	name = "ms13 robot"
	desc = "If you see this, kill it, purge it and call the developer hotline, we will beat those mappers/admins, lickety split!"
	icon = 'mojave/icons/mob/ms13robots.dmi'
	deathsound = 'mojave/sound/ms13npc/robot_death.ogg'
	wander = TRUE
	faction = list("robots")
	check_friendly_fire = TRUE
	mob_biotypes = MOB_ROBOTIC
	turns_per_move = 5
	see_in_dark = 7
	deathmessage = "blows apart!"
	loot = list(/obj/item/stack/sheet/ms13/scrap, /obj/effect/decal/cleanable/robot_debris)
	speak_emote = list("states", "buzzes", "crackles")
	blood_volume = null
	food_type = null
	tame_chance = 0
	aggro_vision_range = 12
	stat_attack = HARD_CRIT
	status_flags = null
	mob_size = MOB_SIZE_HUMAN
	stop_automated_movement_when_pulled = 0
	wound_bonus = -5
	bare_wound_bonus = 5
	var/shadow_type = null // For shadows below floating robots
	var/bot_type = null // Literally just for naming

/mob/living/simple_animal/hostile/retaliate/ms13/robot
	name = "ms13 robot"
	desc = "If you see this, kill it, purge it and call the developer hotline, we will beat those mappers/admins, lickety split!"
	icon = 'mojave/icons/mob/ms13robots.dmi'
	deathsound = 'mojave/sound/ms13npc/robot_death.ogg'
	wander = TRUE
	faction = list("robots")
	check_friendly_fire = TRUE
	turns_per_move = 5
	see_in_dark = 7
	deathmessage = "blows apart!"
	loot = list(/obj/item/stack/sheet/ms13/scrap, /obj/effect/decal/cleanable/robot_debris)
	speak_emote = list("states", "buzzes", "crackles")
	blood_volume = null
	food_type = null
	tame_chance = 0
	aggro_vision_range = 12
	status_flags = null
	mob_size = MOB_SIZE_HUMAN
	footstep_type = FOOTSTEP_MOB_HEAVY
	stop_automated_movement_when_pulled = 0
	wound_bonus = -5
	bare_wound_bonus = 5
	var/shadow_type = null
	var/bot_type = null
