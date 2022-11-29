/**
 * Six fuckin' corn dawgs, all drenched in fuckin' mayonnaise, and smash it with some beer
 * Aww yeah!
 *
 * Two displacement maps are necessary, because the body map has very specific pixel displacement
 * like the fucking belly button.
 * The clothes map uses a simplified, generalized version.
 */
/obj/effect/abstract/displacement_map/fat
	name = "fatass"
	icon = 'mojave/icons/effects/distortion/fat.dmi'
	// DON'T fucking change this, it will break everything, the map is fucking pixel perfect
	displacement_size = 3

/// This uses update_body(), not the standard system, guh
/obj/effect/abstract/displacement_map/fat/apply_displacement(atom/applied)
	return

/obj/effect/abstract/displacement_map/fat/remove_displacement(atom/removed)
	return

/// Distortion applied to a human's body to turn them fat, not the clothes
/obj/effect/abstract/displacement_map/fat/body
	name = "fatass body"
	icon_state = "body"

/// Distortion applied to a human's clothes to turn them fat
/obj/effect/abstract/displacement_map/fat/clothes
	name = "fatass clothes"
	icon_state = "clothes"
