/**
 * Six fuckin' corn dawgs, all drenched in fuckin' mayonnaise, and smash it with some beer
 * Aww yeah!
 * A large pizza... Hahahaw...
 * Not only that... A large pizza... And I'm gonna fuckin' drench it... I was gonna drench my god damn food,
 * in sausage gravy, this time. Not mayonnaise, sausage gravy! Two full cans of sausage gravy... Oww...!
 *
 * And a THIRD can of sausage gravy! Gonna fuckin' smother my god damn pizza in all the fuckin' sausage gravy!
 * Hrmmmfp! Fuckin' gross gluttony! Sausage gravy pizza... Hahahahaw!
 *
 * Two displacement maps are necessary, because the body map has very specific pixel displacement
 * like the fucking belly button.
 * The clothes map uses a simplified, generalized version.
 */
/obj/effect/abstract/displacement_map/fat
	name = "fatass"
	icon = 'mojave/icons/effects/distortion/fat.dmi'
	// DON'T fucking change this, it will break everything, the map is fucking pixel perfect you fucking swine
	displacement_size = 3

/// This uses update_body(), not the standard system, guh
/obj/effect/abstract/displacement_map/fat/apply_displacement(atom/movable/applied)
	if(!applied)
		return
	applied.vis_contents += src

/obj/effect/abstract/displacement_map/fat/remove_displacement(atom/movable/removed)
	if(!removed)
		return
	removed.vis_contents -= src

/// Distortion applied to a human's bodyparts to turn them fat, but not the clothes
/obj/effect/abstract/displacement_map/fat/body
	name = "fatass body"
	icon_state = "body"

/// Distortion applied to a human's clothes to turn them fat
/obj/effect/abstract/displacement_map/fat/clothes
	name = "fatass clothes"
	icon_state = "clothes"
