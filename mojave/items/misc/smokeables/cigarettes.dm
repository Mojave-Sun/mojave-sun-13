////////////////MOJAVE SUN CIGARETTES 🚬 STORAGE/////////////////

#define CIGARETTE	3.6
#define CIGAR	6
#define SMOKEMINUTE SECONDS*6

//Base Type

/obj/item/ms13/cigarette
	name = "cigarette"
	desc = "An unbranded cigarette."
	icon = 'mojave/icons/objects/smokeables/smokeables_world.dmi'
	icon_state = "cigarette"
	inventory_state = "cigarette"
	world_state = "cigarette"
	worn_icon = 'mojave/icons/objects/smokeables/smokeables_mob.dmi'
	worn_icon_state = "cigarette"
	lefthand_file = 'mojave/icons/mob/inhands/misc/smokeables_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/misc/smokeables_righthand.dmi'
	inhand_icon_state = "cigarette"
	throw_speed = 0.5
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_MASK
	light_system = MOVABLE_LIGHT
	light_on = FALSE
	light_range = 1.4
	light_power = 0.3
	light_color = "#ddd2b9"
	var/dragtime = 5 SECONDS
	var/nextdragtime = 0
	var/lit = FALSE
	var/mutable_appearance/lit_mutable = "lit"
	var/mutable_appearance/extinguished_mutable = "extinguished"
	var/lastHolder = null
	var/smoketime = 5 SMOKEMINUTE //5 minutes per cig, 300 seconds
	var/chem_volume = 30
	var/list_reagents = list(/datum/reagent/ms13/nicotine = 21) //used for tracking effects in body, not directly from reagent, 6 minutes of effect, butt is extra 1 minute
	var/nicotine_potency = 0.15 //used for nicotine effect in body
	var/lung_harm = 0 //solely here for evil cigarettes
	var/smoking_damage = 0.008 //impact on smoking abuse in lungs
	var/lit_type = "ciglit" //Lit Overlay type
	var/butt_icon = "butt"
	var/butt_name = "butt"
	var/butt_desc = "A used cigarette butt, still holds a little nicotine."
	var/buttwarn = FALSE //tells the smoker the butt is down to the end, continuing makes them sick
	var/butt_transform = FALSE //alright butt
	var/smoke_type = null //Used for shortening
	var/fresh = TRUE //unlit, fresh out the pack

/obj/item/ms13/cigarette/Initialize()
	. = ..()
	update_overlays()
	update_icon_state()
	create_reagents(chem_volume, INJECTABLE | NO_REACT)
	if(list_reagents)
		reagents.add_reagent_list(list_reagents)
	AddComponent(/datum/component/knockoff, 100, null, list(ITEM_SLOT_MASK))
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/smokeables/smokeables_inventory.dmi', world_state, inventory_state)

/obj/item/ms13/cigarette/butt
	name = "butt"
	desc = "A used cigarette butt, still holds a little nicotine."
	icon_state = "butt"
	inventory_state = "butt"
	world_state = "butt"
	smoketime = 1 SMOKEMINUTE

/obj/item/ms13/ash
	name = "ash"
	desc = "A small pile of ash."
	icon = 'mojave/icons/objects/smokeables/smokeables_world.dmi'
	icon_state = "ash"

/obj/item/ms13/cigarette/proc/light() //removes lit and unlit states
	if(lit)
		return

	if(fresh)
		inventory_state = "[initial(inventory_state)]_1"
		fresh = FALSE
	START_PROCESSING(SSobj, src)
	lit = TRUE
	update_overlays()
	update_icon_state()
	hitsound = 'sound/items/welder.ogg'
	damtype = "fire"
	force = 4
	set_light_on(TRUE)
	reagents.flags &= ~(NO_REACT)
	reagents.handle_reactions()

	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_wear_mask()
		M.update_inv_hands()
		if(smoketime <= 60) //for the scroungers
			to_chat(M, "<span class='warning'>You desperately light the [name].</span>")

	playsound(src, 'mojave/sound/ms13effects/smokeables/ciglight.ogg', 25, 1)

/obj/item/ms13/cigarette/worn_overlays(mutable_appearance/standing, isinhands)
	. = ..()
	var/mutable_appearance/litty = mutable_appearance('mojave/icons/objects/smokeables/smokeables_mob.dmi', "lit")
	var/mutable_appearance/extinguished = mutable_appearance('mojave/icons/objects/smokeables/smokeables_mob.dmi', "extinguished")
	var/mutable_appearance/litty_ih = mutable_appearance(icon_state = "lit")
	var/mutable_appearance/extinguished_ih = mutable_appearance(icon_state = "extinguished")
	if(!isinhands && lit)
		. += litty
	if(!isinhands && !lit && !fresh)
		. += extinguished
	if(isinhands && lit)
		. += litty_ih
	if(isinhands && !lit && !fresh)
		. += extinguished_ih

/obj/item/ms13/cigarette/extinguish() //removes lit and unlit states
	if(!lit)
		return
	hitsound = null
	damtype = BRUTE
	force = 0
	STOP_PROCESSING(SSobj, src)
	lit = FALSE
	set_light_on(FALSE)
	update_overlays()
	update_icon_state()
	if(ismob(loc))
		var/mob/living/M = loc
		var/obj/item/organ/lungs/L = M.getorganslot(ORGAN_SLOT_LUNGS)
		L.smoking = FALSE
		to_chat(M, "<span class='notice'>The [name] goes out.</span>")
		M.update_inv_wear_mask()
		M.update_inv_hands()

/obj/item/ms13/cigarette/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/ms13/cigarette/attackby(obj/item/W, mob/user, params)
	if(!lit && smoketime > 0)
		var/lighting_text = W.ignition_effect(src, user)
		if(lighting_text)
			light(lighting_text)
	else
		return ..()

/obj/item/ms13/cigarette/attack_self(mob/user)
	if(lit)
		playsound(src, 'mojave/sound/ms13effects/smokeables/cigsnuff.ogg', 25, 1)
		if(smoketime <= 60)
			var/obj/item/ash = new /obj/item/ms13/ash(get_turf(src))
			ash.pixel_x = rand(-10, 2)
			ash.pixel_y = rand(-10, 2)
			if(ismob(user))
				to_chat(user, "<span class='notice'>Your [name] is smoked to ash, nasty.</span>")
				playsound(src, 'mojave/sound/ms13effects/smokeables/cigsnuff.ogg', 25, 1)
			qdel(src)
			return
		if(smoketime < 120 && !butt_transform)
			smoketime = 50
			icon_state = "[butt_icon]"
			inventory_state = "[butt_icon]"
			world_state = "[butt_icon]"
			user.visible_message("<span class='notice'>[user] puts out \the [src], flicking the butt away.</span>")
			name = "[name] [butt_name]"
			desc = "[butt_desc]"
			butt_transform = TRUE
			forceMove(drop_location())
			extinguish(src)
			/*pixel_x = rand(-4, 4)
			pixel_y = rand(-4, 4)
			pixel_z = 8 //bounce time
			SpinAnimation(speed = 3 SECONDS, loops = 2)
			var/angle_of_movement = !isnull(user) ? (rand(-3000, 3000) / 100) : rand(-3000, 3000) / 100
			AddComponent(/datum/component/movable_physics, _horizontal_velocity = rand(450, 550) / 100, _vertical_velocity = rand(400, 450) / 100, _horizontal_friction = rand(20, 24) / 100, _z_gravity = 9.80665, _z_floor = 0, _angle_of_movement = angle_of_movement)
			*///Un comment on pr for epic flicking badassery
		else
			smoketime -= 50 // goodbye juicy smigglerette
			update_overlays()
			update_icon_state()
			extinguish(src)
			user.visible_message("<span class='notice'>[user] pinches \the end of [src], putting it out.</span>")
	. = ..()

/obj/item/ms13/cigarette/process()
	var/mob/living/M = loc
	if(isliving(M))
		M.IgniteMob()
	smoketime--
	if(smoketime < 1)
		var/obj/item/ash = new /obj/item/ms13/ash(get_turf(src))
		ash.pixel_x = rand(-10, 2)
		ash.pixel_y = rand(-10, 2)
		if(ismob(M))
			to_chat(M, "<span class='notice'>Your [name] is smoked to ash, nasty.</span>")
			playsound(src, 'mojave/sound/ms13effects/smokeables/cigsnuff.ogg', 25, 1)
		qdel(src)
		return
	open_flame()
	shmoke()
	update_overlays()
	update_icon_state()
	switch(smoketime)
		if(270)
			inventory_state = "[initial(inventory_state)]_2"
		if(220)
			inventory_state = "[initial(inventory_state)]_3"
		if(170)
			inventory_state = "[initial(inventory_state)]_4"
		if(120)
			inventory_state = "[initial(inventory_state)]_5"
		if(60)
			if(!buttwarn && ismob(M)) //for the ones still smoking
				to_chat(M, "<span class='warning'>Your [name] is burnt down to the end, the taste is foul.</span>")
				buttwarn = TRUE
		if(0 to 60)
			if(!butt_transform)
				icon_state = "[butt_icon]"
				inventory_state = "[butt_icon]"
				world_state = "[butt_icon]"
				name = "[name] [butt_name]"
				desc = "[butt_desc]"
				smoking_damage = 0.05 //not good
				butt_transform = TRUE
			if(prob(40) && ismob(M))
				to_chat(M, "<span class='warning'>[pick("You taste something burnt.", "You taste something foul.")]</span>")
			if(prob(10) && ismob(M))
				M.adjustToxLoss(1)

/obj/item/ms13/cigarette/proc/shmoke()
	if(iscarbon(loc))
		var/turf/my_turf = get_turf(loc)
		my_turf.VapourListTurf(list(/datum/vapours/smoke = 3, /datum/vapours/carbon_air_vapour = 0.2), VAPOUR_ACTIVE_EMITTER_CAP)
		var/mob/living/carbon/human/C = loc
		var/obj/item/organ/lungs/L = C.getorganslot(ORGAN_SLOT_LUNGS)
		if(prob(30))
			playsound(C, pick(SMOKING_SMOLDER_SOUNDS), 100)
		if(prob(10) && C.gender == MALE || C.gender == PLURAL)
			playsound(C, pick(SMOKING_INHALE_MALE_SOUNDS), 100)
		if(prob(10) && C.gender == FEMALE)
			playsound(C, pick(SMOKING_INHALE_FEMALE_SOUNDS), 100)
		if(src == C.wear_mask)
			L.smoking = TRUE
			if((reagents && reagents.total_volume) && (nextdragtime <= world.time))
				nextdragtime = world.time + dragtime
				handle_reagents()
			if(L && !(L.organ_flags & ORGAN_SYNTHETIC) && L.chain_smokah < 100) //max 7 cigarettes
				L.chain_smokah += smoking_damage
			if(L && !(L.organ_flags & ORGAN_SYNTHETIC) && L.nicotine < 162) //max 3 cigarette effects stacked
				L.nicotine += nicotine_potency
		if(!(src == C.wear_mask))
			L.smoking = FALSE

/obj/item/ms13/cigarette/update_overlays()
	cut_overlays()
	if(lit)
		switch(smoketime) //catchchecks included for icon states
			if(271 to 1800)
				inventory_state = "[initial(inventory_state)]_1"
				add_overlay(image(icon, icon_state = "[lit_type]_1"))
			if(221 to 270)
				inventory_state = "[initial(inventory_state)]_2"
				add_overlay(image(icon, icon_state = "[lit_type]_2"))
			if(171 to 220)
				inventory_state = "[initial(inventory_state)]_3"
				add_overlay(image(icon, icon_state = "[lit_type]_3"))
			if(121 to 170)
				inventory_state = "[initial(inventory_state)]_4"
				add_overlay(image(icon, icon_state = "[lit_type]_4"))
			if(61 to 120)
				inventory_state = "[initial(inventory_state)]_5"
				add_overlay(image(icon, icon_state = "[lit_type]_5"))
			if(0 to 60)
				inventory_state = "[butt_icon]"
				world_state = "[butt_icon]"
				add_overlay(image(icon, icon_state = "[lit_type]_6"))
	. = ..()

/obj/item/ms13/cigarette/proc/handle_reagents()
	if(!reagents.total_volume)
		return
	reagents.expose_temperature(heat, 0.05)
	if(!reagents.total_volume) //may have reacted and gone to 0 after expose_temperature
		return
	var/to_smoke = (reagents.total_volume * (dragtime / smoketime))
	var/mob/living/carbon/smoker = loc
	if(!istype(smoker) || src != smoker.wear_mask)
		reagents.remove_any(to_smoke)
		return

	reagents.expose(smoker, INGEST, min(to_smoke / reagents.total_volume, 1))
	if(!reagents.trans_to(smoker, to_smoke, methods = INGEST, ignore_stomach = TRUE))
		reagents.remove_any(to_smoke)

/obj/item/ms13/cigarette/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(!istype(M))
		return ..()
	if(M.on_fire && !lit)
		light()
		to_chat(user, "<span class='notice'>[user] lights [src] with [M]'s burning body. What a badass.</span>")
		return
	var/obj/item/ms13/cigarette/cig = help_light_cig(M)
	if(lit && cig && !user.combat_mode)
		if(cig.lit)
			to_chat(user, "<span class='warning'>The [cig.name] is already lit!</span>")
		if(M == user)
			cig.attackby(src, user)
		else
			cig.light()
			to_chat(user, "<span class='notice'>[user] holds the [name] out for [M], and lights [M.p_their()] [cig.name].</span>")
	else
		return ..()

/obj/item/help_light_cig(mob/living/M)
	. = ..()
	var/mask_item = M.get_item_by_slot(ITEM_SLOT_MASK)
	if(istype(mask_item, /obj/item/ms13/cigarette))
		return mask_item

/obj/item/ms13/cigarette/fire_act(exposed_temperature, exposed_volume)
	light()

//Cigarettes Brands

/obj/item/ms13/cigarette/winstons
	desc = "A pre-war cigarette, banded with a black brand marking. <B><I>Winston</I></B>."
	inventory_state = "winston"

/obj/item/ms13/cigarette/marlboro
	desc = "A pre-war cigarette, banded with a red brand marking. <B><I>Marlboro</I></B>."
	inventory_state = "marl"

/obj/item/ms13/cigarette/salem
	desc = "A pre-war cigarette, banded with a cyan brand marking. <B><I>Salem</I></B>."
	inventory_state = "salem"

/obj/item/ms13/cigarette/kools
	desc = "A pre-war cigarette, banded with a green brand marking. <B><I>Kools</I></B>."
	inventory_state = "kool"

/obj/item/ms13/cigarette/lucky
	desc = "A pre-war cigarette, featuring a lucky red star on it."
	inventory_state = "lucky"

//Rollies/Brands

/obj/item/ms13/cigarette/rollie
	name = "rollie"
	desc = "A rolled joint of paper, filled with dried plant matter."
	icon_state = "rollie"
	inventory_state = "rollie"
	world_state = "rollie"
	worn_icon_state = "cigarette"
	inhand_icon_state = "cigarette"
	list_reagents = list(/datum/reagent/ms13/nicotine = 14) //less potent, 4 minutes of effect, roach is extra 1 minute
	nicotine_potency = 0.10 //less potent
	smoking_damage = 0.005 //organic
	lit_type = "ciglit" //Lit Overlay type
	butt_icon = "roach"
	butt_name = "roach"
	butt_desc = "The burnt end of a rollie, really scraping the barrel if you smoke this."

/obj/item/ms13/cigarette/butt/roach
	name = "roach"
	desc = "The burnt end of a rollie, really scraping the barrel if you smoke this."
	icon_state = "roach"
	inventory_state = "roach"
	world_state = "roach"

/obj/item/ms13/cigarette/rollie/republic
	desc = "A rolled joint, featuring the iconic red star of the <B>NCR</B>."
	inventory_state = "repub"
