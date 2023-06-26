//MOJAVE SUN LOCK OBJECTS AND FUNCTION FILE//
/obj/item/ms13/lock
	name = "base ms13 lock"
	desc = "Lock this guy up."
	icon = 'mojave/icons/objects/tools/locks_world.dmi'
	icon_state = "brass"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	w_class = WEIGHT_CLASS_SMALL
	item_flags = LOCKING_ITEM
	grid_width = 32
	grid_height = 32
	//if the lock is item is open
	var/lock_open = FALSE
	//if the lock object is locked
	var/item_lock_locked = FALSE
	//tells the element what difficulty the objs picking is at (1 Master, 5 Expert, 10 Standard, 17 Novice, 20+ Beginner)
	var/lock_difficulty = 10
	//Custom pin shapes for corresponding with the identical key type bitts
	//Pins seperated into sloppy seperates so players can edit them and interaction with locks
	var/pin_1
	var/pin_2
	var/pin_3
	var/pin_4
	var/pin_5
	var/pin_6

/obj/item/ms13/lock/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/locks_inventory.dmi')
	generate_pin_order()

/obj/item/ms13/lock/proc/generate_pin_order()
	var/static/list/pin_lengths = list("A","B","C","D","E","F")
	pin_1 = pick(pin_lengths)
	pin_2 = pick(pin_lengths)
	pin_3 = pick(pin_lengths)
	pin_4 = pick(pin_lengths)
	pin_5 = pick(pin_lengths)
	pin_6 = pick(pin_lengths)

/obj/item/ms13/lock/attack_self(mob/user, list/modifiers)
	. = ..()
	open_lock_item(user)

/obj/item/ms13/lock/proc/open_lock_item(mob/user)
	if(!lock_open && !item_lock_locked && do_after(user, 0.6 SECONDS, src))
		icon_state = "[initial(icon_state)]_open"
		lock_open = TRUE
		item_lock_locked = FALSE //fixes bugs where its open but locked somehow
		playsound(src, 'mojave/sound/ms13effects/lock_open.ogg', 20, TRUE)
		return
	if(lock_open && do_after(user, 0.6 SECONDS, src))
		icon_state = initial(icon_state)
		lock_open = FALSE
		playsound(src, 'mojave/sound/ms13effects/lock_open.ogg', 20, TRUE)
		return

/obj/item/ms13/lock/test

/obj/item/ms13/lock/test/generate_pin_order()
	pin_1 = "A"
	pin_2 = "A"
	pin_3 = "A"
	pin_4 = "A"
	pin_5 = "A"
	pin_6 = "A"
