/obj/machinery/ms13/plant_machinery
	name = "water treatment machinery"
	desc = "The label on this says something about fresh water- But what side do you take a sip from?."
	icon = 'mojave/icons/structure/64x64_machinery.dmi'
	icon_state = "watertreatment"
	max_integrity = 20000
	anchored = TRUE
	density = TRUE
	pixel_x = -16
	flags_1 = INDESTRUCTIBLE
	var/internal_volume = 3000
	var/regen_rate = 3

/obj/machinery/ms13/plant_machinery/Initialize()
	create_reagents(internal_volume, DRAINABLE | AMOUNT_VISIBLE)
	reagents.add_reagent(/datum/reagent/consumable/ms13/water, 1500)
	. = ..()

/obj/machinery/ms13/plant_machinery/process(delta_time)
	if(src.reagents.total_volume == internal_volume)
		return
	else
		reagents.add_reagent(/datum/reagent/consumable/ms13/water, regen_rate)

/obj/machinery/ms13/plant_machinery/attackby(obj/item/W, mob/user)
	if(W.is_refillable())
		var/obj/item/reagent_containers/I = W
		reagents.trans_to(I, I.reagents.maximum_volume, transfered_by = user)
		user.visible_message(span_notice("[user] refills [user.p_their()] [W.name]."), span_notice("You refill [W]."))
		return TRUE
	else
		return ..()
	return

/obj/machinery/ms13/plant_machinery/broken
	desc = "The label on this says something about fresh water- But what side do you take a sip from? It appears broken down, missing crucial parts."
	icon_state = "watertreatment_broken"

/obj/structure/ms13/tank/pipe/test
	name = "Functional piped storage tank"
	desc = "A large chemical storage tank with pipes running from it. They seem to be attached."
	icon_state = "largetank_pipe"
	var/tank_capacity = 1000
	var/list/linked_items = list()

/obj/structure/ms13/tank/pipe/test/Initialize()
	create_reagents(tank_capacity, AMOUNT_VISIBLE)
	reagents.add_reagent(/datum/reagent/consumable/ms13/water, 200)
	. = ..()

/obj/structure/ms13/tank/pipe/test/wrench_act_secondary(mob/living/user, obj/item/wrench/ms13/W)
	if(W.buffer == null)
		W.buffer = src
		to_chat(user, span_info("You prepare to link the [W.buffer] to something."))
	if(W.buffer == /obj/structure/sink/ms13/test)
		to_chat(user, span_info("You don't remember what you were going to link to the [src]"))

/obj/structure/ms13/tank/pipe/test/proc/process_request(request)
	if(request)
		if(request >= reagents.total_volume) //first come first serve
			transfer_to(src, request)
//		if(request <= reagents.total_volume)


/obj/structure/ms13/tank/pipe/test/proc/transfer_to(obj/structure/sink/ms13/test/target,amount)
	if(target && target.reagents)
		reagents.trans_to(target, amount, round_robin = TRUE)

/obj/structure/sink/ms13/test
	name = "sink"
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "sink"
	desc = "An old sink, typically dispensing clean water. Hard to really tell if it's the case anymore, though."
	dispensedreagent = /datum/reagent/consumable/ms13/water/unfiltered
	buildstacktype = /obj/item/stack/sheet/ms13/ceramic
	has_water_reclaimer = FALSE
	var/obj/structure/ms13/tank/pipe/test/linked_tank

/obj/structure/sink/ms13/attackby(obj/item/O, mob/living/user, params)
	if(busy)
		to_chat(user, span_warning("Someone's already washing here!"))
		return

	if(istype(O, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/RG = O
		if(reagents.total_volume <= 0)
			to_chat(user, span_notice("\The [src] is dry."))
			return FALSE
		if(RG.is_refillable())
			if(!RG.reagents.holder_full())
				reagents.trans_to(RG, RG.amount_per_transfer_from_this, transfered_by = user)
				begin_reclamation()
				to_chat(user, span_notice("You fill [RG] from [src]."))
				return TRUE
			to_chat(user, span_notice("\The [RG] is full."))
			return FALSE

	if(istype(O, /obj/item/mop)) //make this smack the player in the face, don't wet the mop in the sink idiot
		if(reagents.total_volume <= 0) 
			to_chat(user, span_notice("\The [src] is dry."))
			return FALSE
		reagents.trans_to(O, 5, transfered_by = user)
		begin_reclamation()
		to_chat(user, span_notice("You wet [O] in [src]."))
		playsound(loc, 'sound/effects/slosh.ogg', 25, TRUE)
		return

/obj/structure/sink/ms13/test/process()
	if(reagents.total_volume < reagents.maximum_volume)
		if(linked_tank)
			var/request = reagents.maximum_volume - reagents.total_volume
			linked_tank.process_request(request)

/obj/structure/sink/ms13/test/wrench_act_secondary(mob/living/user, obj/item/wrench/ms13/W)
	if(W.buffer == null)
		to_chat(user, span_info("You need to use the wrench on a water tank first"))
	if(W.buffer == /obj/structure/ms13/tank/pipe/test)
		linked_tank = W.buffer
		link_items(W.buffer, src)
		to_chat(user, span_info("You link the [W.buffer] to the [src]"))
		//link_plumbing(linked_tank)

/obj/structure/sink/ms13/test/proc/link_items(tank,sink)
	tank.linked_items.Add(sink)
