//MOJAVE SUN CUSTOM MAPPING HELPERS SYSTEMS//

//base element injector ms13 edition//
/obj/effect/mapping_helpers/atom_injector/element_injector/ms13
	icon = 'mojave/icons/effects/mapping_helpers.dmi'
	plane = OVER_FRILL_PLANE
	layer = 5

//Lockpicking Element/Sprite updater for Items to be locked/Lockpickable//
/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable
	name = "Base Locked/Lockpicking Injector"
	element_type = /datum/element/lockpickable
	target_type = /obj
	//refer to lockpicking element for difficulties
	var/lowest_no
	var/highest_no

// TO Do - Custom Sprites for Pre-spawn locked objects here
/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/inject(atom/target)
	element_args = list(difficulty = rand(lowest_no, highest_no))
	. = ..()
	return

/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/beginner
	name = "Beginner Lockedpicking Injector"
	icon_state = "beginner"
	element_type = /datum/element/lockpickable
	lowest_no = 20
	highest_no = 28

/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/novice
	name = "Novice Lockedpicking Injector"
	icon_state = "novice"
	element_type = /datum/element/lockpickable
	lowest_no = 16
	highest_no = 20

/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/standard
	name = "Standard Lockedpicking Injector"
	icon_state = "standard"
	element_type = /datum/element/lockpickable
	lowest_no = 10
	highest_no = 15

/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/expert
	name = "Expert Lockedpicking Injector"
	icon_state = "expert"
	element_type = /datum/element/lockpickable
	lowest_no = 5
	highest_no = 9

/obj/effect/mapping_helpers/atom_injector/element_injector/ms13/lockedpickable/master
	name = "Master Lockedpicking Injector"
	icon_state = "master"
	element_type = /datum/element/lockpickable
	lowest_no = 1
	highest_no = 3
