// actual crates //

/obj/structure/closet/crate/ms13
	name = "wasteland crate"
	desc = "Holds wastelands, presumably."
	icon = 'mojave/icons/structure/crates.dmi'

/obj/structure/closet/crate/ms13/woodcrate
	name = "\improper wooden crate"
	desc = "A woode storage crate, robust and study to all except a crowbar."
	icon_state = "wood_crate"
	density = TRUE
	anchored = TRUE
	material_drop = /obj/item/stack/sheet/mineral/wood
	material_drop_amount = 4
	delivery_icon = "deliverybox"
	integrity_failure = 0 //Makes the crate break when integrity reaches 0, instead of opening and becoming an invisible sprite.
	open_sound = 'sound/machines/wooden_closet_open.ogg'
	close_sound = 'sound/machines/wooden_closet_close.ogg'
	open_sound_volume = 25
	close_sound_volume = 50
	max_integrity = 500
	armor = list(MELEE = 50, BULLET = 10, LASER = 10, ENERGY = 0, BOMB = 10, BIO = 0, RAD = 0, FIRE = 70, ACID = 60)
	var/breakable = TRUE
	var/prying = FALSE

/obj/structure/closet/crate/ms13/woodcrate/uncrowbarrable
	breakable = FALSE

/obj/structure/closet/crate/ms13/woodcrate/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/closet/crate/ms13/woodcrate/attack_hand(mob/user)
	add_fingerprint(user)
	if(manifest)
		tear_manifest(user)

/obj/structure/closet/crate/ms13/woodcrate/proc/deconstruction_hints(mob/user)
	return "<span class='notice'>The [src] is tightly sealed, but you could use a <b>crowbar<b> to <b>open</b> it.</span>"

/obj/structure/closet/crate/ms13/woodcrate/attackby(obj/item/W, mob/living/user, params)
	if(W.tool_behaviour == TOOL_CROWBAR && breakable)
		if(manifest)
			tear_manifest(user)
		if(!prying)
			var/time_to_open = 11 SECONDS
			user.visible_message("<span class='notice'>[user] starts to break \the [src] open.</span>", \
					"<span class='notice'>You start to break \the [src] open.</span>", \
					"<span class='hear'>You hear splitting wood.</span>")
			playsound(src.loc, 'mojave/sound/ms13effects/wood_deconstruction.ogg', 50, TRUE)
			prying = TRUE
			if(do_after(user, time_to_open, target = src))
				user.visible_message("<span class='notice'>[user] pries \the [src] open.</span>", \
					"<span class='notice'>You pry open \the [src].</span>", \
					"<span class='hear'>You hear splitting wood.</span>")

				var/turf/T = get_turf(src)
				for(var/i in 1 to material_drop_amount)
					new material_drop(src)
				for(var/atom/movable/AM in contents)
					AM.forceMove(T)

				qdel(src)
				prying = FALSE
				return ..()
			prying = FALSE
			return
	else
		if(!user.combat_mode && W.tool_behaviour == TOOL_CROWBAR)
			return FALSE
	. = ..()

// classic crates //

/obj/structure/closet/crate/ms13/vault_tec
	name = "\improper Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life. Looks like it didn't handle life outside too well."
	icon_state = "vault_standard"

/obj/structure/closet/crate/ms13/vault_tec/pristine
	name = "\improper Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life."
	icon_state = "vault_standard_clean"

/obj/structure/closet/crate/ms13/vault_tec/compact
	name = "compact Vault-Tec crate"
	desc = "A crate designed for the rigours of vault life. This one is fun-sized. Looks like it didn't handle life outside too well."
	icon_state = "vault_compact"

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

/obj/structure/closet/crate/ms13/enclave
	name = "high-tech crate"
	desc = "Stores items, in style!"
	icon_state = "enclave"

/obj/structure/closet/crate/ms13/cash_register
	name = "cash register"
	desc = "A busted up old cash register. It's almost as worthless as the cash inside it."
	icon_state = "register"
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/closet/crate/ms13/cash_register/prewar
	name = "pristine cash register"
	desc = "A beautiful example of a cash register, seemingly untouched by the war. Shame the same can't be said about the economy."
	icon_state = "register_clean"

/obj/structure/closet/crate/ms13/army
	name = "army crate"
	desc = "A crate used for transporting or storing goods. This one has army star drawn on it."
	icon_state = "army"

/obj/structure/closet/crate/ms13/aluminum
	name = "aluminum crate"
	desc = "A crate used for transporting or storing goods. This one is made of aluminum."
	icon_state = "aluminum"

/obj/structure/closet/crate/ms13/red
	name = "red crate"
	desc = "A crate used for transporting or storing goods. This one is colored red."
	icon_state = "red"

/obj/structure/closet/crate/ms13/vault
	name = "vault crate"
	desc = "A crate used for transporting or storing goods. This one has vault logo on it."
	icon_state = "vault"
