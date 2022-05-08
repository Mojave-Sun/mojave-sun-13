/////////////////////////////////////////////////////////////
////////// MOJAVE SUN WORLD ICON ELEMENT DIRECTORY //////////
/////////////////////////////////////////////////////////////

// Slap onto something to give it a world icon that differs from the inventory one (allows for realistically sized objects and all that) //
// To fix 25/06/2021 : Blood Decals, Mutable Overlays and other baked in bitch ass overlays that need to be remade when the icon changes //
// Fixed 07/05/2022: Now you can deal with the above by handling everything with attached_proc instead

/datum/element/world_icon
	id_arg_index = 2
	element_flags = ELEMENT_BESPOKE | ELEMENT_DETACH
	/**
	 * If we want COMPLEX world icon behavior, this proc will handle icon updating when the item is NOT in the inventory.
	 * I just assumed that the default update_icon is for inventory sprites because ss13 basically focuses on how the sprites
	 * look on your hand, not how they realistically look in the world.
	 */
	var/attached_proc
	/// Only used if attached_proc doesn't exist, simply changes the icon of target to this when it's in the inventory
	var/inventory_icon
	/// Only used if attached_proc doesn't exist, simply changes the icon of target to this when it's NOT in the inventory
	var/world_icon

/datum/element/world_icon/Attach(obj/item/target, attached_proc, world_icon, inventory_icon)
	. = ..()
	if(!istype(target))
		return ELEMENT_INCOMPATIBLE

	src.attached_proc = attached_proc
	src.world_icon = world_icon
	src.inventory_icon = inventory_icon
	RegisterSignal(target, COMSIG_ATOM_UPDATE_ICON, .proc/update_icon)
	RegisterSignal(target, list(COMSIG_ITEM_EQUIPPED, COMSIG_STORAGE_ENTERED, COMSIG_ITEM_DROPPED, COMSIG_STORAGE_EXITED), .proc/inventory_updated)
	target.update_appearance(UPDATE_ICON)

/datum/element/world_icon/Detach(obj/item/source)
	. = ..()
	UnregisterSignal(source, COMSIG_ATOM_UPDATE_ICON)
	UnregisterSignal(source, list(COMSIG_ITEM_EQUIPPED, COMSIG_STORAGE_ENTERED, COMSIG_ITEM_DROPPED, COMSIG_STORAGE_EXITED))
	source.update_appearance(UPDATE_ICON)

/datum/element/world_icon/proc/update_icon(obj/item/source, updates)
	SIGNAL_HANDLER

	if((source.item_flags & IN_INVENTORY) || (source.loc && SEND_SIGNAL(source.loc, COMSIG_CONTAINS_STORAGE)))
		if(attached_proc)
			return
		return default_inventory_icon(source)

	if(attached_proc)
		return call(source, attached_proc)(updates)
	else
		return default_world_icon(source)

/datum/element/world_icon/proc/inventory_updated(obj/item/source)
	SIGNAL_HANDLER

	source.update_appearance(UPDATE_ICON)

/datum/element/world_icon/proc/default_inventory_icon(obj/item/source)
	SIGNAL_HANDLER

	source.icon = inventory_icon

/datum/element/world_icon/proc/default_world_icon(obj/item/source)
	SIGNAL_HANDLER

	source.icon = world_icon
