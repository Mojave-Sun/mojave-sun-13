/obj/structure/bed/ms13
	name = "base class Mojave Sun bed"
	desc = "Scream at the coders if you see this."
	icon = 'mojave/icons/structure/beds.dmi'
	bolts = FALSE // for real, TG?

/obj/structure/bed/ms13/wrench_act_secondary(mob/living/user, obj/item/weapon)
	return

//bed//

/obj/structure/bed/ms13/bedframe
	name = "base class Mojave Sun bedframe"
	desc = "Scream at the coders if you see this."
	buildstacktype = /obj/item/stack/sheet/ms13/scrap
	buildstackamount = 1
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_generic_3.wav'

/obj/structure/bed/ms13/bedframe/wire
	name = "wireframe bed"
	desc = "A bed with a wire backing."
	icon_state = "wire_bed"

/obj/structure/bed/ms13/bedframe/metal
	name = "metal bed"
	desc = "A slatted metal bed."
	icon_state = "metal_bed"

/obj/structure/bed/ms13/bedframe/cot
	name = "cot"
	desc = "A cot. Still usable without a mattress."
	icon_state = "cot"

/obj/structure/bed/ms13/bedframe/wood
	name = "wood bed"
	desc = "A panel bed made from wood."
	icon_state = "wood_bed"
	buildstacktype = /obj/item/stack/sheet/ms13/wood/scrap_wood
	buildstackamount = 1
	hitted_sound = 'mojave/sound/ms13effects/impact/wood/wood_generic_3.wav'

//mattress//

/obj/structure/bed/ms13/mattress
	name = "base class Mojave Sun mattress"
	desc = "Scream at the coders if you see this."
	buildstacktype = /obj/item/stack/sheet/ms13/cloth
	buildstackamount = 2

/obj/structure/bed/ms13/mattress/dirty
	name = "mattress"
	desc = "Less of a mattress and more of a lump."
	icon_state = "dirty_mattress"

/obj/structure/bed/ms13/mattress/old
	name = "mattress"
	desc = "Mildly stained and better than most."
	icon_state = "old_mattress"

/obj/structure/bed/ms13/mattress/stained
	name = "mattress"
	desc = "No idea what these stains are."
	icon_state = "stained_mattress"

/obj/structure/bed/ms13/mattress/yellowed
	name = "mattress"
	desc = "This was white when someone bought it."
	icon_state = "yellowed_mattress"

/obj/structure/bed/ms13/mattress/filthy
	name = "mattress"
	desc = "Is that mold?"
	icon_state = "filthy_mattress"

/obj/structure/bed/ms13/mattress/stale
	name = "mattress"
	desc = "Relatively clean."
	icon_state = "stale_mattress"

//sleeping bag//

/obj/structure/bed/ms13/sleepingbag
	name = "base class Mojave Sun sleeping bag"
	desc = "Scream at the coders if you see this."
	buildstacktype = /obj/item/stack/sheet/ms13/cloth
	buildstackamount = 2

/obj/structure/bed/ms13/sleepingbag/red
	name = "sleeping bag"
	desc = "A red sleeping bag. Don't have to worry about bloodstains."
	icon_state = "sleepingbag_red"

/obj/structure/bed/ms13/sleepingbag/green
	name = "sleeping bag"
	desc = "A green sleeping bag. Useful."
	icon_state = "sleepingbag_green"

//// Quirky beds ////

// Medical beds //

/obj/structure/bed/ms13/medical
	name = "medical bed"
	desc = "A stiff bed often found in medical locations. Useful for triage and further disabling your patients with back pain."
	icon_state = "bed_medical"
	density = TRUE // tallboi
	buildstacktype = /obj/item/stack/sheet/ms13/scrap
	buildstackamount = 1
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_generic_2.wav'

/obj/structure/bed/ms13/medical/post_buckle_mob(mob/living/M)
	M.pixel_y = M.base_pixel_y

/obj/structure/bed/ms13/medical/post_unbuckle_mob(mob/living/M)
	M.pixel_y = M.base_pixel_y + M.body_position_pixel_y_offset

/obj/structure/bed/ms13/medical/surgery
	name = "surgery bed"
	desc = "More of a platform than a bed, this is an excellent boost to efficiency on operation. Practically required- At least it used to be."
	icon_state = "bed_surgery"

// Roller bed //

/obj/structure/bed/roller/ms13
	name = "roller bed"
	icon = 'mojave/icons/structure/beds.dmi'
	icon_state = "rollingbed_down"
	buildstacktype = /obj/item/stack/sheet/ms13/scrap
	buildstackamount = 1
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_generic_2.wav'

/obj/structure/bed/roller/ms13/post_buckle_mob(mob/living/M)
	set_density(TRUE)
	icon_state = "rollingbed_up"
	//Push them up from the normal lying position
	M.pixel_y = M.base_pixel_y

/obj/structure/bed/roller/ms13/post_unbuckle_mob(mob/living/M)
	set_density(FALSE)
	icon_state = "rollingbed_down"
	//Set them back down to the normal lying position
	M.pixel_y = M.base_pixel_y + M.body_position_pixel_y_offset

/obj/structure/bed/roller/ms13/MouseDrop(over_object, src_location, over_location)
	return
