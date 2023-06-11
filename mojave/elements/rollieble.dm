////////////////MOJAVE SUN CUSTOM SMIGGLERETTE ROLLING COMPONENT/////////////////

/datum/element/rollable
	element_flags = ELEMENT_BESPOKE
	id_arg_index = 2
	//The created smigglerette post rolling
	var/obj/item/ms13/cigarette/result_rollie_type
	//The type of smigglerette this turns into, eg. rollie, cigarette, cigar
	var/rollie_type_name
	//Amount of time to roll this shit up
	var/rolling_time
	//The type of thing the rollie is filled with first
	var/obj/doobie_filling_1
	//The type of thing the rollie is filled with second, final filling
	var/obj/doobie_filling_2

/datum/element/rollable/Attach(datum/target, rollie_type_name = "rollie", rolling_time = 10 SECONDS)
	. = ..()
	if(!isatom(target))
		return ELEMENT_INCOMPATIBLE

	src.rollie_type_name = rollie_type_name
	src.rolling_time = rolling_time
	src.doobie_filling_1 = doobie_filling_1
	src.doobie_filling_2 = doobie_filling_2

	RegisterSignal(target, COMSIG_PARENT_ATTACKBY, .proc/start_filling_papers)
	RegisterSignal(target, COMSIG_ITEM_ATTACK_SELF, .proc/start_rolling_that_shit)
	RegisterSignal(target, COMSIG_ITEM_ATTACK_SELF_SECONDARY, .proc/start_removing_that_shit)

/datum/element/rollable/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, list(COMSIG_PARENT_ATTACKBY, COMSIG_ATOM_ATTACK_HAND, COMSIG_ATOM_ATTACK_HAND_SECONDARY))

/datum/element/rollable/proc/start_filling_papers(atom/target, mob/living/user, obj/item/filling)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, .proc/fill_papers, target, user, filling)

/datum/element/rollable/proc/fill_papers(atom/target, mob/living/user, obj/item/filling)
	if(istype(filling, /obj/item/ms13/dried))
		if(do_after(user, 5 SECONDS) && !doobie_filling_1 && !doobie_filling_2)
			to_chat(user, "<span class='notice'>You crumple up the [filling] into the [src].</span>")
			if(!user.transferItemToLoc(filling, src))
				return COMPONENT_CANCEL_ATTACK_CHAIN
		if(!doobie_filling_1)
			doobie_filling_1 = filling
			var/mutable_appearance/doob_1 = mutable_appearance(target.icon, "[doobie_filling_1.name]_1", target.layer + 1)
			target.add_overlay(doob_1)
			if(istype(src, /obj/item/ms13/rolling_paper))
				var/obj/item/ms13/rolling_paper/A = target
				A.world_state = "rollie_paper_f" //will componentise this once more ciggie rollers are added
			return COMPONENT_CANCEL_ATTACK_CHAIN
		if(!doobie_filling_2)
			doobie_filling_2 = filling
			var/mutable_appearance/doob_2 = mutable_appearance(target.icon, "[doobie_filling_2.name]_1", target.layer + 1)
			target.add_overlay(doob_2)
			if(istype(src, /obj/item/ms13/rolling_paper))
				var/obj/item/ms13/rolling_paper/A = target
				A.world_state = "rollie_paper_f"
			return COMPONENT_CANCEL_ATTACK_CHAIN
		else
			to_chat(user, "<span class='notice'>The [src] is fully packed with [doobie_filling_1] and [doobie_filling_2].</span>")

	else
		to_chat(user, "<span class='notice'>You cant fill the [src] with [filling].</span>")
		return NONE

/datum/element/rollable/proc/start_removing_that_shit(atom/target, mob/user, list/modifiers)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, .proc/remove_that_shit, target, user)

/datum/element/rollable/proc/remove_that_shit(atom/target, mob/user)
	if(!doobie_filling_1 && !doobie_filling_2)
		return COMPONENT_CANCEL_ATTACK_CHAIN
	to_chat(user, "<span class='notice'>You begin to remove the fillings from the [src].</span>")
	if(do_after(user, 3 SECONDS))
		target.cut_overlays()
		if(doobie_filling_1)
			doobie_filling_1 = null
		if(doobie_filling_2)
			doobie_filling_2 = null
		return

/datum/element/rollable/proc/start_rolling_that_shit(atom/target, mob/user)
	SIGNAL_HANDLER
	INVOKE_ASYNC(src, .proc/roll_that_shit, target, user)

/datum/element/rollable/proc/roll_that_shit(atom/target, mob/user)
	if(!doobie_filling_1 || !doobie_filling_2)
		to_chat(user, "<span class='notice'>The [src] is not fully packed with product.</span>")
		return COMPONENT_CANCEL_ATTACK_CHAIN
	else
		to_chat(user, "<span class='notice'>You begin to roll up the packed [src].</span>")
		if(do_after(user, rolling_time))
			var/obj/item/ms13/cigarette/custom/finished_product
			var/obj/item/ms13/dried/D = doobie_filling_1
			var/obj/item/ms13/dried/F = doobie_filling_2
			finished_product = new /obj/item/ms13/cigarette/custom(src)
			finished_product.wrap_type = rollie_type_name
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
			qdel(src)
			return COMPONENT_CANCEL_ATTACK_CHAIN
