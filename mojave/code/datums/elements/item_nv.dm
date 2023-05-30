/// An element to unconditonally add an NV FOV trait to the wearer, removing it when an item is unequipped
/datum/element/item_nv
	element_flags = ELEMENT_BESPOKE
	id_arg_index = 2
	/// Angle of the FoV we will apply when someone wears the clothing this element is attached to.
	var/fov_angle
	/// What's the alpha of the trait we're applying to the wearer
	var/alpha
	/// What's the color of the trait we're applying to the wearer
	var/color

/datum/element/item_nv/Attach(datum/target, fov_angle = FOV_180_DEGREES, alpha = 255, color = "#aaffaa")
	. = ..()
	if(!isitem(target))
		return ELEMENT_INCOMPATIBLE
	src.fov_angle = fov_angle
	src.alpha = alpha
	src.color = color
	RegisterSignal(target, COMSIG_ITEM_EQUIPPED, .proc/on_equip)
	RegisterSignal(target, COMSIG_ITEM_DROPPED, .proc/on_drop)

/datum/element/item_nv/Detach(datum/target)
	UnregisterSignal(target, list(COMSIG_ITEM_EQUIPPED, COMSIG_ITEM_DROPPED))
	return ..()

/// On equipping the item, add the NV FoV trait.
/datum/element/item_nv/proc/on_equip(obj/item/source, mob/living/equipper, slot)
	SIGNAL_HANDLER

	if(!(source.slot_flags & slot)) //If EQUIPPED TO HANDS FOR EXAMPLE
		return

	equipper.add_nv_trait("[REF(source)]", fov_angle, alpha, color)
	equipper.update_nv()

/// On dropping the item, remove the NV FoV trait.
/datum/element/item_nv/proc/on_drop(datum/source, mob/living/dropper)
	SIGNAL_HANDLER

	dropper.remove_nv_trait("[REF(source)]")
	dropper.update_nv()
