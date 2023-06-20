/mob/living/carbon/human/apply_damage(damage, \
							damagetype = BRUTE, \
							def_zone = null, \
							blocked = FALSE, \
							forced = FALSE, \
							spread_damage = FALSE, \
							wound_bonus = 0, \
							bare_wound_bonus = 0, \
							sharpness = NONE, \
							attack_direction = null, \
							reduced = 0, \
							edge_protection = 0, \
							subarmor_flags = NONE)
	return dna.species.apply_damage(damage, \
									damagetype, \
									def_zone, \
									blocked, \
									src, \
									forced, \
									spread_damage, \
									wound_bonus, \
									bare_wound_bonus, \
									sharpness, \
									attack_direction, \
									reduced, \
									edge_protection, \
									subarmor_flags)

/datum/species/apply_damage(damage, \
						damagetype = BRUTE, \
						def_zone = null, \
						blocked, \
						mob/living/carbon/human/H, \
						forced = FALSE, \
						spread_damage = FALSE, \
						wound_bonus = 0, \
						bare_wound_bonus = 0, \
						sharpness = NONE, \
						attack_direction = null,
						reduced = 0, \
						edge_protection = 0, \
						subarmor_flags = NONE)
	SEND_SIGNAL(H, COMSIG_MOB_APPLY_DAMAGE, damage, damagetype, def_zone, wound_bonus, bare_wound_bonus, sharpness, attack_direction)
	var/hit_percent = (100-(blocked+armor))/100
	hit_percent = (hit_percent * (100-H.physiology.damage_resistance))/100
	if(!damage || (!forced && hit_percent <= 0))
		return 0

	var/obj/item/bodypart/BP = null
	if(!spread_damage)
		if(isbodypart(def_zone))
			BP = def_zone
		else
			if(!def_zone)
				def_zone = ran_zone(def_zone)
			BP = H.get_bodypart(check_zone(def_zone))
			if(!BP)
				BP = H.bodyparts[1]

	switch(damagetype)
		if(BRUTE)
			H.damageoverlaytemp = 20
			if(BP)
				if(BP.receive_damage(brute = (damage * brutemod * H.physiology.brute_mod), \
									wound_bonus = wound_bonus, \
									bare_wound_bonus = bare_wound_bonus, \
									sharpness = sharpness, \
									attack_direction = attack_direction, \
									blocked = blocked, \
									reduced = reduced, \
									edge_protection = edge_protection, \
									subarmor_flags = subarmor_flags))
					H.update_damage_overlays()
			else//no bodypart, we deal damage with a more general method.
				var/damage_amount = forced ? damage : damage * hit_percent * brutemod * H.physiology.brute_mod
				H.adjustBruteLoss(damage_amount)
		if(BURN)
			H.damageoverlaytemp = 20
			if(BP)
				if(BP.receive_damage(burn = (damage * burnmod * H.physiology.burn_mod), \
									wound_bonus = wound_bonus, \
									bare_wound_bonus = bare_wound_bonus, \
									sharpness = sharpness, \
									attack_direction = attack_direction, \
									blocked = blocked, \
									reduced = reduced, \
									edge_protection = edge_protection, \
									subarmor_flags = subarmor_flags))
					H.update_damage_overlays()
			else
				var/damage_amount = forced ? damage : damage * hit_percent * burnmod * H.physiology.burn_mod
				H.adjustFireLoss(damage_amount)
		if(TOX)
			var/damage_amount = forced ? damage : damage * hit_percent * H.physiology.tox_mod
			H.adjustToxLoss(damage_amount)
		if(OXY)
			var/damage_amount = forced ? damage : damage * hit_percent * H.physiology.oxy_mod
			H.adjustOxyLoss(damage_amount)
		if(CLONE)
			var/damage_amount = forced ? damage : damage * hit_percent * H.physiology.clone_mod
			H.adjustCloneLoss(damage_amount)
		if(STAMINA)
			var/damage_amount = forced ? damage : damage * hit_percent * H.physiology.stamina_mod
			if(BP)
				if(BP.receive_damage(stamina = damage_amount))
					H.update_stamina()
			else
				H.adjustStaminaLoss(damage_amount)
		if(BRAIN)
			var/damage_amount = forced ? damage : damage * hit_percent * H.physiology.brain_mod
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, damage_amount)
	return 1
