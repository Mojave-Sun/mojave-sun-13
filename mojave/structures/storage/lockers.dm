/obj/structure/closet/ms13
	name = "wasteland wardrobe"
	desc = "Holds wastelands, presumably."
	icon = 'mojave/icons/structure/storage.dmi'
	can_weld_shut = FALSE
	material_drop = /obj/item/stack/sheet/ms13/scrap
	door_anim_time = 0
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_sheet_4.wav'

/obj/structure/closet/ms13/Initialize(mapload)
	. = ..()
	reset_grid_inventory()

/obj/structure/closet/ms13/metal
	name = "metal locker"
	desc = "A large metal locker for all of your stuff. Or "
	icon_state = "locker"
	can_weld_shut = TRUE
	max_integrity = 400

/obj/structure/closet/ms13/enclave
	name = "\improper Enclave locker"
	desc = "Used to hold various truly American things. No muties allowed!"
	icon_state = "enclave"
	material_drop_amount = 1
	max_integrity = 400

/obj/structure/closet/ms13/fridge
	name = "refrigerator"
	desc = "A once powered refrigerator unit. Useful for keeping your food in one place."
	icon_state = "fridge"
	material_drop = /obj/item/stack/sheet/ms13/scrap
	material_drop_amount = 1
	max_integrity = 250
