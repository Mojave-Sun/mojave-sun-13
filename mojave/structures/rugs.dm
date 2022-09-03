//The physical rugs//

/obj/structure/ms13/rug
	name = "rug"
	desc = "A common rug, used to cover your boring floor. Transporting these has been the bane of humanity for years, now."
	icon = 'mojave/icons/structure/64x64_rugs.dmi'
	icon_state = "rug_blue"
	flags_1 = FLAMMABLE
	anchored = TRUE
	layer = LOW_OBJ_LAYER
	bound_height = 64
	bound_width = 64
	layer = BELOW_OPEN_DOOR_LAYER
	obj_flags = NONE // No hitting these anymore
	var/item_rug = /obj/item/ms13/rug
	var/rolltime = 15 SECONDS
	var/has_alt_states = FALSE // Currenlty just rubber rugs. Could be more in the future. dunno.
	var/alternate_states
	var/list/remarks = list(
	"Why won't it stay straight..?",
	"Come on you piece of...",
	"Come on already, It's just a rug!",
	"This really shouldn't be hard, it's not that heavy!",
	"This is incredibly dumb. Just- Gah!",
	"I'd have an easier time trying to shave the damn hair off a brahmin's udders!",
	"Wrangling a ghoul is easier than this bullsh...",
	"So many other things i'd rather be doing...",
	"Keep flopping and I'll use you as fuel!",
	"This is hardly worth it...") //Time to get mad.

/obj/structure/ms13/rug/Initialize()
	. = ..()
	if(has_alt_states)
		if(prob(85))
			icon_state = "[icon_state]_[rand(1,(alternate_states))]"

/obj/structure/ms13/rug/MouseDrop(mob/user)
	. = ..()
	if(get_dist(src, user)<2)
		to_chat(usr, "<span class='warning'>[pick(remarks)]</span>")
		if(do_after(user, (rolltime), target = src))
			usr.visible_message("<span class='notice'>[usr] rolls and grabs \the [src.name].</span>", "<span class='notice'>You grab \the [src.name].</span>")
			var/obj/item/C = new item_rug(loc)
			usr.put_in_hands(C)
			qdel(src)

/obj/structure/ms13/rug/fancy
	desc = "A common rug, used to cover your boring floor. It's got a nice and simple pattern on it, perfect for the living room."
	icon_state = "rug_fancy"
	item_rug = /obj/item/ms13/rug/fancy

/obj/structure/ms13/rug/yellow
	desc = "A common rug, used to cover your boring floor. It's got a semi-complex pattern on it, very appeasing to the eyes!"
	icon_state = "rug_yellow"
	item_rug = /obj/item/ms13/rug/yellow

/obj/structure/ms13/rug/red
	desc = "A common rug, used to cover your boring floor. It's got a red circle pattern on it. Bubbly!"
	icon_state = "rug_red"
	item_rug = /obj/item/ms13/rug/red

/obj/structure/ms13/rug/rubber
	name = "rubber mat"
	desc = "A large rubber mat, usually used in industrial areas to keep traction in slick conditions."
	icon_state = "rug_rubber"
	item_rug = /obj/item/ms13/rug/rubber
	rolltime = 20 SECONDS
	remarks = list(
	"You'd have been better off as a damn tire.",
	"Just- Roll already!",
	"Come on... Come ON!",
	"Please just roll up...",
	"Uuuuughhh...",
	"For the love of...",
	"Do I even want this thing anymore..?")

/obj/structure/ms13/rug/mat
	name = "door mat"
	desc = "A small door mat, it's got nothing on it, but it's still good for wiping your feet off before entering."
	icon = 'mojave/icons/structure/32x32_rugs.dmi'
	icon_state = "mat_blank"
	item_rug = /obj/item/ms13/rug/mat
	rolltime = 5 SECONDS
	remarks = null

/obj/structure/ms13/rug/mat/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/simple_rotation)

/obj/structure/ms13/rug/mat/welcome
	name = "door mat"
	desc = "A small door mat, it's got the word WELCOME across it for the complete cozy home experience."
	icon_state = "mat_welcome"
	item_rug = /obj/item/ms13/rug/mat/welcome

/obj/structure/ms13/rug/mat/vulgar
	name = "door mat"
	desc = "You shouldn't be seeing this mat."
	icon = 'mojave/icons/structure/32x32_rugs.dmi'

/obj/structure/ms13/rug/mat/vulgar/getfucked
	desc = "A small door mat, it's got the words GET FUCKED sprayed across it by what looks to be blood."
	icon_state = "mat_vulgar"
	item_rug = /obj/item/ms13/rug/mat/vulgar/getfucked

/obj/structure/ms13/rug/mat/vulgar/fuckoff
	desc = "A small door mat, it's got the words FUCK OFF!! across it, looks like someone doesn't want visitors."
	icon_state = "mat_vulgar_2"
	item_rug = /obj/item/ms13/rug/mat/vulgar/fuckoff

/obj/structure/ms13/rug/mat/vulgar/shittown
	desc = "A small door mat, it's got the words SHIT TOWN across it, someone doesn't like this town."
	icon_state = "mat_town"
	item_rug = /obj/item/ms13/rug/mat/vulgar/shittown

/obj/structure/ms13/rug/mat/vulgar/ncrsucks
	desc = "A small door mat, it's got the words NCR SUCKS across it, the average raider probably wrote this."
	icon_state = "mat_ncr"
	item_rug = /obj/item/ms13/rug/mat/vulgar/ncrsucks

/obj/structure/ms13/rug/mat/vulgar/bosblows
	desc = "A small door mat, it's got the words BOS BLOWS across it, probably means the Brotherhood stole another energy gun from someone."
	icon_state = "mat_bos"
	item_rug = /obj/item/ms13/rug/mat/vulgar/bosblows

/obj/structure/ms13/rug/mat/rubber
	name = "rubber mats"
	desc = "A small assortment of rubber mats. Good for keeping traction in slippery areas."
	icon_state = "rubber"
	item_rug = /obj/item/ms13/rug/mat/rubber
	rolltime = 2 SECONDS // Multiple, easy to stack. :)
	has_alt_states = TRUE
	alternate_states = 11
	remarks = list(
	"Come to Papa.",
	"Rubbery, indeed.",
	"C'mere, you.",
	"These would look nice in...",
	"Yep...",
	"They don't make them like they used to.")

/obj/structure/ms13/rug/mat/rubber/ComponentInitialize()
	return

/obj/structure/ms13/rug/mat/rubber/single
	name = "rubber mat"
	desc = "A medium sized rubber mat. Good traction, good looks."
	icon_state = "rubber_single"
	item_rug = /obj/item/ms13/rug/mat/rubber/single
	rolltime = 8 SECONDS
	has_alt_states = FALSE
	remarks = list(
	"Won't you just fold already?",
	"If you would kindly...",
	"Come on, prick. Just...",
	"Mmmmmhmmm...",
	"There's gotta be a better way.")

//The object versions, used for transport of the rug itself//

/obj/item/ms13/rug
	name = "rug"
	desc = "A common rug, used to cover your boring floor. It's currently rolled up, but peeking through you can see it's blue."
	icon = 'mojave/icons/objects/clutter/clutter_world.dmi'
	lefthand_file = 'mojave/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'mojave/icons/mob/inhands/items_righthand.dmi'
	icon_state = "rug"
	inhand_icon_state = "rug"
	throw_range = 2
	w_class = WEIGHT_CLASS_BULKY
	var/obj/structure/ms13/rug/origin_type = /obj/structure/ms13/rug

/obj/item/ms13/rug/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/clutter/clutter_inventory.dmi')

/obj/item/ms13/rug/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands=TRUE)

/obj/item/ms13/rug/attack_self(mob/user)
	var/turf/T = get_turf(loc)
	if(!isfloorturf(T))
		to_chat(user, "<span class='warning'>You need ground to plant this on!</span>")
		return

	user.visible_message("<span class='notice'>[user] lays down \the [src.name].</span>", "<span class='notice'>You lay down \the [name].</span>")
	var/obj/structure/ms13/rug/C = new origin_type(get_turf(loc))
	C.setDir(dir)
	qdel(src)

/obj/item/ms13/rug/fancy
	desc = "A common rug, used to cover your boring floor. It's currently rolled up, but peeking through you can see it's got a pattern on it."
	origin_type = /obj/structure/ms13/rug/fancy

/obj/item/ms13/rug/yellow
	desc = "A common rug, used to cover your boring floor. It's currently rolled up, but peeking through you can see it's got a yellow pattern on it."
	origin_type = /obj/structure/ms13/rug/yellow

/obj/item/ms13/rug/red
	desc = "A common rug, used to cover your boring floor. It's currently rolled up, but peeking through you can see it's got a red pattern on it."
	origin_type = /obj/structure/ms13/rug/red

/obj/item/ms13/rug/rubber
	name = "rubber mat"
	desc = "A large rubber mat, usually used in industrial areas to keep traction in slick conditions. Rolled and ready to transport."
	icon_state = "rug_rubber"
	inhand_icon_state = "rug_rubber"
	origin_type = /obj/structure/ms13/rug/rubber

/obj/item/ms13/rug/mat
	name = "door mat"
	desc = "A small door mat, It's rolled and ready for transport."
	icon_state = "rug"
	inhand_icon_state = "mat"
	throw_range = 6
	origin_type = /obj/structure/ms13/rug/mat
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ms13/rug/mat/ComponentInitialize()
	return

/obj/item/ms13/rug/mat/welcome
	origin_type = /obj/structure/ms13/rug/mat/welcome

/obj/item/ms13/rug/mat/vulgar/getfucked
	desc = "A small door mat, It's rolled and ready for transport. Red markings are visible."
	origin_type = /obj/structure/ms13/rug/mat/vulgar/getfucked

/obj/item/ms13/rug/mat/vulgar/fuckoff
	desc = "A small door mat, It's rolled and ready for transport. Red markings are visible."
	origin_type = /obj/structure/ms13/rug/mat/vulgar/fuckoff

/obj/item/ms13/rug/mat/vulgar/shittown
	desc = "A small door mat, It's rolled and ready for transport. Red markings are visible."
	origin_type = /obj/structure/ms13/rug/mat/vulgar/shittown

/obj/item/ms13/rug/mat/vulgar/ncrsucks
	desc = "A small door mat, It's rolled and ready for transport. Red markings are visible."
	origin_type = /obj/structure/ms13/rug/mat/vulgar/ncrsucks

/obj/item/ms13/rug/mat/vulgar/bosblows
	desc = "A small door mat, It's rolled and ready for transport. Red markings are visible."
	origin_type = /obj/structure/ms13/rug/mat/vulgar/bosblows

/obj/item/ms13/rug/mat/rubber
	name = "rubber mats"
	desc = "A small assortment of rubber mats. Good for keeping traction in slippery areas. Stacked and ready to pack."
	icon_state = "rug_rubber"
	inhand_icon_state = "mat"
	origin_type = /obj/structure/ms13/rug/mat/rubber

/obj/item/ms13/rug/mat/rubber/single
	name = "rubber mat"
	desc = "A medium sized rubber mat. Good traction, good looks. Ready to go."
	origin_type = /obj/structure/ms13/rug/mat/rubber/single
