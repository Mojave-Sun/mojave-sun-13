////////////////MOJAVE SUN CIGARETTE LUNG EFFECT STORAGE/////////////////

//Penalties and benefits of smoking

//3 chain_smokah minute thingies in 1 cigarette
//1 cigarette lasts 5 minutes, gives 5 minute of buff and whatever peaks when no reagents are left equivalent debuff
//9 nicotine numbers per minute

/obj/item/organ/lungs
	var/chain_smokah = 0 //variable for cigarette abuse damage
	var/nicotine = 0 //variable for nicotine potency and effects
	var/smoking = FALSE
	var/has_nic = FALSE //nic check

/obj/item/organ/lungs/on_life()
	. = ..()
	if(smoking && !(owner.wear_mask)) //no longer smoking
		smoking = FALSE
	if(!smoking && (nicotine) < (0)) //catch check
		nicotine = 0
	if(!smoking && (nicotine) >= (0))
		nicotine -= 0.15 //dissipates at the same rate as nic intake, equal debuff time
	if(!smoking && (chain_smokah) >= (3)) //no cigarette in mouth, has smoked at least 1 cigarette, first smigglerette always the best
		chain_smokah -= 0.05 //dissipates 1 cigarette smoked a minute
	if((owner.reagents.get_reagent_amount(/datum/reagent/ms13/nicotine) > 0)) //COOLING
		has_nic = TRUE
	if((owner.reagents.get_reagent_amount(/datum/reagent/ms13/nicotine) == 0)) //JONESING
		has_nic = FALSE
	if(has_nic) //NIC!!!
		switch(nicotine)
			if(2 to 4.5) //kicks in after 30 seconds
				SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, "smoked", /datum/mood_event/smoked)
				owner.remove_actionspeed_modifier(ALL_CIG)
				if(prob(5))
					to_chat(owner, "<span class='green'>[pick("You feel slightly calmed.", "You feel a little more alert.", "Your body feels more awake.")]</span>")
			if(4.6 to 54.9) //chill
				SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, "smoked", /datum/mood_event/smoked)
				owner.remove_actionspeed_modifier(ALL_BUT_ONE_CIG)
				owner.add_actionspeed_modifier(/datum/actionspeed_modifier/one_cig)
				if(prob(3))
					to_chat(owner, "<span class='green'>[pick("You feel calmed.", "You feel more alert.", "You feel a little energised.")]</span>")
			if(55 to 107.9) //buzzed
				SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, "smoked", /datum/mood_event/smoked)
				owner.remove_actionspeed_modifier(ALL_BUT_TWO_CIG)
				owner.add_actionspeed_modifier(/datum/actionspeed_modifier/two_cig)
				if(prob(4))
					to_chat(owner, "<span class='green'>[pick("You feel focused.", "You feel more aware.", "You feel very awake.")]</span>")
			if(108 to 162) //super buzzed
				SEND_SIGNAL(owner, COMSIG_ADD_MOOD_EVENT, "smoked", /datum/mood_event/smoked)
				owner.remove_actionspeed_modifier(ALL_BUT_THREE_CIG)
				owner.add_actionspeed_modifier(/datum/actionspeed_modifier/three_cig)
				if(prob(6))
					to_chat(owner, "<span class='green'>[pick("You feel extremely focused.", "You feel super aware!", "You feel extremely energised!")]</span>")
	if(!has_nic) //NO NIC!!
		switch(nicotine)
			if(2 to 4.5)
				SEND_SIGNAL(owner, COMSIG_CLEAR_MOOD_EVENT, "smoked")
				owner.remove_actionspeed_modifier(ALL_CIG)
				if(prob(1))
					to_chat(owner, "<span class='danger'>[pick("You feel normal.", "You feel a little tired.")]</span>")
			if(4.6 to 54.9)
				SEND_SIGNAL(owner, COMSIG_CLEAR_MOOD_EVENT, "smoked")
				owner.remove_actionspeed_modifier(ALL_BUT_ONE_AFTER_CIG)
				owner.add_actionspeed_modifier(/datum/actionspeed_modifier/after_one_cig)
				if(prob(2))
					to_chat(owner, "<span class='danger'>[pick("You feel drowsy.", "You feel a bit out of it.")]</span>")
			if(55 to 107.9)
				SEND_SIGNAL(owner, COMSIG_CLEAR_MOOD_EVENT, "smoked")
				owner.remove_actionspeed_modifier(ALL_BUT_TWO_AFTER_CIG)
				owner.add_actionspeed_modifier(/datum/actionspeed_modifier/after_two_cig)
				if(prob(5))
					to_chat(owner, "<span class='danger'>[pick("You feel tired.", "You feel unfocused.")]</span>")
			if(108 to 162)
				SEND_SIGNAL(owner, COMSIG_CLEAR_MOOD_EVENT, "smoked")
				owner.remove_actionspeed_modifier(ALL_BUT_THREE_AFTER_CIG)
				owner.add_actionspeed_modifier(/datum/actionspeed_modifier/after_three_cig)
				if(prob(6))
					to_chat(owner, "<span class='danger'>[pick("You feel exhausted.", "You feel completely out of it.")]</span>")
	switch(chain_smokah)
		if(9 to 11.9) //3 cigarettes
			owner.adjustOrganLoss(ORGAN_SLOT_LUNGS, 0.01)
			if(prob(1))
				to_chat(owner, "<span class='danger'>[pick("Your head hurts.", "Your mouth feels acrid.")]</span>")
			if(prob(5))
				owner.emote(pick("cough","yawn"))
		if(12 to 14.9) //4 cigarettes
			owner.adjustOrganLoss(ORGAN_SLOT_LUNGS, 0.02)
			if(prob(1))
				to_chat(owner, "<span class='danger'>[pick("You feel sick.", "You feel lightheaded.")]</span>")
			if(prob(5))
				owner.emote(pick("cough","yawn","twitch_s"))
			if(prob(1))
				owner.Jitter(8)
		if(15 to 17.9) //5 cigarettes
			owner.adjustOrganLoss(ORGAN_SLOT_LUNGS, 0.03)
			if(prob(1))
				to_chat(owner, "<span class='userdanger'>[pick("Your head hurts like hell.", "Your eyes feel very dry.")]</span>")
				owner.emote("cough")
			if(prob(7))
				owner.emote(pick("cough","yawn","twitch_s","sway"))
			if(prob(2))
				owner.Jitter(8)
			if(prob(1))
				owner.blur_eyes(10)
			if(owner?.hud_used)
				var/atom/movable/plane_master_controller/pm_controller = owner.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
				for(var/atom/movable/screen/plane_master/plane as anything in pm_controller.controlled_planes)
					animate(pm_controller.controlled_planes[plane], transform = matrix(), time = 5, easing = QUAD_EASING)
		if(18 to 20.9) //6 cigarettes
			var/atom/movable/plane_master_controller/pm_controller = owner.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
			owner.adjustOrganLoss(ORGAN_SLOT_LUNGS, 0.04)
			if(prob(1))
				to_chat(owner, "<span class='userdanger'>[pick("Your throat feels incredibly tight!", "Your head is hurting like hell!")]</span>")
			if(prob(10))
				owner.emote(pick("cough","yawn","twitch_s","sway","gasp"))
			if(prob(5))
				owner.Jitter(8)
			if(prob(3))
				owner.blur_eyes(10)
			if(owner.hud_used)
				for(var/atom/movable/screen/plane_master/plane as anything in pm_controller.controlled_planes)
					animate(pm_controller.controlled_planes[plane], transform = matrix(5, MATRIX_ROTATE), time = 5, easing = QUAD_EASING, loop = -1)
					animate(transform = matrix(-5, MATRIX_ROTATE), time = 5, easing = QUAD_EASING)
		if(21 to 100) //7 cigarettes, pack a day smokers in tears
			var/atom/movable/plane_master_controller/pm_controller = owner.hud_used.plane_master_controllers[PLANE_MASTERS_GAME]
			owner.adjustOrganLoss(ORGAN_SLOT_LUNGS, 1)
			if(prob(1))
				to_chat(owner, "<span class='userdanger'>[pick("You feel extremely weak! Finding it near impossible to breathe! Your head pounding like hell!")]</span>")
				owner.emote("gasp")
			if(prob(15))
				owner.emote(pick("cough","yawn","twitch_s","sway","gasp"))
			if(prob(10))
				owner.Jitter(8)
			if(prob(10))
				owner.blur_eyes(10)
			if(prob(3))
				owner.vomit(20)
			if(owner.hud_used)
				for(var/atom/movable/screen/plane_master/plane as anything in pm_controller.controlled_planes)
					animate(pm_controller.controlled_planes[plane], transform = matrix(10, MATRIX_ROTATE), time = 5, easing = QUAD_EASING, loop = -1)
					animate(transform = matrix(-10, MATRIX_ROTATE), time = 5, easing = QUAD_EASING)
