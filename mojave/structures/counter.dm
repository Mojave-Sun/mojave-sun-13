/obj/structure/table/ms13/no_smooth/counter
	name = "non-smoothing counter"
	desc = "Much like a non-smoothing table, except its actually a counter. Revolutionary, I know."
	icon_state = "wood_counter_single"
	icon = 'mojave/icons/structure/counter.dmi'

// Metal Counters //

/obj/structure/table/ms13/no_smooth/counter/metal
	name = "metal counter"
	desc = "A sterile, culinary and professional metal counter with underneath storage, this one is in good condition." //add alt click open at some point maybe? (Yeah that'd be cool. WYCI.)
	icon_state = "metal_counter"
	max_integrity = 225
	frame = /obj/item/stack/sheet/ms13/scrap
	framestack = /obj/item/stack/sheet/ms13/scrap
	framestackamount = 2

/obj/structure/table/ms13/no_smooth/counter/metal/bend
	icon_state = "metal_counter_bend"

/obj/structure/table/ms13/no_smooth/counter/metal/intersect
	icon_state = "metal_counter_intersect"

/obj/structure/table/ms13/no_smooth/counter/metal/cross
	icon_state = "metal_counter_cross"

// Wood Counters //

/obj/structure/table/ms13/no_smooth/counter/wood
	name = "wooden counter"
	desc = "Not much can be said about this decrepit wooden counter except that its definitely seen better years."
	icon_state = "wood_counter"
	max_integrity = 150
	frame = /obj/item/stack/sheet/ms13/wood/scrap_wood
	framestack = /obj/item/stack/sheet/ms13/wood/scrap_wood
	framestackamount = 2

/obj/structure/table/ms13/no_smooth/counter/wood/bend
	icon_state = "wood_counter_bend"

/obj/structure/table/ms13/no_smooth/counter/wood/intersect
	icon_state = "wood_counter_intersect"

/obj/structure/table/ms13/no_smooth/counter/wood/cross
	icon_state = "wood_counter_cross"

// Constructed Counters //

/obj/structure/table/ms13/no_smooth/counter/wood/crafted
	name = "constructed wooden counter"
	desc = "A respectably made wooden counter. Definitely made locally after the war."
	icon_state = "craft_counter"

/obj/structure/table/ms13/no_smooth/counter/wood/crafted/bend
	icon_state = "craft_counter_bend"

/obj/structure/table/ms13/no_smooth/counter/wood/crafted/intersect
	icon_state = "craft_counter_intersect"

/obj/structure/table/ms13/no_smooth/counter/wood/crafted/cross
	icon_state = "craft_counter_cross"
