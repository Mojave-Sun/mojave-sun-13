//NOTE: KEEPING THIS DISABLED FOR NOW

//Makes you request water or die, this could be made more generic with support of more reagents but that's going into "refactor addiction" territory

//Amount of seconds a unit of water will provide life for, modify this for balancing purposes
//Influences amount of units consumed by this component alongside how much
#define SECONDS_OF_LIFE_PER_WATER_U 60

//List of stage of dehydration => examine/warning text
GLOBAL_LIST_INIT(dehydration_stage_examine, list("You feel full of life and turgid.",
												 "<font color='yellow'>You could use some water.",
												 "<font color='yellow'>Your mouth feels dry.",
												 "<font color='yellow'>Your tongue is cracking and dry.",
												 "<font color='red'>You can barely focus from how thirsty you are."
												))

//List of stage of dehydration => typepath associated with alert to pop up
GLOBAL_LIST_INIT(dehydration_stage_alerts, list(
												/atom/movable/screen/alert/hudbar/thirst/not_thirsty,
												/atom/movable/screen/alert/hudbar/thirst/slight_thirst,
												/atom/movable/screen/alert/hudbar/thirst/thirsty,
												/atom/movable/screen/alert/hudbar/thirst/very_thirsty,
												/atom/movable/screen/alert/hudbar/thirst/dehydrated
												))

/datum/component/thirst
	var/curr_thirst //How much thirst is currently acquired
	var/max_thirst //How much our thirst can be fulfilled
	var/rate_of_thirst //Reduces by this much thirst every Life() tick
	var/stage_of_dehydration //Current stage of dehydration; goes from 1-5 where 1 is the non-thirsty stage
	var/list/stage_to_text //A list of messages to show on examine and when entering a new stage
	var/list/stage_to_alert //What alert to pop up when reaching a certain stage, data stored as typepaths
	var/the_liquid

//3000 being 50 minutes/3000 seconds of starting water, thirst limit being the same thing
/datum/component/thirst/Initialize(thirst_rate = -1, start_thirst = 3000, thirst_limit = 3000, list/dehydration_stage_examine, list/dehydration_stage_alerts)
	if(iscyborg(parent) || !isliving(parent))
		return COMPONENT_INCOMPATIBLE
	max_thirst = thirst_limit
	rate_of_thirst = thirst_rate
	stage_to_text = dehydration_stage_examine
	stage_to_alert = dehydration_stage_alerts
	stage_of_dehydration = 1
	var/mob/living/the_parent = parent
	modify_thirst(modify_by = 1000)
	RegisterSignal(the_parent, COMSIG_CHECK_SELF, .proc/on_examine)
	RegisterSignal(the_parent, DEHYDRATION_STAGE_CHECK, .proc/return_dehydration_stage)
	RegisterSignal(the_parent, THIRST_METABOLISE, .proc/on_water)
	START_PROCESSING(SSdcs, src)
	if(stage_of_dehydration == 1) //Still the same after modifying thirst? throw the alert
		the_parent.throw_alert("thirst", GLOB.dehydration_stage_alerts[stage_of_dehydration])


/datum/component/thirst/proc/return_dehydration_stage()
	SIGNAL_HANDLER
	return stage_of_dehydration

/datum/component/thirst/proc/on_examine(datum/source, list/combined_msg)
	SIGNAL_HANDLER
	combined_msg += span_info("[GLOB.dehydration_stage_examine[stage_of_dehydration]]")

/datum/element/thirst/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, COMSIG_CHECK_SELF)
	UnregisterSignal(target, DEHYDRATION_STAGE_CHECK)
	var/mob/living/carbon/the_target = target
	the_target.clear_alert("thirst")

/datum/component/thirst/proc/on_water(datum/source, adjust_amount)
	SIGNAL_HANDLER

	to_chat(src, span_notice("on_water"))
	the_liquid = adjust_amount
	modify_thirst(modify_by = adjust_amount)

/datum/component/thirst/process()
	modify_thirst(modify_by = rate_of_thirst)
	var/mob/living/the_parent = parent

	//Last stage of dehydration, you're basically going to die now
	if(stage_of_dehydration == length(GLOB.dehydration_stage_alerts))
		var/fov_angle = 180
		var/mob/living/carbon/the_carbon = the_parent
		var/obj/item/I = the_carbon.get_active_held_item()
		if(!istype(the_carbon))
			return
		if(istype(the_carbon))
			the_parent.add_fov_trait(src, fov_angle)
			if(DT_PROB(1, 15))
				the_parent.emote("cough")
				the_parent.dropItemToGround(I)

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
	stage_of_dehydration = clamp(stage_of_dehydration + modify_by, 1, length(GLOB.dehydration_stage_examine))
	to_chat(parent, "[GLOB.dehydration_stage_examine[stage_of_dehydration]].")
	var/mob/living/the_parent = parent
	the_parent.clear_alert("thirst")
	if (stage_of_dehydration >= 1 && stage_of_dehydration < 5)
		the_parent.throw_alert("thirst", GLOB.dehydration_stage_alerts[stage_of_dehydration])
	if (stage_of_dehydration == 5)
		the_parent.throw_alert("thirst", GLOB.dehydration_stage_alerts[stage_of_dehydration])
