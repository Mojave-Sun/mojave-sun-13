
/obj/effect/mine/ms13/explosive
	name = "Frag"
	icon_state = "frag_primed"
	hidden = TRUE
	var/inactive_state = "frag_armed"
	/// The devastation range of the resulting explosion.
	var/range_devastation = 0
	/// The heavy impact range of the resulting explosion.
	var/range_heavy = 1
	/// The light impact range of the resulting explosion.
	var/range_light = 2
	/// The flame range of the resulting explosion.
	var/range_flame = 0
	/// The flash range of the resulting explosion.
	var/range_flash = 3

	arm_delay = 5 SECONDS

/obj/effect/mine/ms13/explosive/Initialize(mapload)
	if(arm_delay && armed)
		armed = FALSE
		addtimer(CALLBACK(src, .proc/now_armed), arm_delay)
	. = ..()

/obj/effect/mine/ms13/explosive/examine(mob/user)
	. = ..()
	if(!armed)
		. += "\t<span class='information'>It appears to be inactive...</span>"

/// The effect of the mine
/obj/effect/mine/ms13/explosive/mineEffect(mob/victim)
	explosion(src, range_devastation, range_heavy, range_light, range_flame, range_flash)

/// If the landmine was previously inactive, this beeps and displays a message marking it active
/obj/effect/mine/ms13/explosive/now_armed()
	armed = TRUE
	playsound(src, 'mojave/sound/ms13machines/frag_mine_arm.ogg', 40, FALSE, -2)
	visible_message(span_danger("\The [src] beeps softly, indicating it is now active."), vision_distance = COMBAT_MESSAGE_RANGE)

/obj/effect/mine/ms13/explosive/on_entered(datum/source, atom/movable/AM)
	. = ..()

/obj/effect/mine/ms13/explosive/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir)
	. = ..()

/// When something sets off a mine
/obj/effect/mine/ms13/explosive/triggermine(atom/movable/triggerer)
	if(iseffect(triggerer))
		return
	if(triggered) //too busy detonating to detonate again
		return
	if(triggerer)
		visible_message(span_danger("[triggerer] sets off [icon2html(src, viewers(src))] [src]!"))
	else
		visible_message(span_danger("[icon2html(src, viewers(src))] [src] detonates!"))

	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	if(ismob(triggerer))
		mineEffect(triggerer)
	triggered = TRUE
	SEND_SIGNAL(src, COMSIG_MINE_TRIGGERED, triggerer)
	qdel(src)

/obj/effect/spawner/random/ms13/explosive_mines
	name = "Explosive mines"
	spawn_loot_chance = 50
	loot = list(
		/obj/effect/mine/ms13/explosive
	)
