/datum/element/craftable
	element_flags = ELEMENT_BESPOKE
	id_arg_index = 2
	///The type of atom this creates when the crafting recipe is used.
	var/atom/result_atom_type
	///The object used when attacked onto another.
	var/atom/crafting_object
	///Time to craft the atom.
	var/time_to_craft
	///Amount of the resulting actor this will create.
	var/amount_created
	///The crafting noise the procedure will make.
	var/crafting_sound
	///If the atom requires a specific surface to be on to craft.
	var/surface_type ///obj/structure/table etc.
	///The noise played on a successful focus hit of the object.
	var/crafting_focus_sound

/datum/element/craftable/Attach(datum/target, crafting_object, result_atom_type, amount_created = 1, time_to_craft = 8 SECONDS, crafting_sound = "mojave/sound/ms13effects/crafting/ducttape.ogg", surface_type = null, crafting_focus_sound = "mojave/sound/ms13effects/crafting/tingting.ogg")
	. = ..()
	if(!isatom(target))
		return ELEMENT_INCOMPATIBLE

	src.crafting_object = crafting_object
	src.amount_created = amount_created
	src.time_to_craft = time_to_craft
	src.result_atom_type = result_atom_type
	src.crafting_sound = crafting_sound
	src.surface_type = surface_type
	src.crafting_focus_sound = crafting_focus_sound

	RegisterSignal(target, COMSIG_CRAFTING_ATTACKBY, .proc/try_craft)
	RegisterSignal(target, COMSIG_PARENT_EXAMINE, .proc/examine)

/datum/element/craftable/Detach(datum/target)
	. = ..()
	UnregisterSignal(target, list(COMSIG_CRAFTING_ATTACKBY, COMSIG_PARENT_EXAMINE))

/datum/element/craftable/proc/try_craft(datum/source, mob/living/user, obj/item/I, list/mutable_recipes)
	SIGNAL_HANDLER

	mutable_recipes += list(list(CRAFTING_RESULT = result_atom_type, CRAFTING_AMOUNT = amount_created, CRAFTING_TIME = time_to_craft, CRAFTING_ITEM = source, CRAFTING_SOUND = crafting_sound, CRAFTING_SURFACE = surface_type, CRAFTING_FOCUS_SOUND = crafting_focus_sound))
	return COMPONENT_BLOCK_CRAFTING_ATTACK

/datum/element/craftable/proc/examine(atom/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	examine_list += span_notice("You think it can be crafted into \a [initial(result_atom_type.name)] with [initial(crafting_object.name)].")

/atom/proc/craft(obj/item/I, mob/living/user)
	var/list/crafting_recipes = list() //List of recipes that can be mutated by sending the signal
	var/signal_craft = SEND_SIGNAL(src, COMSIG_CRAFTING_ATTACKBY, user, I, crafting_recipes)
	if(crafting_recipes.len)
		craft_recipes(user, I, crafting_recipes)
	if(QDELETED(I))
		return TRUE
	if(. || signal_craft & COMPONENT_BLOCK_CRAFTING_ATTACK)
		return TRUE

/atom/proc/craft_recipes(obj/item/I, mob/living/user, list/crafting_recipes, list/crafting_options)
	//Only one recipe? use the first
	if(crafting_recipes.len == 1)
		StartCraftingAtom(user, I, crafting_recipes[1])
		return
	//Otherwise, select one with a radial
	ShowCraftingGui(user, I, crafting_recipes)

///Creates the radial and crafts the selected option
/atom/proc/ShowCraftingGui(obj/item/I, mob/living/user, list/crafting_options)
	var/list/choices_to_options = list() //Crafting option names
	var/list/choices = list()

	for(var/b in crafting_options)
		var/list/current_crafting_option = b
		var/atom/crafting_option_type = current_crafting_option[CRAFTING_RESULT]
		choices_to_options[initial(crafting_option_type.name)] = current_crafting_option
		var/image/option_image = image(icon = initial(crafting_option_type.icon), icon_state = initial(crafting_option_type.icon_state))
		choices += list("[initial(crafting_option_type.name)]" = option_image)
	var/pick = show_radial_menu(I, user, choices, radius = 36, require_near = TRUE)

	if(!pick)
		return

	StartCraftingAtom(user, I, choices_to_options[pick])

/atom/proc/StartCraftingAtom(obj/item/I, mob/living/user, list/current_crafting_option)
	var/list/choices_to_options = list()
	var/atom/crafting_option_surface = current_crafting_option[CRAFTING_SURFACE]
	var/atom/thing = current_crafting_option[CRAFTING_ITEM]
	choices_to_options[initial(crafting_option_surface.name)] = current_crafting_option
	if(crafting_option_surface != null)
		StartSurfaceCraftingAtom(user, I, current_crafting_option)
		return
	to_chat(user, "<span class='notice'>You start crudely working on [src].</span>")
	playsound(I, current_crafting_option[CRAFTING_SOUND], 50, TRUE)
	if(do_after_interactive(user, current_crafting_option[CRAFTING_TIME], thing, bonus_time = 1 SECONDS, focus_sound = current_crafting_option[CRAFTING_FOCUS_SOUND], type = /obj/effect/hallucination/simple/progress_focus/skillcheck))
		var/atom/atom_to_create = current_crafting_option[CRAFTING_RESULT]
		var/list/atom/created_atoms = list()
		for(var/i = 1 to current_crafting_option[CRAFTING_AMOUNT])
			var/atom/created_atom = new atom_to_create(drop_location())
			created_atom.OnCreatedFromCrafting(user, I, current_crafting_option, src)
			to_chat(user, "<span class='notice'>You manage to create [current_crafting_option[CRAFTING_AMOUNT]] [initial(atom_to_create.name)]\s from [src].</span>")
			created_atoms.Add(created_atom)
		UsedforCrafting(user, I, current_crafting_option)
		return

/atom/proc/StartSurfaceCraftingAtom(obj/item/I, mob/living/user, list/current_crafting_option)
	var/list/choices_to_options = list()
	var/atom/crafting_option_surface = current_crafting_option[CRAFTING_SURFACE]
	var/atom/thing_on_surface = current_crafting_option[CRAFTING_ITEM]
	choices_to_options[initial(crafting_option_surface.name)] = current_crafting_option
	if((locate(current_crafting_option[CRAFTING_SURFACE]) in thing_on_surface.loc))
		to_chat(user, "<span class='notice'>You start working on [src].</span>")
		playsound(I, current_crafting_option[CRAFTING_SOUND], 50, TRUE)
		if(do_after_interactive(user, current_crafting_option[CRAFTING_TIME], thing_on_surface, bonus_time = 1 SECONDS, focus_sound = current_crafting_option[CRAFTING_FOCUS_SOUND], type = /obj/effect/hallucination/simple/progress_focus/skillcheck))
			var/atom/atom_to_create = current_crafting_option[CRAFTING_RESULT]
			var/list/atom/created_atoms = list()
			for(var/i = 1 to current_crafting_option[CRAFTING_AMOUNT])
				var/atom/created_atom = new atom_to_create(drop_location())
				created_atom.OnCreatedFromCrafting(user, I, current_crafting_option, src)
				to_chat(user, "<span class='notice'>You manage to create [current_crafting_option[CRAFTING_AMOUNT]] [initial(atom_to_create.name)]\s from [src].</span>")
				created_atoms.Add(created_atom)
			UsedforCrafting(user, I, current_crafting_option)
			return
	else
		to_chat(I, "<span class='warning'>This component needs to be on a [initial(crafting_option_surface.name)] to be craftable!")
		return

/atom/proc/UsedforCrafting(obj/item/I, mob/living/user, list/current_crafting_option)
	qdel(user)
	return

/atom/proc/OnCreatedFromCrafting(obj/item/I, mob/living/user, list/current_crafting_option, atom/original_atom)
	qdel(original_atom)
	return

/// testing shit ///
/*
/obj/item/ms13/crafting/gunpart
	name = "shotgun action parts"
	desc = "A set of various action parts for the creation of shotguns."
	icon = 'mojave/icons/objects/crafting.dmi'
	icon_state = "weapon_parts_2"

/obj/item/ms13/crafting/other
	name = "shotgun barrel parts"
	desc = "A set of various barrel parts for the creation of shotguns."
	icon = 'mojave/icons/objects/melee/melee_inventory.dmi'
	icon_state = "lead_pipe_alt"

/obj/item/ms13/crafting/Initialize()
	. = ..()
	MakeCraftable()

/obj/item/ms13/crafting/proc/MakeCraftable()
	return

/obj/item/ms13/crafting/gunpart/MakeCraftable()
	AddElement(/datum/element/craftable, /obj/item/ms13/crafting/other, /obj/item/gun/ballistic/rifle/ms13/hunting/chinese, 1, 120 SECONDS)
	AddElement(/datum/element/craftable, /obj/item/ms13/crafting/other, /obj/item/gun/ballistic/shotgun/ms13/lever, 1, 120 SECONDS, surface_type = /obj/structure/table/ms13/no_smooth/workbench)
*/
