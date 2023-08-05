//MOJAVE SUN LOCK OBJECTS AND FUNCTION FILE//
/obj/item/ms13/lock
	name = "base ms13 lock"
	desc = "Lock this guy up."
	icon = 'mojave/icons/objects/tools/locks_world.dmi'
	icon_state = "brass"
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	inhand_icon_state = "brass_lock"
	worn_icon = 'mojave/icons/mob/worn_melee.dmi'
	worn_icon_state = "empty_placeholder"
	w_class = WEIGHT_CLASS_SMALL
	ms13_flags_1 = LOCKING_ITEM
	grid_width = 32
	grid_height = 32
	drop_sound = 'mojave/sound/ms13effects/lockdrop.ogg'
	pickup_sound = 'mojave/sound/ms13effects/lockgrab.ogg'
	//if the lock is item is open
	var/lock_open = FALSE
	//if the lock object is locked
	var/item_lock_locked = FALSE
	//tells the element what difficulty the objs picking is at (1 Master, 5 Expert, 10 Standard, 17 Novice, 20+ Beginner)
	var/lock_difficulty = 10
	//Custom pin shapes for corresponding with the identical key type bitts
	//Pins seperated into sloppy seperates so players can edit them and interaction with locks
	var/pin_amount = 6
	var/pin_1
	var/pin_2
	var/pin_3
	var/pin_4
	var/pin_5
	var/pin_6
	//is the lock pre_locked on spawn - randomise on init
	var/pre_locked = TRUE
	//if the lock can be lockpicked after being placed
	var/can_be_lockpicked = TRUE

/obj/item/ms13/lock/Initialize()
	. = ..()
	if(pre_locked)
		item_lock_locked = TRUE
	if(can_be_lockpicked & pre_locked)
		AddComponent(/datum/component/lockpickable, difficulty = lock_difficulty)
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/tools/locks_inventory.dmi')
	generate_pin_order()

/obj/item/ms13/lock/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Click in offhand to take one out. Use to open/close.</span>"

/obj/item/ms13/lock/proc/generate_pin_order()
	var/static/list/pin_lengths = list("A","B","C","D","E","F")
	if(pin_amount == 6)
		pin_1 = pick(pin_lengths)
		pin_2 = pick(pin_lengths)
		pin_3 = pick(pin_lengths)
		pin_4 = pick(pin_lengths)
		pin_5 = pick(pin_lengths)
		pin_6 = pick(pin_lengths)
	if(pin_amount == 4) // change to some sort of for thing in the future idc rn
		pin_1 = pick(pin_lengths)
		pin_2 = pick(pin_lengths)
		pin_3 = pick(pin_lengths)
		pin_4 = pick(pin_lengths)

/obj/item/ms13/lock/attack_self(mob/user, list/modifiers)
	. = ..()
	if(item_lock_locked)
		to_chat(user, span_notice("The [name] is locked."))
		playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 50, TRUE)
		return
	else
		open_lock_item(user)

/obj/item/ms13/lock/attack_self_secondary(mob/user, modifiers)
	. = ..()
	if(item_lock_locked)
		return
	if(!lock_open && do_after(user, 0.6 SECONDS, src))
		icon_state = initial(icon_state)
		lock_open = FALSE
		item_lock_locked = TRUE
		if(can_be_lockpicked & pre_locked)
			AddComponent(/datum/component/lockpickable, difficulty = lock_difficulty)
		to_chat(user, span_notice("You clasp the [name] shut."))
		playsound(src, 'mojave/sound/ms13effects/lock_clasp.ogg', 50, TRUE)
		return

/obj/item/ms13/lock/proc/open_lock_item(mob/user)
	if(!lock_open && !item_lock_locked && do_after(user, 0.6 SECONDS, src))
		icon_state = "[initial(icon_state)]_open"
		lock_open = TRUE
		item_lock_locked = FALSE
		playsound(src, 'mojave/sound/ms13effects/lock_open.ogg', 30, TRUE)
		return
	if(lock_open && do_after(user, 0.6 SECONDS, src))
		icon_state = initial(icon_state)
		lock_open = FALSE
		to_chat(user, span_notice("You swing the [name] closed."))
		playsound(src, 'mojave/sound/ms13effects/lock_open.ogg', 30, TRUE)
		return

/obj/item/ms13/lock/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(!ismob(user))
		return
	if(!user.is_holding(src))
		return . = ..()
	if(!loc == user)
		return . = ..()
	if(I.ms13_flags_1 & KEY_ITEM)
		var/obj/item/ms13/key/key = I
		//alignment checks
		if(lock_open)
			to_chat(user, span_notice("The [name] is open, close it first."))
			return
		if(!item_lock_locked)
			to_chat(user, span_notice("The [name] is not shut, clasp it closed to lock."))
			return
		if(pin_amount == 6)
			if(key.bitt_1 != pin_1)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_2 != pin_2)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_3 != pin_3)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_4 != pin_4)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_5 != pin_5)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_6 != pin_6)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
		if(pin_amount == 4)
			if(key.bitt_1 != pin_1)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_2 != pin_2)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_3 != pin_3)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_4 != pin_4)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
		if(item_lock_locked)
			var/datum/component/lockpickable/lockpickable = GetComponent(/datum/component/lockpickable)
			qdel(lockpickable)
			playsound(src, 'mojave/sound/ms13effects/key_unlock.ogg', 50, TRUE)
			to_chat(user, span_notice("You unlock the [name]. It pops open."))
			item_lock_locked = FALSE
			return

/obj/item/ms13/lock/test

/obj/item/ms13/lock/test/generate_pin_order()
	pin_1 = "A"
	pin_2 = "A"
	pin_3 = "A"
	pin_4 = "A"
	pin_5 = "A"
	pin_6 = "A"
