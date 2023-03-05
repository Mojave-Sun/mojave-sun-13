/datum/element/icon_cutter
	element_flags = ELEMENT_BESPOKE|ELEMENT_DETACH
	id_arg_index = 2

/datum/element/icon_cutter/Attach(datum/target)
	. = ..()

	RegisterSignal(target, COMSIG_OVERLAY_CUTTER_FIRST, .proc/enter_update)
	RegisterSignal(target, COMSIG_OVERLAY_CUTTER_SECOND, .proc/exit_update)

/datum/element/icon_cutter/Detach(datum/target, force)
	UnregisterSignal(target, list(
		COMSIG_OVERLAY_CUTTER_FIRST,
		COMSIG_OVERLAY_CUTTER_SECOND,
	))

	return ..()

/datum/element/icon_cutter/proc/enter_update(datum/source, mob/living/target, deep = 1)
	if(target.icon_cutter)
		target.overlays -= target.icon_cutter
	target.icon_cutter = GLOB.tall_overlays[deep]
	target.overlays += target.icon_cutter

/datum/element/icon_cutter/proc/exit_update(datum/source, mob/living/target, deep = 1)
	target.overlays -= target.icon_cutter
	target.icon_cutter = null
