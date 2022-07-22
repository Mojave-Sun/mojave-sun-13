/obj/structure/ms13/departure
	name = "area departure"
	desc = "You can almost make out something in the distance. But what?"
	icon = 'mojave/icons/structure/departure.dmi'
	icon_state = "location_exit"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	resistance_flags = INDESTRUCTIBLE | FIRE_PROOF | ACID_PROOF

/obj/structure/ms13/departure/MouseDrop_T(atom/dropping, mob/user)
	. = ..()
	if(dropping != user)
		return
	if(!isliving(user) || user.incapacitated())
		return //No ghosts or incapacitated folk allowed to do this.
	var/mob/living/departing_mob = dropping
	if(alert("Are you sure you want to depart the area for good? Doing this will despawn your character for good and free up a slot. If you're an important role, you should probably let people know of your planned departure!", "Departing the Wasteland", "Confirm", "Cancel") != "Confirm")
		return
	if(QDELETED(departing_mob) || departing_mob.incapacitated() || !isliving(departing_mob) || get_dist(src, dropping) > 2)
		return //Things have changed since the alert happened.
	var/dat = "[key_name(user)] has despawned themselves, job [departing_mob.job], at [AREACOORD(src)]. Contents despawned along:"
	var/list/stuff = list()
	for(var/thing in departing_mob.get_all_contents())
		if(isobj(thing))
			stuff += "[thing]"
	dat = "[dat] [stuff.Join(", ")]."
	message_admins(dat)
	log_admin(dat)
	departing_mob.visible_message("<span class='notice'>[departing_mob] walks off into the distance, departing this area.</span>")
	qdel(departing_mob)
