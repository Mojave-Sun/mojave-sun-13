// actual crates //

/obj/structure/closet/crate/ms13
	name = "wasteland crate"
	desc = "Holds wastelands, presumably."
	icon = 'mojave/icons/structure/crates.dmi'
	drag_slowdown = 1
	max_integrity = 300
	anchored = TRUE
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_hollow_2.wav'

/obj/structure/closet/crate/ms13/verb_toggleopen()
	return

/obj/structure/closet/crate/ms13/woodcrate
	name = "\improper wooden crate"
	desc = "A wood storage crate, robust and study to all except a crowbar."
	icon_state = "wood_crate"
	density = TRUE
	anchored = TRUE
	material_drop = /obj/item/stack/sheet/ms13/wood/scrap_wood
	material_drop_amount = 2
	delivery_icon = "deliverybox"
	integrity_failure = 0 //Makes the crate break when integrity reaches 0, instead of opening and becoming an invisible sprite.
	open_sound = 'sound/machines/wooden_closet_open.ogg'
	close_sound = 'sound/machines/wooden_closet_close.ogg'
	hitted_sound = 'mojave/sound/ms13effects/impact/wood/wood_generic_1.wav'
	open_sound_volume = 25
	close_sound_volume = 50
	max_integrity = 500
	projectile_passchance = 45
	var/breakable = TRUE
	var/prying = FALSE
	var/altstates = 0

/obj/structure/closet/crate/ms13/woodcrate/Initialize(mapload)
	. = ..()
	register_context()
	if(!altstates)
		return

	if(prob(35))
		icon_state = "[initial(icon_state)]-[rand(1,(altstates))]"

/obj/structure/closet/crate/ms13/woodcrate/uncrowbarrable
	breakable = FALSE

/obj/structure/closet/crate/ms13/woodcrate/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/closet/crate/ms13/woodcrate/proc/deconstruction_hints(mob/user)
	return span_notice("The [src] is tightly sealed, but you could use a <b>crowbar</b> or similar prying tool to <b>open</b> it.")

/obj/structure/closet/crate/ms13/woodcrate/attack_hand(mob/user)
	add_fingerprint(user)
	if(manifest)
		tear_manifest(user)

/obj/structure/closet/crate/ms13/woodcrate/crowbar_act_secondary(mob/living/user, obj/item/tool)
	if(flags_1&NODECONSTRUCT_1)
		return TRUE
	..()
	user.visible_message("<span class='notice'>[user] starts to break \the [src] open.</span>", \
		"<span class='notice'>You start to break \the [src] open.</span>", \
		"<span class='hear'>You hear splitting wood.</span>")
	tool.play_tool_sound(src)
	if(do_after(user, 10 SECONDS * tool.toolspeed, target = src, interaction_key = DOAFTER_SOURCE_DECON))
		playsound(src.loc, 'mojave/sound/ms13effects/wood_deconstruction.ogg', 50, TRUE)
		user.visible_message("<span class='notice'>[user] pries \the [src] open.</span>", \
			"<span class='notice'>You pry open \the [src].</span>", \
			"<span class='hear'>You hear splitting wood.</span>")
		deconstruct(disassembled = TRUE)
		return TRUE

/obj/structure/closet/crate/ms13/woodcrate/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(disassembled)
			new /obj/item/stack/sheet/ms13/wood/plank(loc, 2)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc, 2)
		else
			new /obj/item/stack/sheet/ms13/wood/scrap_wood(loc)
			new /obj/item/stack/sheet/ms13/scrap_parts(loc)
	var/turf/T = get_turf(src)
	for(var/atom/movable/AM in contents)
		AM.forceMove(T)
	qdel(src)

/obj/structure/closet/crate/ms13/woodcrate/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_CROWBAR)
			context[SCREENTIP_CONTEXT_RMB] = "Open"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/closet/crate/ms13/woodcrate/compact
	icon_state = "plain_crate"
	anchored = FALSE //smaller bois
	max_integrity = 400
	altstates = 3
	projectile_passchance = 70

/obj/structure/closet/crate/ms13/woodcrate/compact/boom
	icon_state = "3X_crate"
	altstates = 0

/obj/structure/closet/crate/ms13/woodcrate/compact/sarsaparilla
	icon_state = "sarsaparilla_crate"
	altstates = 1

/obj/structure/closet/crate/ms13/woodcrate/compact/army
	icon_state = "army_crate"
	altstates = 2

// classic crates //

/obj/structure/closet/crate/ms13/vault_tec
	name = "\improper Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life. Looks like it didn't handle life outside too well."
	icon_state = "vault_standard"
	max_integrity = 400
	material_drop = /obj/item/stack/sheet/ms13/scrap
	material_drop_amount = 2
	projectile_passchance = 70
	hitted_sound = 'mojave/sound/ms13effects/impact/metal/metal_hollow_2.wav'

/obj/structure/closet/crate/ms13/vault_tec/pristine
	name = "\improper Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life."
	icon_state = "vault_standard_clean"

/obj/structure/closet/crate/ms13/vault_tec/compact
	name = "compact Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life. This one is fun-sized. Looks like it didn't handle life outside too well."
	icon_state = "vault_compact"
	projectile_passchance = 85

/obj/structure/closet/crate/ms13/vault_tec/compact/pristine
	name = "compact Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life. This one is fun-sized."
	icon_state = "vault_compact_clean"

/obj/structure/closet/crate/ms13/vault_tec/long
	name = "long Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life. This one is long, for extra storage. Looks like it didn't handle life outside too well."
	icon_state = "vault_long"

/obj/structure/closet/crate/ms13/vault_tec/long/pristine
	name = "long Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life. This one is long, for extra storage."
	icon_state = "vault_long_clean"

/obj/structure/closet/crate/ms13/vault_tec/big
	name = "big Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life. This one's got the Vault-Tec logo, in case you forgot who made it. Looks like it didn't handle life outside too well."
	icon_state = "vault_big"

/obj/structure/closet/crate/ms13/vault_tec/big/pristine
	name = "big Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life. This one's got the Vault-Tec logo, in case you forgot who made it."
	icon_state = "vault_big_clean"

/obj/structure/closet/crate/ms13/footlocker
	name = "wooden footlocker"
	desc = "The best way to store various supplies."
	icon_state = "footlocker_wood"
	material_drop = /obj/item/stack/sheet/ms13/wood/scrap_wood
	material_drop_amount = 2
	projectile_passchance = 90
	hitted_sound = 'mojave/sound/ms13effects/impact/wood/wood_generic_1.wav'

/obj/structure/closet/crate/ms13/enclave
	name = "high-tech crate"
	desc = "Stores items, in style!"
	icon_state = "enclave"
	material_drop = /obj/item/stack/sheet/ms13/scrap
	material_drop_amount = 2
	projectile_passchance = 85

/obj/structure/closet/crate/ms13/medical
	name = "medical locker"
	desc = "Useful for storing blood, organs, or just about whatever you could wish for. Has some handles and rollers under it for transporation, but is very bulky."
	icon_state = "medical"
	anchored = FALSE
	drag_slowdown = 1
	material_drop = /obj/item/stack/sheet/ms13/scrap
	material_drop_amount = 2
	projectile_passchance = 60

/obj/structure/closet/crate/ms13/cash_register
	name = "cash register"
	desc = "A busted up old cash register. It's almost as worthless as the cash inside it."
	icon_state = "register"
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	max_mob_size = MOB_SIZE_TINY
	mob_storage_capacity = 1
	material_drop = /obj/item/stack/sheet/ms13/scrap
	material_drop_amount = 2
	projectile_passchance = 50

/obj/structure/closet/crate/ms13/cash_register/prewar
	name = "pristine cash register"
	desc = "A beautiful example of a cash register, seemingly untouched by the war. Shame the same can't be said about the economy."
	icon_state = "register_clean"

/obj/structure/closet/crate/ms13/army
	name = "army crate"
	desc = "A crate used for transporting or storing goods. This one has army star drawn on it."
	icon_state = "army"
	material_drop = /obj/item/stack/sheet/ms13/scrap
	material_drop_amount = 2
	projectile_passchance = 85

/obj/structure/closet/crate/ms13/aluminum
	name = "aluminum crate"
	desc = "A crate used for transporting or storing goods. This one is made of aluminum."
	icon_state = "aluminum"
	material_drop = /obj/item/stack/sheet/ms13/scrap_alu
	material_drop_amount = 2
	projectile_passchance = 85

/obj/structure/closet/crate/ms13/red
	name = "red crate"
	desc = "A crate used for transporting or storing goods. This one is colored red."
	icon_state = "red"
	material_drop = /obj/item/stack/sheet/ms13/scrap
	material_drop_amount = 2
	projectile_passchance = 85

/obj/structure/closet/crate/ms13/vault
	name = "vault crate"
	desc = "A crate used for transporting or storing goods. This one has vault logo on it."
	icon_state = "vault"
	material_drop = /obj/item/stack/sheet/ms13/scrap
	material_drop_amount = 2
	projectile_passchance = 85
