
/obj/item/bodybag/ms13
	name = "body bag"
	desc = "A folded bag designed for the storage and transportation of cadavers."
	icon = 'mojave/icons/structure/medical.dmi'
	icon_state = "bodybag_folded"
	w_class = WEIGHT_CLASS_HUGE // a HUMAN sized bag is pretty big, even when folded.
	unfoldedbag_path = /obj/structure/closet/body_bag/ms13

// Shared folder for the sake of convenience- The structure/deployed variant. //

/obj/structure/closet/body_bag/ms13
	name = "body bag"
	desc = "An old body bag. Put your foe into these."
	icon = 'mojave/icons/structure/medical.dmi'
	icon_state = "bodybag"
	anchored = FALSE
	mob_storage_capacity = 1 // For the sake of not having too many funny guys...
	material_drop = null
	drag_slowdown = 0.10
