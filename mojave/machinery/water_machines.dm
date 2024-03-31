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

/obj/machinery/ms13/plant_machinery/broken
	desc = "The label on this says something about fresh water- But what side do you take a sip from? It appears broken down, missing crucial parts."
	icon_state = "watertreatment_broken"

/obj/machinery/ms13/plant_machinery/plumbed ///Should only be one of these per map!!!
	var/internal_volume = 3000
	var/regen_rate = 10

/obj/machinery/ms13/plant_machinery/plumbed/Initialize()
	create_reagents(internal_volume, AMOUNT_VISIBLE)
	reagents.add_reagent(/datum/reagent/consumable/ms13/water, 1500)
	. = ..()

/obj/machinery/ms13/plant_machinery/plumbed/process(delta_time)
	if(src.reagents.total_volume == internal_volume)
		return
	else
		reagents.add_reagent(/datum/reagent/consumable/ms13/water, regen_rate)

/obj/machinery/ms13/plant_machinery/plumbed/attackby(obj/item/W, mob/user)
	if(W.is_refillable())
		var/obj/item/reagent_containers/I = W
		reagents.trans_to(I, I.reagents.maximum_volume, transfered_by = user)
		user.visible_message(span_notice("[user] refills [user.p_their()] [W.name]."), span_notice("You refill [W]."))
		return TRUE
	else
		return ..()
	return

//giving water

/obj/machinery/ms13/plant_machinery/plumbed/proc/process_request(request, requesting_item)
	if(request)
		if(request <= reagents.total_volume) //first come first serve
			transfer_to(requesting_item, request)
			to_chat(world, span_info("request processed"))

/obj/machinery/ms13/plant_machinery/plumbed/proc/transfer_to(obj/structure/ms13/tank/pipe/plumbed/target,amount)
	if(target && target.reagents)
		reagents.trans_to(target, amount)
		to_chat(world, span_info("reagents processed"))

//////////////////////////////////////////////////////////////////////////

/obj/structure/ms13/tank/pipe/plumbed
	name = "Functional piped storage tank"
	desc = "A large chemical storage tank with pipes running from it. They seem to be attached."
	icon_state = "largetank_pipe"
	var/tank_capacity = 1000
	var/obj/machinery/ms13/plant_machinery/plumbed/plant_machinery = null
	var/autolinking_purifier = FALSE ///will we automatically connect to the water purifier on the map?

/obj/structure/ms13/tank/pipe/plumbed/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	create_reagents(tank_capacity, AMOUNT_VISIBLE)
	reagents.add_reagent(/datum/reagent/consumable/ms13/water, 200)
	if(autolinking_purifier)
		lookforpurifier()

/obj/structure/ms13/tank/pipe/plumbed/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

//asking 4 water

/obj/structure/ms13/tank/pipe/plumbed/process()
	//. = ..()
	if(reagents.total_volume <= reagents.maximum_volume)
		if(plant_machinery)
			var/plant_request = reagents.maximum_volume - reagents.total_volume
			plant_machinery.process_request(plant_request, src)
			to_chat(world, span_info("reagents asked for"))

/obj/structure/ms13/tank/pipe/plumbed/proc/lookforpurifier()
	var/purifier = locate(/obj/machinery/ms13/plant_machinery/plumbed)
	plant_machinery = purifier

/obj/structure/ms13/tank/pipe/plumbed/wrench_act_secondary(mob/living/user, obj/item/wrench/ms13/W)
	if(W.buffer == null)
		W.buffer = src

/obj/structure/ms13/tank/pipe/plumbed/attackby(obj/item/w, mob/living/user, params)
	if(istype(w, /obj/item/wrench/ms13))
		return FALSE

/obj/structure/ms13/tank/pipe/plumbed/wrench_act_secondary(mob/living/user, obj/item/wrench/ms13/W)
	if(W.buffer == null)
		W.buffer = src
		to_chat(user, span_info("You prepare to link the [W.buffer] to something."))
		return
	if(W.buffer == /obj/structure/sink/ms13/plumbed)
		to_chat(user, span_info("You need to pipe the tank to the sink. Not the other way around."))
	if(W.buffer == /obj/machinery/ms13/plant_machinery/plumbed)
		to_chat(user, span_info("You link the [W.buffer] to the [src]"))
		plant_machinery = W.buffer

//giving water

/obj/structure/ms13/tank/pipe/plumbed/proc/process_request(request, requesting_item)
	if(request)
		if(request <= reagents.total_volume) //first come first serve
			transfer_to(requesting_item, request)

/obj/structure/ms13/tank/pipe/plumbed/proc/transfer_to(obj/structure/sink/ms13/plumbed/target,amount)
	if(target && target.reagents)
		reagents.trans_to(target, amount)

////////////////////////////////////////////////////////////////////////////

/obj/structure/sink/ms13/plumbed
	name = "sink"
	icon = 'mojave/icons/structure/miscellaneous.dmi'
	icon_state = "sink"
	desc = "An old sink, typically dispensing clean water. Hard to really tell if it's the case anymore, though."
	dispensedreagent = /datum/reagent/consumable/ms13/water/unfiltered
	buildstacktype = /obj/item/stack/sheet/ms13/ceramic
	has_water_reclaimer = FALSE
	var/obj/structure/ms13/tank/pipe/plumbed/linked_tank
	var/max_range = 50
	var/autolinking = FALSE
	var/autolinking_tank = null //will we automatically connect to our tank

/obj/structure/sink/ms13/plumbed/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	create_reagents(100, AMOUNT_VISIBLE)
	reagents.add_reagent(/datum/reagent/consumable/ms13/water, rand(0,5))
	if(autolinking)
		lookfortank()
	return INITIALIZE_HINT_LATELOAD

/obj/structure/sink/ms13/plumbed/LateInitialize()
	process()

/obj/structure/sink/ms13/plumbed/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/structure/sink/ms13/plumbed/proc/lookfortank()
	var/tank = locate(autolinking_tank)
	if(tank)
		linked_tank = tank

/obj/structure/sink/ms13/plumbed/process()
	//. = ..()
	if(reagents.total_volume <= reagents.maximum_volume)
		if(linked_tank)
			var/request = reagents.maximum_volume - reagents.total_volume
			linked_tank.process_request(request, src)

/obj/structure/sink/ms13/plumbed/attackby(obj/item/O, mob/living/user, params)
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

/obj/structure/sink/ms13/plumbed/wrench_act_secondary(mob/living/user, obj/item/wrench/ms13/W)
	. = ..()
	to_chat(user, span_notice("Wrench on"))
	if(istype(W.buffer, /obj/structure/ms13/tank/pipe/plumbed))
		if(get_dist(src, W.buffer) <= max_range)
			to_chat(user, span_info("You link the [W.buffer] to the [src]"))
			linked_tank = W.buffer
			process()
			return
		to_chat(user, span_info("The [W.buffer] is too far from the [src]"))
	if(W.buffer == null)
		to_chat(user, span_info("You need to use the wrench on a water tank first"))
		return

/////////////////////////Area specific sinks////////////////////////

/obj/structure/sink/ms13/plumbed/mammoth

/obj/structure/sink/ms13/plumbed/barony
	autolinking = TRUE
	autolinking_tank = /obj/structure/ms13/tank/pipe/plumbed/barony

/obj/structure/sink/ms13/plumbed/goldmen

/////////////////////////Map specific tanks////////////////////////

/obj/structure/ms13/tank/pipe/plumbed/mammoth

/obj/structure/ms13/tank/pipe/plumbed/barony
	autolinking_purifier = TRUE

/obj/structure/ms13/tank/pipe/plumbed/goldmen

