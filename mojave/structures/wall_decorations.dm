/obj/structure/sign/poster/ms13
	name = "wasteland poster"
	desc = "Display your radioactive dust on your wall."
	icon = 'mojave/icons/objects/posters.dmi'
	pixel_y = 30

/obj/structure/sign/poster/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/wall_mount)

/obj/structure/sign/poster/ms13/ncr
	name = "NCR recruitment poster"
	desc = "A wall poster with an NCR soldier plastered across it. 'REPRESENT THE REPUBLIC' is in bold red letters from top to bottom."
	icon_state = "NCR_1"

/obj/structure/sign/poster/ms13/ncr_2
	name = "NCR recruitment poster"
	desc = "A colorful poster attempting to recuit YOU to the NCR. It is exclusively in red, white, and blue- as to remind you where you are, seemingly. There is a stylized blue NCR solder off to the side."
	icon_state = "NCR_2"

/obj/structure/sign/poster/ms13/tattered
	name = "tattered poster"
	desc = "An old and torn poster. It has a city horizon printed across it and says something about corporations. Whatever that has to do with anything."
	icon_state = "corporate"

/obj/structure/sign/poster/ms13/handgun
	name = "handgun advertisement poster"
	desc = "A dirty'd up advertisement poster. There appears to be a Colt 10mm handgun being sold to you. There is a very patriotic American soldier at the bottom of it."
	icon_state = "handgun"

/obj/structure/sign/poster/ms13/protect
	name = "RobCo protectron advertisement"
	desc = "This poster has a Protectron model on display, seemingly a police model from before the war. The words 'PROTECT AND SERVE' and plastered onto it."
	icon_state = "protectron"

/obj/structure/sign/poster/ms13/vaulttec
	name = "VaultTec poster"
	desc = "A very basic poster. It has the VaultTec logo on it, in their usual vibrant colors that have been slightly faded through the years."
	icon_state = "vaulttec"

/obj/structure/sign/poster/ms13/vacation
	name = "vacation poster"
	desc = "On this poster is a lovely island with a palm tree on it, with calm seas behind it. There is some scratched out text at the top that mentions 'vacations'."
	icon_state = "vacation"

/obj/structure/sign/poster/ms13/moon
	name = "moon poster"
	desc = "A dark poster, featuring a very familiar sky pie. How calming."
	icon_state = "moon"

/obj/structure/sign/poster/ms13/planet
	name = "planet poster"
	desc = "A poster with a planet in the center of it. It looks green- teeming with life."
	icon_state = "planet"

/obj/structure/sign/poster/ms13/pinup
	name = "pinup poster"
	desc = "A tall poster with an attractive woman on it. She appears to be in a party outfit and dancing."
	icon_state = "pinup_1"

/obj/structure/sign/poster/ms13/pinup_2
	name = "pinup poster"
	desc = "A poster with a woman on it. She has very unnatural and vibrant hair with a revealing outfit."
	icon_state = "pinup_2"

/obj/structure/sign/poster/ms13/pinup_3
	name = "pinup poster"
	desc = "A poster with a woman on it. She is wearing a very fluffy dress and is sitting down, staring at your soul."
	icon_state = "pinup_3"

// Flags //

/obj/structure/ms13/wall_decor
	name = "Base type MS13 decor"
	desc = "This shouldn't be on a wall, bro."
	icon = 'mojave/icons/structure/wall_decor.dmi'
	pixel_y = 32
	density = FALSE
	anchored = TRUE

/obj/structure/ms13/wall_decor/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(locate(/obj/structure/ms13/wall_decor) in get_turf(mover))
		return TRUE

/obj/structure/ms13/wall_decor/flag
	name = "flag"
	desc = "A faded flag depicting vertical stripes. In the top left corner there are 14 small stars, which form a corona around a larger star."
	icon_state = "flag_us"

/obj/structure/ms13/wall_decor/flag/Initialize()
	. = ..()
	register_context()

/obj/structure/ms13/wall_decor/flag/attackby(obj/item/I, mob/user, params)
	if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY))
		return

	if(I.tool_behaviour == TOOL_KNIFE)
		if(do_after(user, 10 SECONDS, target = src, interaction_key = DOAFTER_SOURCE_DECON))
			new /obj/item/stack/sheet/ms13/cloth(I.drop_location(), 5)
			user.visible_message(span_notice("[user] cuts [src] into pieces of cloth with [I]."), \
				span_notice("You cut [src] into pieces of cloth with [I]."), \
				span_hear("You hear cutting."))
			qdel(src)
	else
		return ..()

/obj/structure/ms13/wall_decor/flag/examine(mob/user)
	. = ..()
	. += deconstruction_hints(user)

/obj/structure/ms13/wall_decor/flag/proc/deconstruction_hints(mob/user)
	return span_notice("You could use a <b>knife</b> to cut up [src] for cloth.")

/obj/structure/ms13/wall_decor/flag/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	switch (held_item?.tool_behaviour)
		if (TOOL_KNIFE)
			context[SCREENTIP_CONTEXT_RMB] = "Tear up"
			return CONTEXTUAL_SCREENTIP_SET

/obj/structure/ms13/wall_decor/flag/china
	desc = "A red flag with five golden stars on it's side representing an old world superpower."
	icon_state = "flag_china"

/obj/structure/ms13/wall_decor/flag/california
	desc = "An old California flag. It has a Yao Guai on it, single head and all."
	icon_state = "flag_cali"

/obj/structure/ms13/wall_decor/flag/arizona
	desc = "A dried out Arizona flag. An iconic pattern, is it not?"
	icon_state = "flag_arizona"

/obj/structure/ms13/wall_decor/flag/enclave
	desc = "A flag of stripes, featuring an E surrounded by stars. It's make shows no wear, as if it were recently made."
	icon_state = "flag_enclave"

/obj/structure/ms13/wall_decor/flag/ncr
	desc = "A flag representing the New Californian Republic. Glory to the Republic."
	icon_state = "flag_ncr"

/obj/structure/ms13/wall_decor/flag/legion
	desc = "A flag representing the Caesar's Legion. Be wary."
	icon_state = "flag_legion"

/obj/structure/ms13/wall_decor/flag/rangers
	desc = "A flag representing the Desert Rangers. A beacon of hope and safety."
	icon_state = "flag_rangers"

/obj/structure/ms13/wall_decor/flag/bos
	desc = "A flag the Brotherhood of Steel. It is in the western chapter pattern."
	icon_state = "flag_westbos"

/obj/structure/ms13/wall_decor/clock
	name = "wall clock"
	desc = "A wall mounted clock. Frozen in time- this died long ago with the rest of the world."
	icon_state = "clock"

/obj/structure/ms13/wall_decor/clock/Initialize(mapload)
	. = ..()
	if(prob(25))
		dir = pick(GLOB.cardinals)

/obj/structure/ms13/wall_decor/cross
	name = "cross"
	desc = "A big wooden cross."
	icon_state = "cross"

/obj/structure/ms13/wall_decor/calendar
	name = "calendar"
	desc = "A calendar turned to October 2077, there's some random circled dates on here."
	icon_state = "calendar"
	max_integrity = 40

/obj/structure/ms13/wall_decor/calendar/blank
	name = "calendar"
	desc = "A calendar that doesn't have any particular year labeled on it. Makes more sense today than it did back then."
	icon_state = "calendar_blank"

/obj/structure/ms13/wall_decor/sign
	name = "notice sign"
	desc = "A sign with clear intentions. NOTICE... Notice what?"
	icon_state = "notice_sign"
	max_integrity = 100

/obj/structure/ms13/wall_decor/sign/danger
	name = "danger sign"
	desc = "DANGER. The text is apparent. But surely it's not relevant to you right now."
	icon_state = "danger_sign"


/obj/structure/ms13/wall_decor/exit
	name = "exit sign"
	desc = "An exit sign in red, pointing you to the exit of the building incase of an emergency."
	icon_state = "exit"

/obj/structure/ms13/wall_decor/wallscreen
	name = "wallscreens"
	desc = "Three monitors stuck to the wall, in-case you needed more monitors."
	icon_state = "wallscreen"

/// POSTERS ///
/obj/structure/ms13/wall_decor/poster
	name = "\improper NCR poster"
	desc = "A fantastic piece of propaganda straight from the Republic. Don't you feel stronger just looking at it?"
	icon_state = "NCR_sign"
	max_integrity = 30

/obj/structure/ms13/wall_decor/poster/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	user.visible_message(span_notice("[user] begins tearing apart [src]"), \
		span_notice("You tear begin to tear [src] into shreds."), \
		span_hear("You hear paper crinkling."))
	if(do_after(user, 1 SECONDS))
		user.visible_message(span_notice("[user] shreds [src] into pieces."), \
			span_notice("You tear [src] into shreds."), \
			span_hear("You hear paper tearing."))
		playsound(src.loc, 'sound/items/poster_ripped.ogg', 100, TRUE)
		qdel(src)

// NCR propaganad department mastercrafts //

/obj/structure/ms13/wall_decor/poster/enlist
	icon_state = "NCR_enlist"

/obj/structure/ms13/wall_decor/poster/wrench
	icon_state = "NCR_wrench"

/obj/structure/ms13/wall_decor/poster/looselip
	icon_state = "NCR_looselip"

/obj/structure/ms13/wall_decor/poster/you
	icon_state = "NCR_you"

/obj/structure/ms13/wall_decor/poster/espionage
	icon_state = "NCR_espionage"

/obj/structure/ms13/wall_decor/poster/bombs
	icon_state = "NCR_bombs"

// Misc posters //

/obj/structure/ms13/wall_decor/poster/fallout
	icon_state = "poster_fallout"

/obj/structure/ms13/wall_decor/poster/wecan
	icon_state = "poster_wecan"
/obj/structure/ms13/wall_decor/poster/wanted
	name = "wanted poster"
	desc = "A posted detailing that someone's end should be coming soon. Financial compensation to those reponsible."
	icon_state = "wanted_poster"
