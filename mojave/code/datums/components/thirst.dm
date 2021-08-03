//Makes you request water or die, this could be made more generic with support of more reagents but that's going into "refactor addiction" territory

//Amount of seconds a unit of water will provide life for, modify this for balancing purposes
//Influences amount of units consumed by this component alongside how much
#define SECONDS_OF_LIFE_PER_WATER_U 60

//List of stage of dehydration => examine/warning text
GLOBAL_LIST_INIT(dehydration_stage_examine, list("<font color='green'>not dehydrated",
												 "<font color='orange'>very slightly dehydrated",
												 "<font color='orange'>dehydrated",
												 "<font color='red'>very dehydrated",
												 "<font color='red'>close to death from a lack of water"
												))

//List of stage of dehydration => typepath associated with alert to pop up
GLOBAL_LIST_INIT(dehydration_stage_alerts, list(
												/atom/movable/screen/alert/thirst/not_thirsty,
												/atom/movable/screen/alert/thirst/slight_thirst,
												/atom/movable/screen/alert/thirst/thirsty,
												/atom/movable/screen/alert/thirst/very_thirsty,
												/atom/movable/screen/alert/thirst/dehydrated
												))

/datum/component/thirst
	var/curr_thirst //How much thirst is currently acquired
	var/max_thirst //How much our thirst can be fulfilled
	var/rate_of_thirst //Reduces by this much thirst every Life() tick
	var/stage_of_dehydration //Current stage of dehydration; goes from 1-5 where 1 is the non-thirsty stage
	var/list/stage_to_text //A list of messages to show on examine and when entering a new stage
	var/list/stage_to_alert //What alert to pop up when reaching a certain stage, data stored as typepaths

//3000 being 50 minutes/3000 seconds of starting water, thirst limit being the same thing
/datum/component/thirst/Initialize(thirst_rate = -1, start_thirst = 3000, thirst_limit = 3000, list/stage_flavor_text, list/stages_to_alerts)
	if(iscyborg(parent) || !isliving(parent))
		return COMPONENT_INCOMPATIBLE
	max_thirst = thirst_limit
	rate_of_thirst = thirst_rate
	stage_to_text = stage_flavor_text
	stage_to_alert = stages_to_alerts
	stage_of_dehydration = 1
	var/mob/the_parent = parent
	modify_thirst(modify_by = start_thirst)
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, .proc/on_examine)
	START_PROCESSING(SSdcs, src)
	if(stage_of_dehydration == 1) //Still the same after modifying thirst? throw the alert
		the_parent.throw_alert("thirst", stage_to_alert[stage_of_dehydration])


/datum/element/thirst/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, COMSIG_PARENT_EXAMINE)
	var/mob/living/carbon/the_target = target
	the_target.clear_alert("thirst")

/datum/component/thirst/process()
	modify_thirst(modify_by = rate_of_thirst)
	//Nice and hardcoded for now, probably
	var/mob/living/the_parent = parent
	if(the_parent.has_reagent(/datum/reagent/water) && the_parent.reagents.get_reagent(/datum/reagent/water))
		var/datum/reagent/water/water = the_parent.reagents.get_reagent(/datum/reagent/water) //Modify metabolism rate here so don't need to edit base files
		water.metabolization_rate = 0 // Stop water metabolization, we'll take it from here
		modify_thirst(modify_by = min(the_parent.reagents.get_reagent_amount(/datum/reagent/water) * SECONDS_OF_LIFE_PER_WATER_U, SECONDS_OF_LIFE_PER_WATER_U * 5)) //NO MICRODOSING, "metabolizes" 5 units of water per 1 second for +25 thirst
		the_parent.reagents.remove_reagent(/datum/reagent/water, 5)

	//Last stage of dehydration, you're basicall going to die now
	if(stage_of_dehydration == length(GLOB.dehydration_stage_alerts))
		the_parent.adjustOxyLoss(1)
		var/mob/living/carbon/the_carbon = the_parent
		if(!istype(the_carbon))
			return
		for(var/i in the_carbon.internal_organs)
			var/obj/item/organ/O = i
			if(O.organ_flags & ORGAN_SYNTHETIC)
				continue
			O.applyOrganDamage(0.5)

///Modifies thirst by modify_by VIA = curr_thirst + modify_by, clamps value to max_thirst or 0
/datum/component/thirst/proc/modify_thirst(modify_by = 0)
	curr_thirst = clamp(curr_thirst + modify_by, 0, max_thirst)
	if ((stage_of_dehydration != 5) && (curr_thirst < ((length(GLOB.dehydration_stage_examine) - (stage_of_dehydration)) * ((max_thirst / 2) / length(GLOB.dehydration_stage_examine)))))
		modify_stage(modify_by = 1)

	else
		if((stage_of_dehydration != 1) && curr_thirst > ((length(GLOB.dehydration_stage_examine) - (stage_of_dehydration) + 1) * ((max_thirst / 2) / length(GLOB.dehydration_stage_examine))))
			modify_stage(modify_by = -1)

///Modifies stage of dehydration VIA += while also displaying a message and a popup alert to the parent
/datum/component/thirst/proc/modify_stage(modify_by = 0)
	if(!modify_by)
		return
	stage_of_dehydration = clamp(stage_of_dehydration + modify_by, 1, length(stage_to_text))
	to_chat(parent, "You feel [stage_to_text[stage_of_dehydration]].")
	var/mob/the_parent = parent
	the_parent.clear_alert("thirst")
	the_parent.throw_alert("thirst", stage_to_alert[stage_of_dehydration])

///Examines the state of dehydration parent is in
/datum/component/thirst/proc/on_examine(datum/source, mob/M)
	SIGNAL_HANDLER

	if(source == M)
		to_chat(M, "You appear to be [stage_to_text[stage_of_dehydration]].")
	else
		to_chat(M, "[source] appears to be [stage_to_text[stage_of_dehydration]].")
