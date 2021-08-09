// Metal Smoothing Tables //

/obj/structure/table/ms13
	name = "base class Mojave Sun table"
	desc = "Scream at the coders if you see this."
	buildstack = null
	custom_materials = null
	frame = null

/obj/structure/table/ms13/deconstruction_hints(mob/user)
	return

/obj/structure/table/ms13/metal
	name = "metal table"
	desc = "A square piece of metal standing on four metal legs. It can not move."
	icon = 'mojave/icons/structure/smooth_structures/tables/table_metal.dmi'
	icon_state = "table-0"
	base_icon_state = "table"
	max_integrity = 150
	smoothing_groups = list(SMOOTH_GROUP_MS13_TABLE_METAL) //Don't smooth with SMOOTH_GROUP_TABLES
	canSmoothWith = list(SMOOTH_GROUP_MS13_TABLE_METAL)
	armor = list(MELEE = 20, BULLET = 40, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 80, ACID = 70)

/obj/structure/table/ms13/metal/alt
	desc = "A rounded piece of metal standing on a set of metal legs. It can not move."
	icon = 'mojave/icons/structure/smooth_structures/tables/table_metal_alt.dmi'

/obj/structure/table/ms13/metal/grate
	desc = "A grated metal table, like a normal table but can't hold small stuff! Super industrial-y"
	icon = 'mojave/icons/structure/smooth_structures/tables/table_metal_grate.dmi'
	max_integrity = 125

/obj/structure/table/ms13/metal/small
	desc = "A small, low down metal table. God only knows why these were sought out after in the old days."
	icon = 'mojave/icons/structure/smooth_structures/tables/table_metal_small.dmi'
	smoothing_groups = list(SMOOTH_GROUP_MS13_TABLE_SMALL)
	canSmoothWith = list(SMOOTH_GROUP_MS13_TABLE_SMALL)

/obj/structure/table/ms13/metal/heavy
	name = "heavy-duty metal table"
	desc = "A heavy duty metal table, held together by strong rivets and expert engineering, built to hold up to the heaviest of tools."
	icon = 'mojave/icons/structure/smooth_structures/tables/table_metal_heavy.dmi'
	max_integrity = 250
	integrity_failure = 0.25
	armor = list(MELEE = 40, BULLET = 60, LASER = 40, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 80, ACID = 70)

// Wooden Smoothing Tables //

/obj/structure/table/ms13/wood
	name = "wood table"
	desc = "A simple wooden table. Good for propping your feet up on dramatically."
	icon = 'mojave/icons/structure/smooth_structures/tables/table_wood.dmi'
	icon_state = "table-0"
	base_icon_state = "table"
	max_integrity = 100
	smoothing_groups = list(SMOOTH_GROUP_MS13_TABLE_WOOD)
	canSmoothWith = list(SMOOTH_GROUP_MS13_TABLE_WOOD)
	armor = list(MELEE = 10, BULLET = 15, LASER = 15, ENERGY = 25, BOMB = 10, BIO = 0, RAD = 0, FIRE = 10, ACID = 10)

/obj/structure/table/ms13/wood/bar
	desc = "A somewhat fancy table used at restauraunts of the past. Featuring a simplistic anchored leg design, wow!"
	icon = 'mojave/icons/structure/smooth_structures/tables/table_wood_bar.dmi'
	max_integrity = 125

// Table Frames //

/obj/structure/table_frame/ms13
	desc = "Four metal legs with four framing rods for a table."
	icon = 'mojave/icons/structure/standalone_tables.dmi'
	icon_state = "tableframe_metal"
	density = TRUE
	anchored = FALSE
	max_integrity = 20

/obj/structure/table_frame/ms13/wood
	desc = "Four wooden legs with four framing wooden rods for a wooden table. You could easily pass through this."
	icon_state = "tableframe_wood"
	resistance_flags = FLAMMABLE

// Player-Made tables //

/obj/structure/table/ms13/metal/constructed
	name = "metal table"
	desc = "A decently made table made of metal sheets. Should be able to last a while."
	icon = 'mojave/icons/structure/smooth_structures/tables/table_metal_built.dmi'
	max_integrity = 125
	smoothing_groups = list(SMOOTH_GROUP_MS13_TABLE_PLAYER) //Don't smooth with SMOOTH_GROUP_TABLES
	canSmoothWith = list(SMOOTH_GROUP_MS13_TABLE_PLAYER)
	armor = list(MELEE = 30, BULLET = 35, LASER = 35, ENERGY = 35, BOMB = 50, BIO = 0, RAD = 0, FIRE = 80, ACID = 70)
	frame = /obj/structure/table_frame/ms13

/obj/structure/table/ms13/metal/constructed/cobbled
	desc = "To include the word 'table' in the description of this thing is... Generous. Let's hope someone didn't give this their all. Hardly can hold stuff without it falling through it."
	icon = 'mojave/icons/structure/smooth_structures/tables/table_metal_built_LQ.dmi'
	max_integrity = 95
	smoothing_groups = list(SMOOTH_GROUP_MS13_TABLE_PLAYER) //Don't smooth with SMOOTH_GROUP_TABLES
	canSmoothWith = list(SMOOTH_GROUP_MS13_TABLE_PLAYER)
	armor = list(MELEE = 15, BULLET = 20, LASER = 15, ENERGY = 15, BOMB = 25, BIO = 0, RAD = 0, FIRE = 80, ACID = 60)
//	buildstack = /obj/item/stack/sheet/ms13/scrap re-add later

/obj/structure/table/ms13/wood/constructed
	name = "wood table"
	desc = "A table of mediocre build quality. At least it won't fall apart if you set something on it."
	icon = 'mojave/icons/structure/smooth_structures/tables/table_wood_built.dmi'
	max_integrity = 85
	smoothing_groups = list(SMOOTH_GROUP_MS13_TABLE_PLAYER)
	canSmoothWith = list(SMOOTH_GROUP_MS13_TABLE_PLAYER)
	armor = list(MELEE = 15, BULLET = 15, LASER = 10, ENERGY = 10, BOMB = 10, BIO = 0, RAD = 0, FIRE = 30, ACID = 30)
	frame = /obj/structure/table_frame/ms13/wood

/obj/structure/table/ms13/wood/constructed/cobbled
	desc = "A wood table of extreme low quality. Can hardly stand up to the wind. Perhaps they should try something else."
	icon = 'mojave/icons/structure/smooth_structures/tables/table_wood_built_LQ.dmi'
	max_integrity = 65
	armor = list(MELEE = 5, BULLET = 5, LASER = 10, ENERGY = 10, BOMB = 5, BIO = 0, RAD = 0, FIRE = 20, ACID = 20)

// Metal Non-Smoothing tables //

/obj/structure/table/ms13/no_smooth
	name = "non-smoothing wasteland table"
	desc = "Much like a regular table, except it doesn't smooth. Revolutionary, I know."
	icon = 'mojave/icons/structure/standalone_tables.dmi'
	smoothing_flags = NONE
	canSmoothWith = null

/obj/structure/table/ms13/no_smooth/metal
	name = "metal table"
	desc = "A table, masterfully designed with high-tech to become... round."
	icon_state = "table_metal_round"

/obj/structure/table/ms13/no_smooth/metal/Initialize(mapload)
	. = ..()
	if(prob(35))
		icon_state = "(initial[icon_state]-[rand(1,2)]"

// Large tables //

/obj/structure/table/ms13/no_smooth/large
	name = "base class large ms13 table"
	desc = "CALL A CODER, CALL A CODER. For ME!"
	icon = 'mojave/icons/structure/64x64_large_furniture.dmi'

/obj/structure/table/ms13/no_smooth/large/Initialize(mapload)
	. = ..()
	if(dir == NORTH)
		bound_width = 64

	if(dir == EAST)
		bound_height = 64

	if(dir == SOUTH)
		bound_width = 64

	if(dir == WEST)
		bound_height = 64

// Metal Large tables /

/obj/structure/table/ms13/no_smooth/large/metal
	name = "metal table"
	desc = "A solid, wide metal table. Nothing about it stands out in particular."
	icon_state = "table_metal_wide"
	max_integrity = 350
	armor = list(MELEE = 20, BULLET = 40, LASER = 30, ENERGY = 30, BOMB = 50, BIO = 0, RAD = 0, FIRE = 80, ACID = 70)

/obj/structure/table/ms13/no_smooth/large/metal/desk
	name = "metal desk"
	desc = "A solid, wide metal table. Nothing about it stands out in particular."
	icon_state = "desk_metal"

/obj/structure/table/ms13/no_smooth/large/metal/desk/alt
	name = "metal desk"
	desc = "A compact metal desk, used by a wide variety of individuals before the war, once upon a time."
	icon_state = "desk_metal_small"

// Wood Non-Smoothing tables //

/obj/structure/table/ms13/no_smooth/wood
	name = "wood table"
	desc = "A simple round wooden table. You wish you could make something this nice."
	icon_state = "table_wood_round"

/obj/structure/table/ms13/no_smooth/wood/square
	name = "wood table"
	desc = "A simple squared wooden table. You wish you could make something this nice."
	icon_state = "table_wood_square"

/obj/structure/table/ms13/no_smooth/wood/low
	name = "coffee table"
	desc = "A table that is relatively low to the ground, designed to prop things up on while you sit on your sofa."
	icon_state = "table_wood_low"

/obj/structure/table/ms13/no_smooth/wood/stand
	name = "bed stand"
	desc = "A tall table that is often found beside beds. This one is wood with a basic finish on it. Minimal mold on the inside, impressive!"
	icon_state = "table_wood_stand"

/obj/structure/table/ms13/no_smooth/wood/end
	name = "console end"
	desc = "A separate optional add-on for your Vault-Tec console. More storage for books you never read!"
	icon_state = "table_wood_end"

// Wood Large tables //

/obj/structure/table/ms13/no_smooth/large/wood
	name = "wood table"
	desc = "A large oval shaped wood table. Perfect for displaying the 200 year old family photos you found."
	icon_state = "table_wood_wide_oval"
	max_integrity = 200
	armor = list(MELEE = 10, BULLET = 15, LASER = 15, ENERGY = 25, BOMB = 10, BIO = 0, RAD = 0, FIRE = 0, ACID = 10)

/obj/structure/table/ms13/no_smooth/large/wood/square
	desc = "A large rectangular wood table. Very sturdy."
	icon_state = "table_wood_wide_square"

/obj/structure/table/ms13/no_smooth/large/wood/desk
	name = "wood desk"
	desc = "A full size wood desk, used by the pre-war soul lackers of the working world that once was."
	icon_state = "desk_wood"

/obj/structure/table/ms13/no_smooth/large/wood/desk/alt
	name = "wood desk"
	desc = "A compact wood desk, used by a wide variety of individuals before the war, once upon a time."
	icon_state = "desk_wood_small"

/obj/structure/table/ms13/no_smooth/large/wood/stand
	name = "wood console"
	desc = "A smooth Vault-Tec branded console, designed specifically in mind for your brand new Radiation King! But those days are now over. Mostly just looks good in a room."
	icon_state = "stand_wood"

/obj/structure/table/ms13/no_smooth/large/wood/stand/alt
	icon_state = "stand_wood_small"

//Misc tables //

/obj/structure/table/ms13/no_smooth/dice
	name = "dice table"
	desc = "Shoot the dice with your friends. Preferably not literally."
	icon_state = "dice_dirty"

/obj/structure/table/ms13/no_smooth/dice/pristine
	icon_state = "dice_clean"

/obj/structure/table/ms13/no_smooth/workbench
	name = "workbench"
	desc = "A perfect surface for arts and crafts. It's got so much space for activities!"
	icon_state = "workbench_wood"

// Misc Large tables //

/obj/structure/table/ms13/no_smooth/large/pool
	name = "pool table"
	desc = "A favourite of students and drunkards alike. Watch out for sharks!"
	icon_state = "table_pool"

/obj/structure/table/ms13/no_smooth/large/cards
	name = "cards table"
	desc = "Very classy. Reminds you of that time in New Reno..."
	icon_state = "table_cards"
