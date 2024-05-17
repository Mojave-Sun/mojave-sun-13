// 40mm GL

/obj/projectile/bullet/ms13/a40mm
	name ="40mm rubber round"
	desc = "A riot control round for a grenade launcher. Definitely don't aim for the head with this one... Or do."
	icon_state= "grenade"
	damage = 50
	embedding = null
	shrapnel_type = null
	sharpness = NONE

/obj/projectile/bullet/ms13/a40mm/scrap
	name ="40mm scrap round"
	desc = "A makeshift high-caliber shotgun shell pellet!"
	damage = 15
	sharpness = SHARP_POINTY

/obj/projectile/bullet/ms13/a40mm/frag
	name ="40mm frag round"
	desc = "A fragmentation round. Hot and ready!"
	damage = 40
	shrapnel_type = /obj/projectile/bullet/shrapnel/ms13

/obj/projectile/bullet/ms13/a40mm/frag/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, devastation_range = -1, light_impact_range = 2, flame_range = 3, flash_range = 1, adminlog = FALSE, explosion_cause = src)
	return BULLET_ACT_HIT

/obj/projectile/bullet/ms13/a40mm/gas
	name ="40mm gas round"
	desc = "You call this police brutality?"
	damage = 40

/obj/projectile/bullet/ms13/a40mm/gas/on_hit(atom/target, blocked = FALSE)
	..()
	var/turf/my_turf = get_turf(src)
	my_turf.VapourTurf(/datum/vapours/cs_gas, 3000) // Dump a fuckload of this - I don't think this is AS MUCH as you'd guess, but if you're in the center of this when it goes off... uhh.. Well. Concentrated CS gas, yeah.
