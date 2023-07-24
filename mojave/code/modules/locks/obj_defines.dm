//MOJAVE MODULAR BASE OBJ TWEAKS FILE//

//all these changes are for locks interacting ON structures, not the locks themselves
/obj
	//check if object is being picked if can be picked
	var/being_picked = FALSE
	//check if lock can be picked
	var/can_be_picked = TRUE
	//check if obj has lock and can be picked
	var/lock_locked = FALSE //essentially - "has lock"
	//for locks built into the object, that cant be taken off, pre-spawn etc.
	var/built_in_lock = FALSE
	var/built_in_lock_type = /obj/item/ms13/lock // replace with custom faction locks etc. which will be randomised on init
	//moves the lock to the obj so it can be taken off etc.
	var/obj/item/ms13/lock/lock

//for storage items that open when lockpicked
/obj/proc/unlock_storage()
	for(var/datum/component/storage/storage as anything in src.GetComponents(/datum/component/storage))
		storage.locked = FALSE //unlocks the storage
	return TRUE

/obj/proc/update_lock(pre_spawn)
	if(pre_spawn)
		built_in_lock = TRUE
		lock = new built_in_lock_type(src)
		can_be_picked = TRUE
		lock.item_lock_locked = TRUE
		lock.lock_open = FALSE
		lock_locked = TRUE
		lock.moveToNullspace()
		for(var/datum/component/storage/storage as anything in GetComponents(/datum/component/storage))
			storage.locked = TRUE //locks
		update_appearance()
		return

//for denying access/interaction with general locked items
/obj/attack_hand(mob/user, list/modifiers)
	if(.)
		return
	if(ms13_flags_1 & LOCKABLE_1 && lock_locked)
		if(lock && lock.item_lock_locked) //for manually locked things
			to_chat(user, span_warning("The [name] is locked."))
			playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 50, TRUE)
			return
		if(!lock) //for pre-spawn locked things
			to_chat(user, span_warning("The [name] is locked."))
			playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 50, TRUE)
			return
	. = ..()

//for item interaction overrides on all general objects for placing locked items
/obj/attackby(obj/item/I, mob/living/user, params) //good lordy this is some bad code, didnt know much back in 2022 and I can confirm this is levels of slopitude that I didnt know possible from me, but hell it works
	//key interactions
	if(I.ms13_flags_1 & KEY_ITEM || LOCKING_ITEM && ms13_flags_1 & LOCKABLE_1) //lil more soul for yah
		if(I.ms13_flags_1 & LOCKING_ITEM && lock)
			if(I == src)
				return //don't do an animation if attacking self
			var/pixel_x_diff = 0
			var/pixel_y_diff = 0

			var/direction = get_dir(user, src)
			if(direction & NORTH)
				pixel_y_diff = 8
			else if(direction & SOUTH)
				pixel_y_diff = -8

			if(direction & EAST)
				pixel_x_diff = 8
			else if(direction & WEST)
				pixel_x_diff = -8
			animate(user, pixel_x = user.pixel_x + pixel_x_diff, pixel_y = user.pixel_y + pixel_y_diff, time = 1, easing=BACK_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
			animate(user, pixel_x = user.pixel_x - pixel_x_diff, pixel_y = user.pixel_y - pixel_y_diff, time = 2, easing=SINE_EASING, flags = ANIMATION_PARALLEL)
		if(I.ms13_flags_1 & KEY_ITEM && lock)
			var/obj/item/ms13/key/key = I
			//alignment checks
			if(key.bitt_1 != lock.pin_1)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_2 != lock.pin_2)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_3 != lock.pin_3)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_4 != lock.pin_4)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_5 != lock.pin_5)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(key.bitt_6 != lock.pin_6)
				playsound(src, 'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', 50, TRUE)
				to_chat(user, span_notice("The key dosen't turn in [name]."))
				return
			if(!lock.item_lock_locked)
				playsound(src, 'mojave/sound/ms13effects/key_lock.ogg', 50, TRUE)
				to_chat(user, span_notice("You lock the [name]."))
				lock.item_lock_locked = TRUE
				return
			if(lock.item_lock_locked)
				playsound(src, 'mojave/sound/ms13effects/key_unlock.ogg', 50, TRUE)
				to_chat(user, span_notice("You unlock the [name]."))
				lock.item_lock_locked = FALSE
				return
			return
	//lock interactions
	if(I.ms13_flags_1 & LOCKING_ITEM && ms13_flags_1 & LOCKABLE_1)
		var/obj/item/ms13/lock/potential_lock = I
		if(lock_locked || built_in_lock)
			to_chat(user, span_warning("The [name] already has a lock."))
			return
		if(potential_lock.item_lock_locked)
			to_chat(user, span_notice("The [name] is locked."))
			playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 20, TRUE)
			return
		if(!potential_lock.lock_open)
			to_chat(user, span_warning("The [lock.name] is shut, open it!"))
			return
		if(istype(src, /obj/structure/closet))
			var/obj/structure/closet/thing = src
			if(thing.opened)
				to_chat(user, span_warning("The [name] is open, close it first."))
				return
		if(istype(src, /obj/structure/ms13/celldoor))
			var/obj/structure/ms13/celldoor/thing = src
			if(thing.door_opened)
				to_chat(user, span_warning("The [name] is open, close it first."))
				return
		if(istype(src, /obj/machinery/door/unpowered/ms13))
			var/obj/machinery/door/unpowered/ms13/thing = src
			if(thing.open)
				to_chat(user, span_warning("The [name] is open, close it first."))
				return
		if(istype(src, /obj/machinery/door/airlock/ms13))
			var/obj/machinery/door/airlock/ms13/thing = src
			if(thing.open)
				to_chat(user, span_warning("The [name] is open, close it first."))
				return
		if(!potential_lock.item_lock_locked && potential_lock.lock_open)
			if(!do_after(user, 0.5 SECONDS, src))
				return
			if(!user.transferItemToLoc(potential_lock, src))
				return
			lock = potential_lock
			can_be_picked = TRUE
			lock.item_lock_locked = TRUE
			lock.lock_open = FALSE
			lock_locked = TRUE
			lock.moveToNullspace()
			AddComponent(/datum/component/lockpickable, difficulty = lock.lock_difficulty)
			for(var/datum/component/storage/storage as anything in GetComponents(/datum/component/storage))
				storage.locked = TRUE //locks
			playsound(src, 'mojave/sound/ms13effects/lock_close.ogg', 50, TRUE)
			to_chat(user, span_notice("You attach the [lock.name] to the [name] and clasp it shut."))
			user.visible_message("<span class='notice'[user.name] attaches the [lock.name] to the [name].")
			update_appearance()
			return
		return
	. = ..()
///
//for taking the lock off of objects if its open
/obj/attack_hand_secondary(mob/user, list/modifiers)
	if(lock && !built_in_lock)
		if(!lock.item_lock_locked && do_after(user, 0.6 SECONDS, src))
			var/datum/component/lockpickable/lockpickable = GetComponent(/datum/component/lockpickable)
			qdel(lockpickable)
			lock_locked = FALSE
			lock.lock_open = TRUE
			can_be_picked = FALSE
			if(istype(src, /obj/machinery/door/unpowered) && lock_locked)
				var/obj/machinery/door/unpowered/thing = src
				thing.locked = FALSE
			if(istype(src, /obj/structure/ms13/celldoor) && lock_locked)
				var/obj/structure/ms13/celldoor/thing = src
				thing.locked = FALSE
			if(istype(src, /obj/machinery/door/unpowered) && lock_locked)
				var/obj/structure/closet/thing = src
				thing.locked = FALSE
			//the rest of the normal shit
			to_chat(user, span_notice("You take the [lock.name] off the [name]."))
			playsound(src, 'mojave/sound/ms13effects/lock_open.ogg', 50, TRUE)
			update_appearance()
			if(!user.put_in_hands(lock))
				return
			lock = null
			return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN
	. = ..()

//Lock on examine updates, for checking the lock states
/obj/examine(mob/user)
	. = ..()
	if(lock)
		if(!lock.item_lock_locked)
			. += "<u>The [lock.name] is unlocked and able to be removed or re-locked.</u>."
		if(lock.item_lock_locked)
			. += "<u>The [lock.name] is closed and clasped shut.</u>."
		. += "<u>It seems fairly new compared to the things around it.</u>."

//snowflake code for shart closets
/obj/structure/closet/can_open(mob/living/user, force = FALSE)
	if(lock_locked && lock.item_lock_locked)
		playsound(src, 'mojave/sound/ms13effects/door_locked.ogg', 50, TRUE) //MOJAVE SUN EDIT - Locks
		return
	. = ..()

//snowflake code for safes
/obj/structure/safe/ms13/ui_act(action, params)
	if(lock_locked && lock)
		if(!lock.item_lock_locked)
			locked = FALSE
		if(lock.item_lock_locked)
			locked = TRUE
	. = ..()
