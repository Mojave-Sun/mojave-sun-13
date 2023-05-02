/// An element to add a FOV trait to the wearer, removing it when an item is unequipped, but only as long as the visor is active.
/datum/component/fov_nightvision
	/// What's the FOV angle of the trait we're applying to the wearer
	var/fov_angle
	/// Keeping track of the visor of our clothing.
	var/deactivated = FALSE
	/// Because of clothing code not being too good, we need keep track whether we are worn.
	var/is_worn = FALSE
	/// The night vision mask applied to a client's screen
	var/atom/movable/screen/nightvision/nightvision
	/// The grain mask applied to a client's screen
	var/atom/movable/screen/nightvision_shadow/nightvision_shadow

/datum/component/fov_nightvision/Initialize(fov_angle)
	. = ..()
	if(!isclothing(parent))
		return COMPONENT_INCOMPATIBLE
	var/mob/living/mob_parent = parent
	var/obj/item/clothing/clothing_parent = parent
	src.fov_angle = fov_angle
	src.deactivated = clothing_parent.is_activated //Initial values could vary, so we need to get it.
	on_dir_change(mob_parent, mob_parent.dir, mob_parent.dir)

/datum/component/fov_nightvision/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, .proc/on_equip)
	RegisterSignal(parent, COMSIG_ITEM_DROPPED, .proc/on_drop)
	//RegisterSignal(parent, COMSIG_CLOTHING_VISOR_TOGGLE, .proc/on_vision_toggle)
	RegisterSignal(parent, COMSIG_ATOM_DIR_CHANGE, .proc/on_dir_change)

/datum/component/fov_nightvision/UnregisterFromParent()
	UnregisterSignal(parent, list(COMSIG_ITEM_EQUIPPED, COMSIG_ITEM_DROPPED, COMSIG_CLOTHING_VISOR_TOGGLE))
	return ..()

/// On dropping the item, remove the FoV trait if visor was down.
/datum/component/fov_nightvision/proc/on_drop(datum/source, mob/living/dropper)
	SIGNAL_HANDLER
	var/obj/item/clothing/clothing_parent = parent
	var/mob/living/carbon/wearer = clothing_parent
	var/client/parent_client = wearer.client
	is_worn = FALSE
	if(deactivated)
		return
	parent_client.screen -= nightvision
	parent_client.screen -= nightvision_shadow

/// On equipping the item, add the FoV trait if visor isn't active.
/datum/component/fov_nightvision/proc/on_equip(obj/item/source, mob/living/equipper, slot)
	SIGNAL_HANDLER
	var/obj/item/clothing/clothing_parent = parent
	var/mob/living/carbon/wearer = clothing_parent
	var/client/parent_client = wearer.client
	if(!(source.slot_flags & slot)) //If EQUIPPED TO HANDS FOR EXAMPLE
		return
	is_worn = TRUE
	if(deactivated)
		return
	parent_client.screen += nightvision
	parent_client.screen += nightvision_shadow

/*
/// On toggling the visor, we may want to add or remove FOV trait from the wearer.
/datum/component/fov_nightvision/proc/on_vision_toggle(datum/source, visor_state)
	SIGNAL_HANDLER
	deactivated = visor_state
	if(!is_worn)
		return
	var/obj/item/clothing/clothing_parent = parent
	var/mob/living/wearer = clothing_parent.loc //This has to be the case due to equip/dropped keeping track.
	if(deactivated)
		wearer.remove_fov_trait(source.type, fov_angle)
		wearer.deactivedated_fov()
	else
		wearer.add_fov_trait(source.type, fov_angle)
		wearer.deactivedated_fov() */

/// When a direction of the user changes, so do the masks
/datum/component/fov_nightvision/proc/on_dir_change(mob/source, old_dir, new_dir)
	SIGNAL_HANDLER
	nightvision.dir = new_dir
	nightvision_shadow.dir = new_dir

/atom/movable/screen/nightvision
	icon = 'mojave/icons/effects/nightvision_fov.dmi' //MOJAVE EDIT - Original path is icons/effects/fov/field_of_view.dmi
	icon_state = "90"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FIELD_OF_VISION_BLOCKER_PLANE
	screen_loc = "BOTTOM,LEFT"

/atom/movable/screen/nightvision_shadow
	icon = 'mojave/icons/effects/nightvision_fov.dmi' //MOJAVE EDIT - Original path is icons/effects/fov/field_of_view.dmi
	icon_state = "90_v"
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = ABOVE_LIGHTING_PLANE
	screen_loc = "BOTTOM,LEFT"
