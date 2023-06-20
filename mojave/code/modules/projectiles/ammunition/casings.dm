/obj/item/ammo_casing/ms13
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'
	click_cooldown_override = 1
	stack_type = /obj/item/ammo_box/magazine/ammo_stack

/obj/item/ammo_casing/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/ammo/ammo_inventory.dmi')

/*
/obj/item/ammo_casing/ms13/a762/lp
	name = "7.62 lowpower bullet casing"
	desc = "A 7.62 bullet casing."
	icon_state = "762-casing"
	caliber = "a762"
	projectile_type = /obj/projectile/bullet/ms13/a762 */

/obj/item/ammo_casing/ms13/needle
	name = "A needler round."
	desc = "A dart for use in needler pistols."
	caliber = "needle"
	projectile_type = /obj/projectile/bullet/ms13/needle

/*/obj/item/ammo_casing/c4570SP
	name = ".45 LC bullet casing"
	desc = "A .45 Long Colt bullet casing."
	caliber = "4570"
	projectile_type = /obj/projectile/bullet/ms13/c4570SP*/

/obj/item/ammo_casing/ms13/spent
	click_cooldown_override = 1
	icon = 'mojave/icons/objects/ammo/ammo_world.dmi'

/obj/item/ammo_casing/ms13/spent/Initialize(mapload)
	. = ..()
	if(projectile_type)
		loaded_projectile = new projectile_type(src)
	pixel_x = base_pixel_x + rand(-10, 10)
	pixel_y = base_pixel_y + rand(-10, 10)
	update_appearance()
