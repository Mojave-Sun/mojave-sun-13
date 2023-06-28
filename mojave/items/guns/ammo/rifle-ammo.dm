//7.62
/obj/item/ammo_casing/ms13/a762
	name = "7.62 bullet casing"
	desc = "A 7.62 bullet casing."
	caliber = "a762"
	icon_state = "762_casing"
	projectile_type = /obj/projectile/bullet/ms13/a762
	stack_size = 10
	no_inventory_sprite = TRUE

/obj/item/ammo_casing/ms13/a762/junk
	name = "junk 7.62 bullet casing"
	desc = "A makeshift 7.62 bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a762/junk

/obj/item/ammo_casing/ms13/a762/ap
	name = "AP 7.62 bullet casing"
	desc = "An armor piercing 7.62 bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a762/ap

/obj/item/ammo_casing/ms13/a762/fmj
	name = "FMJ 7.62 bullet casing"
	desc = "A full metal jacket 7.62 bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a762/fmj

/obj/item/ammo_casing/ms13/a762/hv
	name = "HV 7.62 bullet casing"
	desc = "A high velocity 7.62 bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a762/hv

/obj/item/ammo_box/ms13/a762
	name = "standard 7.62 ammo box"
	desc = "A box containing standard 7.62 ammo."
	icon_state = "box762"
	ammo_type = /obj/item/ammo_casing/ms13/a762
	caliber = "a762"
	max_ammo = 24
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 64
	grid_height = 32

/obj/item/ammo_box/ms13/a762/junk
	name = "junk 7.62 ammo box"
	desc = "A crude box containing junk quality 7.62 ammo."
	ammo_type = /obj/item/ammo_casing/ms13/a762/junk

/obj/item/ammo_box/ms13/a762/ap
	name = "armor piercing 7.62 ammo box"
	desc = "A box containing high quality 7.62 armor piercing ammo."
	ammo_type = /obj/item/ammo_casing/ms13/a762/ap

/obj/item/ammo_box/ms13/a762/hv
	name = "high velocity 7.62 ammo box"
	desc = "A box containing high quality 7.62 high velocity ammo."
	ammo_type = /obj/item/ammo_casing/ms13/a762/hv

//.308
/obj/item/ammo_casing/ms13/a308
	name = ".308 bullet casing"
	desc = "A .308 bullet casing."
	caliber = "a308"
	icon_state = "308_casing"
	projectile_type = /obj/projectile/bullet/ms13/a308
	stack_size = 10
	no_inventory_sprite = TRUE

/obj/item/ammo_casing/ms13/a308/junk
	name = "junk .308 bullet casing"
	desc = "A makeshift .308 bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a308/junk

/obj/item/ammo_casing/ms13/a308/ap
	name = "AP .308 bullet casing"
	desc = "An armor piercing .308 bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a308/ap

/obj/item/ammo_casing/ms13/a308/fmj
	name = "FMJ .308 bullet casing"
	desc = "A full metal jacket .308 bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a308/fmj

/obj/item/ammo_casing/ms13/a308/hv
	name = "HV .308 bullet casing"
	desc = "A high velocity .308 bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a308/hv

/obj/item/ammo_box/ms13/a308
	name = "standard .308 ammo box"
	desc = "A box containing standard .308 ammo."
	icon_state = "box308"
	ammo_type = /obj/item/ammo_casing/ms13/a308
	caliber = "a308"
	max_ammo = 20
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 64
	grid_height = 32

/obj/item/ammo_box/ms13/a308/junk
	name = "junk .308 ammo box"
	desc = "A crude box containing junk quality .308 ammo."
	ammo_type = /obj/item/ammo_casing/ms13/a308/junk

//5.56
/obj/item/ammo_casing/ms13/a556
	name = "5.56mm bullet casing"
	desc = "A 5.56mm bullet casing."
	caliber = "a556"
	icon_state = "556_casing"
	projectile_type = /obj/projectile/bullet/ms13/a556
	stack_size = 12

/obj/item/ammo_casing/ms13/a556/junk
	name = "junk 5.56mm bullet casing"
	desc = "A makeshift 5.56mm bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a556/junk

/obj/item/ammo_casing/ms13/a556/ap
	name = "AP 5.56mm bullet casing"
	desc = "An armor piercing 5.56mm bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a556/ap

/obj/item/ammo_casing/ms13/a556/fmj
	name = "FMJ 5.56mm bullet casing"
	desc = "A full metal jacket 5.56mm bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a556/fmj

/obj/item/ammo_casing/ms13/a556/hv
	name = "HV 5.56mm bullet casing"
	desc = "A high velocity 5.56mm bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a556/hv

/obj/item/ammo_box/ms13/a556
	name = "standard 5.56 ammo box"
	desc = "A box containing standard 5.56 ammo."
	icon_state = "box556"
	ammo_type = /obj/item/ammo_casing/ms13/a556
	caliber = "a556"
	max_ammo = 40
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 64
	grid_height = 32

/obj/item/ammo_box/ms13/a556/small
	name = "small 5.56 ammo box" //This is basically a snowflake for the 5.56 rev
	max_ammo = 24
	grid_width = 32
	grid_height = 32

/obj/item/ammo_box/ms13/a556/junk
	name = "junk 5.56 ammo box"
	desc = "A crude box containing junk quality 5.56 ammo."
	ammo_type = /obj/item/ammo_casing/ms13/a556/junk

//50 BMG
/obj/item/ammo_casing/ms13/a50MG
	name = ".50MG bullet casing"
	desc = "A .50MG bullet casing."
	caliber = "a50MG"
	icon_state = "50bmg_casing"
	projectile_type = /obj/projectile/bullet/ms13/a50MG
	stack_size = 6
	no_inventory_sprite = TRUE

/obj/item/ammo_casing/ms13/a50MG/ap
	name = "AP .50MG bullet casing"
	desc = "An armor piercing .50MG bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a50MG/ap

/obj/item/ammo_casing/ms13/a50MG/hv
	name = "HV .50MG bullet casing"
	desc = "A high velocity .50MG bullet casing."
	projectile_type = /obj/projectile/bullet/ms13/a50MG/hv

/obj/item/ammo_box/ms13/a50MG
	name = "standard .50MG ammo box"
	desc = "A box containing standard .50MG ammo."
	icon_state = "box50"
	ammo_type = /obj/item/ammo_casing/ms13/a50MG
	caliber = "a556"
	max_ammo = 12
	multiple_sprites = AMMO_BOX_FULL_EMPTY
	w_class = WEIGHT_CLASS_NORMAL
	grid_width = 64
	grid_height = 32

//2mmEC
/obj/item/ammo_casing/caseless/ms13/a2mmEC
	name = "2mmEC projectile"
	desc = "A 2mm electromagnetic projectile."
	caliber = "2mmEC"
	projectile_type = /obj/projectile/bullet/ms13/gauss
