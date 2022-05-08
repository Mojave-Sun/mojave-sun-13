/mob/living/simple_animal/hostile/ms13/robot/handy
	name = "Mr. Handy"
	desc = "A standard model Mr. Handy unit. It's long lost any rational wires in its circuits."
	icon_state = "mrhandy_claw"
	icon_living = "mrhandy_claw"
	health = 135
	maxHealth = 135
	melee_damage_lower = 15
	melee_damage_upper = 15
	armour_penetration = 5
	move_to_delay = 3
	speed = 1
	sharpness = NONE
	wound_bonus = 5
	bare_wound_bonus = 5
	speak_emote = list("states", "says")
	attack_verb_continuous = "pinches"
	attack_verb_simple = "pinch"
	footstep_type = null
	stat_attack = SOFT_CRIT
	shadow_type = "shadow_large"

/mob/living/simple_animal/hostile/ms13/robot/handy/New()
	..()
	add_overlay(image(icon, "[shadow_type]", BELOW_MOB_LAYER, dir))

/mob/living/simple_animal/hostile/ms13/robot/handy/death()
	. = ..()
	do_sparks(3, TRUE, src)
	qdel(src)

/mob/living/simple_animal/hostile/ms13/robot/handy/saw
	desc = "A work model Mr. Handy unit, armed with a horrifyingly sharp saw. It's long lost any rational wires in its circuits."
	icon_state = "mrhandy_saw"
	icon_living = "mrhandy_saw"
	melee_damage_lower = 30
	melee_damage_upper = 30
	armour_penetration = 10
	sharpness = SHARP_EDGED
	wound_bonus = 6
	bare_wound_bonus = 6
	attack_verb_continuous = "saws"
	attack_verb_simple = "saw"
	attack_sound = 'sound/weapons/circsawhit.ogg'

/mob/living/simple_animal/hostile/ms13/robot/handy/laser
	desc = "An armed model of Mr. Handy unit. It's long lost any rational wires in its circuits. It's equipped with a laser rifle!"
	icon_state = "mrhandy_laser"
	icon_living = "mrhandy_laser"
	minimum_distance = 3
	retreat_distance = 5
	attack_verb_continuous = "pinches"
	attack_verb_simple = "pinch"
	loot = list(/obj/item/stack/sheet/ms13/scrap/two, /obj/effect/decal/cleanable/robot_debris, /obj/item/stack/sheet/ms13/scrap_electronics/two, /obj/item/stack/sheet/ms13/scrap_parts/two, /obj/item/ms13/component/cell)
	ranged = TRUE
	ranged_cooldown = 3 SECONDS
	projectiletype = /obj/projectile/beam/ms13/laser/handy
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/laspistol/las_pistol_2.ogg'

/mob/living/simple_animal/hostile/ms13/robot/handy/gutsy
	name = "Mr. Gutsy"
	desc = "A militarized version of the Handy model. Equiped with a compact plasma rifle, it's a dangerous foe."
	icon_state = "mrhandy_gutsy"
	icon_living = "mrhandy_gutsy"
	health = 165
	maxHealth = 165
	melee_damage_lower = 20
	melee_damage_upper = 20
	armour_penetration = 10
	minimum_distance = 2
	retreat_distance = 3
	loot = list(/obj/item/stack/sheet/ms13/scrap_steel/two, /obj/effect/decal/cleanable/robot_debris, /obj/item/stack/sheet/ms13/scrap_electronics/two, /obj/item/stack/sheet/ms13/scrap_parts/two, /obj/item/ms13/component/plasma_battery, /obj/item/stack/sheet/ms13/circuits)
	ranged = TRUE
	ranged_cooldown = 3 SECONDS
	projectiletype = /obj/projectile/bullet/ms13/plasma/gutsy
	projectilesound = 'mojave/sound/ms13weapons/gunsounds/plasrifle/plasma_3.ogg'
