/////////////////////////////////////////////////////////////
////////// MOJAVE SUN WORLD ICON ELEMENT DIRECTORY //////////
/////////////////////////////////////////////////////////////

// Slap onto something to give it a world icon that differs from the inventory one (allows for realistically sized objects and all that) //
// To fix 25/06/2021 : Blood Decals, Mutable Overlays and other baked in bitch ass overlays that need to be remade when the icon changes //

//Easiest way to do this is making the initial icon be the world folder and the element one be the inventory folder (for objects with world icons, else just initially do the inventory one [and get whooped])

/datum/element/inworld_sprite
	element_flags = ELEMENT_BESPOKE
	id_arg_index = 2
	var/world_sprite
	var/inventory_sprite

/datum/element/inworld_sprite/Attach(datum/target, inventory_sprite, world_sprite)
	. = ..()
	if(!isatom(target))
		return ELEMENT_INCOMPATIBLE
	icon_change(target, world_sprite)

	src.world_sprite = world_sprite
	src.inventory_sprite = inventory_sprite

	RegisterSignal(target, list(COMSIG_ITEM_DROPPED, COMSIG_STORAGE_EXITED), .proc/icon_world)
	RegisterSignal(target, list(COMSIG_ITEM_EQUIPPED, COMSIG_STORAGE_ENTERED), .proc/icon_inventory)

/datum/element/inworld_sprite/Detach(datum/target)
	UnregisterSignal(target, list(
		COMSIG_ITEM_PICKUP,
		COMSIG_ITEM_DROPPED,
		COMSIG_STORAGE_ENTERED,
		COMSIG_STORAGE_EXITED,
	))
	return ..()

/datum/element/inworld_sprite/proc/icon_change(datum/source, icon_folder)
	var/atom/target_object = source
	if(!icon_folder)
		target_object.icon = initial(target_object.icon)
	else
		target_object.icon = icon_folder

/datum/element/inworld_sprite/proc/icon_world(datum/source)
	SIGNAL_HANDLER

	icon_change(source, world_sprite)

/datum/element/inworld_sprite/proc/icon_inventory(datum/source)
	SIGNAL_HANDLER

	icon_change(source, inventory_sprite)
