/obj/structure/ms13/ore_deposit
	name = "base ore deposit"
	desc = "Full of valuable errors to sell to coders!"
	icon = 'mojave/icons/structure/deposits.dmi'
	icon_state = ""
	density = FALSE
	anchored = TRUE
	resistance_flags = UNACIDABLE | FIRE_PROOF | LAVA_PROOF
	armor = list(MELEE = 20, BULLET = 90, LASER = 90, ENERGY = 90, BOMB = 0, BIO = 100, FIRE = 100, ACID = 100)
	hitted_sound = 'sound/effects/break_stone.ogg'
	var/deposit_type = null
	var/last_act = 0
	var/mining_bonus_damage = 0

//Ore deposit mining process

/obj/structure/ms13/ore_deposit/attackby(obj/item/W, mob/user)
	src.mining_bonus_damage = W.force * W.mining_mult
	W.force += mining_bonus_damage
	. = ..()
	W.force -= mining_bonus_damage
	if(W.mining_mult <= 0)
		to_chat(user, span_notice("You could probably use something better than a [W.name] for this."))
	if(W.mining_mult > 0)
		to_chat(user, span_notice("The [src.name] crumbles under your [W.name]!"))

/obj/structure/ms13/ore_deposit/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(!disassembled)
			new deposit_type(src.loc, rand(2,5))
	qdel(src)

//deposits

//randomises integrity for deposits

/obj/structure/ms13/ore_deposit/Initialize()
	. = ..()
	max_integrity = rand(380, 525)
	atom_integrity = max_integrity

/obj/structure/ms13/ore_deposit/copper
	name = "copper ore deposit"
	desc = "Full of copper ore, useful!"
	icon_state = "copper-deposit"
	deposit_type = /obj/item/stack/sheet/ms13/nugget/nugget_copper

/obj/structure/ms13/ore_deposit/lead
	name = "lead ore deposit"
	desc = "Full of lead ore, tasty!"
	icon_state = "lead-deposit"
	deposit_type = /obj/item/stack/sheet/ms13/nugget/nugget_lead

/obj/structure/ms13/ore_deposit/alu
	name = "aluminium ore deposit"
	desc = "Full of lead ore, lightweight!"
	icon_state = "aluminium-deposit"
	deposit_type = /obj/item/stack/sheet/ms13/nugget/nugget_alu

/obj/structure/ms13/ore_deposit/silver
	name = "silver ore desposit"
	desc = "Full of silver, shiny!"
	icon_state = "silver-deposit"
	deposit_type = /obj/item/stack/sheet/ms13/nugget/nugget_silver

/obj/structure/ms13/ore_deposit/gold
	name = "gold ore deposit"
	desc = "Full of gold, valuable!"
	icon_state = "gold-deposit"
	deposit_type = /obj/item/stack/sheet/ms13/nugget/nugget_gold

/obj/structure/ms13/ore_deposit/coal
	name = "coal deposit"
	desc = "Full of coal, flammable!"
	icon_state = "coal-deposit"
	deposit_type = /obj/item/stack/sheet/ms13/nugget/nugget_coal

/obj/structure/ms13/ore_deposit/uranium
	name = "uranium deposit"
	desc = "Full of uranium, warm!"
	icon_state = "uranium-deposit"
	deposit_type = /obj/item/stack/sheet/ms13/nugget/nugget_uranium

/obj/structure/ms13/ore_deposit/iron
	name = "iron deposit"
	desc = "Full of iron, tough!"
	icon_state = "iron-deposit"
	deposit_type = /obj/item/stack/sheet/ms13/nugget/nugget_iron

/obj/structure/ms13/ore_deposit/zinc
	name = "zinc deposit"
	desc = "Full of zinc, not silver!"
	icon_state = "brass-deposit"
	deposit_type = /obj/item/stack/sheet/ms13/nugget/nugget_zinc

//Nuggets

/obj/item/stack/sheet/ms13/nugget/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.45, 1)

/obj/item/stack/sheet/ms13/nugget/nugget_zinc
	name = "zinc nuggets"
	desc = "A hard lump of zinc, Useless now."
	singular_name = "zinc nugget"
	icon = 'mojave/icons/objects/crafting/materials_inventory.dmi'
	icon_state = "brass"
	merge_type = /obj/item/stack/sheet/ms13/nugget/nugget_zinc
	amount = 1
	max_amount = 16

/obj/item/stack/sheet/ms13/nugget/nugget_zinc/two
	amount = 2

/obj/item/stack/sheet/ms13/nugget/nugget_iron
	name = "iron ore nuggets"
	desc = "A hard lump of iron, Useless now."
	singular_name = "iron ore nugget"
	icon = 'mojave/icons/objects/crafting/materials_inventory.dmi'
	icon_state = "iron"
	merge_type = /obj/item/stack/sheet/ms13/nugget/nugget_iron
	amount = 1
	max_amount = 16

/obj/item/stack/sheet/ms13/nugget/nugget_iron/two
	amount = 2

/obj/item/stack/sheet/ms13/nugget/nugget_uranium
	name = "pitchblende nuggets"
	desc = "A hard lump of uranium, Useless now."
	singular_name = "pitchblende nugget"
	icon = 'mojave/icons/objects/crafting/materials_inventory.dmi'
	icon_state = "uranium"
	merge_type = /obj/item/stack/sheet/ms13/nugget/nugget_uranium
	amount = 1
	max_amount = 16

/obj/item/stack/sheet/ms13/nugget/nugget_uranium/two
	amount = 2

/obj/item/stack/sheet/ms13/nugget/nugget_coal
	name = "coal chunks"
	desc = "A hard lump of coal, careful with any flames."
	singular_name = "coal chunk"
	icon = 'mojave/icons/objects/crafting/materials_inventory.dmi'
	icon_state = "coal"
	merge_type = /obj/item/stack/sheet/ms13/nugget/nugget_coal
	amount = 1
	max_amount = 16

/obj/item/stack/sheet/ms13/nugget/nugget_coal/two
	amount = 2

/obj/item/stack/sheet/ms13/nugget/nugget_copper
	name = "copper ore nuggets"
	desc = "Full of potential copper. Useless now."
	singular_name = "copper ore nugget"
	icon = 'mojave/icons/objects/crafting/materials_inventory.dmi'
	icon_state = "copper"
	merge_type = /obj/item/stack/sheet/ms13/nugget/nugget_copper
	amount = 1
	max_amount = 16

/obj/item/stack/sheet/ms13/nugget/nugget_copper/two
	amount = 2

/obj/item/stack/sheet/ms13/nugget/nugget_lead
	name = "lead ore nuggets"
	desc = "Full of potential lead. Useless now."
	singular_name = "lead ore nugget"
	icon = 'mojave/icons/objects/crafting/materials_inventory.dmi'
	icon_state = "lead"
	merge_type = /obj/item/stack/sheet/ms13/nugget/nugget_lead
	amount = 1
	max_amount = 16

/obj/item/stack/sheet/ms13/nugget/nugget_lead/two
	amount = 2

/obj/item/stack/sheet/ms13/nugget/nugget_alu
	name = "aluminium ore nuggets"
	desc = "Full of potential aluminium. Useless now."
	singular_name = "aluminium ore nugget"
	icon = 'mojave/icons/objects/crafting/materials_inventory.dmi'
	icon_state = "aluminium"
	merge_type = /obj/item/stack/sheet/ms13/nugget/nugget_alu
	amount = 1
	max_amount = 16

/obj/item/stack/sheet/ms13/nugget/nugget_alu/two
	amount = 2

/obj/item/stack/sheet/ms13/nugget/nugget_silver
	name = "silver ore nuggets"
	desc = "Full of potential silver. Useless now."
	singular_name = "silver ore nugget"
	icon = 'mojave/icons/objects/crafting/materials_inventory.dmi'
	icon_state = "silver"
	merge_type = /obj/item/stack/sheet/ms13/nugget/nugget_silver
	amount = 1
	max_amount = 16

/obj/item/stack/sheet/ms13/nugget/nugget_silver/two
	amount = 2

/obj/item/stack/sheet/ms13/nugget/nugget_gold
	name = "gold ore nuggets"
	desc = "Full of potential gold. Useless now."
	singular_name = "gold ore nugget"
	icon = 'mojave/icons/objects/crafting/materials_inventory.dmi'
	icon_state = "gold"
	merge_type = /obj/item/stack/sheet/ms13/nugget/nugget_gold
	amount = 1
	max_amount = 16

/obj/item/stack/sheet/ms13/nugget/nugget_gold/two
	amount = 2

//Deposit generation

//currently not spawning in uranium deposits as there is no use for them
#define DEPOSIT_SPAWN_LIST list(/obj/structure/ms13/ore_deposit/gold = 1, /obj/structure/ms13/ore_deposit/silver = 3, /obj/structure/ms13/ore_deposit/alu = 4, /obj/structure/ms13/ore_deposit/lead = 5, /obj/structure/ms13/ore_deposit/copper = 5, /obj/structure/ms13/ore_deposit/coal = 4, /obj/structure/ms13/ore_deposit/iron = 4, /obj/structure/ms13/ore_deposit/zinc = 4) //The total sum of this right now is 30, so finding prob is X/30. If you change these numbers please update this comment.
#define DEPOSIT_SPAWN_CHANCE	2.5

/turf/open/floor/plating/ms13/ground/mountain/Initialize()
	. = ..()
	var/randDeposit = null
	//spontaneously spawn deposits
	if( (locate(/obj/machinery) in src) || (locate(/obj/structure) in src) ) //can't put ores on a tile that has already has stuff
		return
	if(prob(DEPOSIT_SPAWN_CHANCE))
		randDeposit = pick_weight(DEPOSIT_SPAWN_LIST) //Create a new deposit object at this location, and assign var
		new randDeposit(src)
		. = TRUE //in case we ever need this to return if we spawned
		return .

/turf/open/floor/plating/ms13/ground/mountain/drought/Initialize()
	. = ..()
	var/randDeposit = null
	if( (locate(/obj/machinery) in src) || (locate(/obj/structure) in src) )
		return
	if(prob(DEPOSIT_SPAWN_CHANCE))
		randDeposit = pick_weight(DEPOSIT_SPAWN_LIST)
		new randDeposit(src)
		. = TRUE
		return .
