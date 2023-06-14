////////////////MOJAVE SUN CUSTOM SMIGGLERETTE ROLLING COMPONENT/////////////////

#define isrollable(A) (istype(A, /obj/item/ms13/rolling_paper))

/datum/element/rollable
	element_flags = ELEMENT_BESPOKE
	id_arg_index = 2
	//The created smigglerette post rolling
	var/obj/item/ms13/cigarette/result_rollie_type
	//The type of smigglerette this turns into, eg. rollie, cigarette, cigar
	var/rollie_type_name
	//Amount of time to roll this shit up
	var/rolling_time

/datum/element/rollable/Attach(datum/target, rollie_type_name = "rollie", rolling_time = 10 SECONDS)
	. = ..()
	if(!isatom(target))
		return ELEMENT_INCOMPATIBLE

	src.rollie_type_name = rollie_type_name
	src.rolling_time = rolling_time

	RegisterSignal(target, COMSIG_PARENT_ATTACKBY, .proc/start_filling_papers)
	RegisterSignal(target, COMSIG_ITEM_ATTACK_SELF, .proc/start_rolling_that_shit)
	RegisterSignal(target, COMSIG_ITEM_ATTACK_SELF_SECONDARY, .proc/start_removing_that_shit)
	RegisterSignal(target, list(COMSIG_ITEM_EQUIPPED, COMSIG_STORAGE_ENTERED, COMSIG_ITEM_DROPPED, COMSIG_STORAGE_EXITED), .proc/update_overlays)

/datum/element/rollable/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, list(COMSIG_PARENT_ATTACKBY, COMSIG_ATOM_ATTACK_HAND, COMSIG_ATOM_ATTACK_HAND_SECONDARY, COMSIG_ITEM_EQUIPPED, COMSIG_STORAGE_ENTERED, COMSIG_ITEM_DROPPED, COMSIG_STORAGE_EXITED))

/datum/element/rollable/proc/start_filling_papers(atom/target, obj/item/filling, mob/living/user)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, .proc/fill_papers, target, filling, user)

/datum/element/rollable/proc/fill_papers(atom/target, obj/item/filling, mob/living/user)
	if(!isrollable(target))
		return
	var/obj/item/ms13/rolling_paper/A = target //change if different things are added
	if(istype(filling, /obj/item/ms13/dried))
		if(!A.doobie_filling_1 || !A.doobie_filling_2)
			playsound(user, 'mojave/sound/ms13effects/smokeables/drycrunch.ogg', 100)
			if(do_after(user, 5 SECONDS))
				playsound(user, 'mojave/sound/ms13effects/smokeables/drycrunch.ogg', 100)
				to_chat(user, "<span class='notice'>You crumple up [filling] into [target].</span>")
				if(!user.transferItemToLoc(filling, target))
					return
				if(!A.doobie_filling_1)
					A.doobie_filling_1 = filling
					update_overlays(target)
					if(istype(target, /obj/item/ms13/rolling_paper))
						A.world_state = "rollie_paper_f" //will componentise this once more ciggie rollers are added
						A.update_icon_state()
					return COMPONENT_CANCEL_ATTACK_CHAIN
				if(!A.doobie_filling_2)
					A.doobie_filling_2 = filling
					update_overlays(target)
					if(istype(target, /obj/item/ms13/rolling_paper))
						A.world_state = "rollie_paper_f"
						A.update_icon_state()
					return COMPONENT_CANCEL_ATTACK_CHAIN
		else
			to_chat(user, "<span class='notice'>[target] is fully packed with [A.doobie_filling_1] and [A.doobie_filling_2].</span>")

	else
		to_chat(user, "<span class='notice'>You cant fill [target] with [filling].</span>")
		return NONE

/datum/element/rollable/proc/update_overlays(atom/target)
	if(!isrollable(target))
		return
	var/obj/item/ms13/rolling_paper/A = target
	if((A.item_flags & IN_INVENTORY))
		if(A.doobie_filling_1)
			var/mutable_appearance/doob_1 = mutable_appearance(target.icon, "[A.doobie_filling_1.icon_state]_1", target.layer + 1)
			target.add_overlay(doob_1)
		if(A.doobie_filling_2)
			var/mutable_appearance/doob_2 = mutable_appearance(target.icon, "[A.doobie_filling_2.icon_state]_2", target.layer + 1)
			target.add_overlay(doob_2)

/datum/element/rollable/proc/start_removing_that_shit(atom/target, mob/user, list/modifiers)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, .proc/remove_that_shit, target, user)

/datum/element/rollable/proc/remove_that_shit(atom/target, mob/user)
	if(!isrollable(target))
		return
	var/obj/item/ms13/rolling_paper/A = target
	if(!A.doobie_filling_1 && !A.doobie_filling_2)
		return COMPONENT_CANCEL_ATTACK_CHAIN
	to_chat(user, "<span class='notice'>You begin to remove the fillings from [target].</span>")
	if(do_after(user, 3 SECONDS))
		target.cut_overlays()
		if(A.doobie_filling_1)
			A.doobie_filling_1 = null
		if(A.doobie_filling_2)
			A.doobie_filling_2 = null
		if(istype(target, /obj/item/ms13/rolling_paper))
			A.world_state = initial(A.world_state)
			A.update_icon_state()
		return

/datum/element/rollable/proc/start_rolling_that_shit(atom/target, mob/user)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, .proc/roll_that_shit, target, user)

/datum/element/rollable/proc/roll_that_shit(atom/target, mob/user)
	if(!isrollable(target))
		return
	var/obj/item/ms13/rolling_paper/A = target
	if(!A.doobie_filling_1 || !A.doobie_filling_2)
		to_chat(user, "<span class='notice'>[target] is not fully packed with product.</span>")
		return COMPONENT_CANCEL_ATTACK_CHAIN
	else
		playsound(user, 'mojave/sound/ms13effects/smokeables/cigroll.ogg', 100)
		to_chat(user, "<span class='notice'>You begin to roll up [target] now packed with filling.</span>")
		if(do_after(user, rolling_time))
			var/obj/item/ms13/cigarette/custom/finished_product
			var/obj/item/ms13/dried/D = A.doobie_filling_1
			var/obj/item/ms13/dried/F = A.doobie_filling_2
			playsound(user, 'mojave/sound/ms13effects/smokeables/cigrollend.ogg', 100)
			switch(rollie_type_name) //due to hardbaked initial icon states
				if("rollie")
					finished_product = new /obj/item/ms13/cigarette/custom/rollie(target.loc)
				if("cigarette")
					finished_product = new /obj/item/ms13/cigarette/custom/cig(target.loc)
			switch(D.indentifier)
				if("x")
					switch(F.indentifier)
						if("x")
							finished_product.filling_identifier = "xx"
						if("b")
							finished_product.filling_identifier = "xb"
						if("t")
							finished_product.filling_identifier = "xt"
				if("b")
					switch(F.indentifier)
						if("x")
							finished_product.filling_identifier = "bx"
						if("b")
							finished_product.filling_identifier = "bb"
						if("t")
							finished_product.filling_identifier = "bt"
				if("t")
					switch(F.indentifier)
						if("x")
							finished_product.filling_identifier = "tx"
						if("b")
							finished_product.filling_identifier = "tb"
						if("t")
							finished_product.filling_identifier = "tt"
			qdel(target)
			finished_product.wrap_up()
			user.put_in_active_hand(finished_product)
			return COMPONENT_CANCEL_ATTACK_CHAIN
