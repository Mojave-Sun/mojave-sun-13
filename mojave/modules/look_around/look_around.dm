
/mob/living
	var/look_incooldown = FALSE
	var/look_cooldown = 100
	var/list/obj/objs_in_look = list()
	var/list/obj/objs_no_look = list()

/obj
	var/hidden_for_look = FALSE
	var/range_place = 0
	var/unknown_state = FALSE
	var/reduce_outgoing = 0

/image
	var/obj/reference = null

/mob/living/proc/look_around()
	if(look_incooldown || !client || stat == DEAD)
		return

	look_incooldown = TRUE
	var/atom/Uloc = loc
	var/list/whining_in_view = list()
	for(var/obj/A in view())
		if(!A.hidden_for_look)
			continue
		whining_in_view += A

	var/sleep_ = look_cooldown / (whining_in_view.len ? whining_in_view.len : 1)
	var/sleep_timer = min(1, sleep_)
	var/last_spotted = world.time

	var/datum/progressbar/progbar = new(src, look_cooldown, src)

	var/start_time = world.time + 1
	var/list/spotted_turfs = list()
	while(world.time < start_time + look_cooldown)
		progbar.update(world.time - start_time)

		if(stat || loc != Uloc)
			break

		if(whining_in_view.len)
			if(world.time >= last_spotted + sleep_)
				last_spotted = world.time
				var/obj/A = pick(whining_in_view)
				var/blowout_effect = 0
				var/roll = 0
				if(!(A in objs_in_look) && !(A in objs_no_look))
					roll = rolld(dice6(3), stats.outgoing - A.reduce_outgoing + blowout_effect, FALSE)
					if(roll)
						objs_in_look[A] = roll - 1
						spawn(6000)
							objs_in_look.Remove(A)
					else
						objs_no_look[A] = roll
						spawn(6000)
							objs_no_look.Remove(A)
				if(A in objs_in_look)
					for(var/image/AR in client.images)
						if(AR.reference == A)
							client.images.Remove(AR)
							qdel(AR)
					roll = objs_in_look[A]
					var/image/I
					if(!A.range_place)
						var/turf/open/T = get_turf(A)
						if(!(T in spotted_turfs))
							var/unknown_icon = FALSE
							if(roll < 2 && A.unknown_state)
								unknown_icon = TRUE
							if(unknown_icon)
								I  = image(A.icon, T, "unknown", layer = 10)
							else
								I = image(A.icon, T, initial(A.icon_state), 10)
							I.reference = A
							I.name = "Danger"
							spotted_turfs.Add(T)
							client.images.Add(I)
							animate(I, alpha = 0, 600)
							spawn(600)
								if(I)
									client.images.Remove(I)
									qdel(I)
					else
						for(var/turf/open/T in range(A.range_place, A))
							if(!(T in spotted_turfs))
								var/unknown_icon = FALSE
								if(roll < 2 && A.unknown_state)
									unknown_icon = TRUE
								if(unknown_icon)
									I  = image(A.icon, T, "unknown", layer = 10)
								else
									I = image(A.icon, T, initial(A.icon_state), 10)
								I.reference = A
								I.name = "Danger"
								spotted_turfs.Add(T)
								client.images.Add(I)
								animate(I, alpha = 0, 600)
								spawn(600)
									if(I)
										client.images.Remove(I)
										qdel(I)
				whining_in_view.Remove(A)
		sleep(sleep_timer)

	qdel(progbar)

	look_incooldown = FALSE

/mob/living/verb/look_everything()
	set category = "IC"
	set name = "Look around"
	look_around()
