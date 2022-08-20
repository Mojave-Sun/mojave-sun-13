


// Storage-Only objects that allow you to socket certain items
/obj/item/socket
	name = "Socket"
	desc = "A socket, used to socket items."
	var/obj/item/socket_type = /obj/item/powersink // the type of item that fits this socket
	var/obj/item/socketed = null

/obj/item/socket/examine(mob/user)
	. = ..()
	if(socketed)
		. += {"It has a [socketed] inserted.\n
		[span_info("You can use a <b>screwdriver</b> to remove [socketed].")]"}
	else
		. += span_info("It looks like it fits a <b>[socket_type]</b>.")

/obj/item/socket/attackby(obj/item/attacking_item, mob/user, params)
	if(istype(attacking_item, socket_type))
		if(socketed)
			balloon_alert(user, "The [src] already contains a [socketed].")
		else
			socket(attacking_item, user)
	else
		balloon_alert(user, "The [attacking_item] won't fit in the [src].")
	return TRUE

/obj/item/socket/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	if(!socketed)
		return
	unsocket(user)

/obj/item/socket/proc/socket(obj/item/attacking_item, mob/user)
	balloon_alert(user, "You insert the [attacking_item] into the [src].")
	socketed = attacking_item
	socketed.forceMove(src)
	update_appearance()

/obj/item/socket/proc/unsocket(mob/user)
	user.put_in_hands(socketed)
	socketed.add_fingerprint(user)
	sockted = null
	update_appearance()

