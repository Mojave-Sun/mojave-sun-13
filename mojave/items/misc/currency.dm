/obj/item/stack/ms13

/obj/item/stack/ms13/currency
	name = "Base type MS13 monetary representative object"
	desc = "do NOT trade this currency for goods and services. it is NOT worth it."
	icon = 'mojave/icons/objects/currency.dmi'
	singular_name = "my money dont jiggle jiggle"
	amount = 1
	max_amount = 650
	merge_type = /obj/item/stack/ms13/currency
	full_w_class = WEIGHT_CLASS_SMALL
	w_class = WEIGHT_CLASS_TINY
	grid_height = 32
	grid_width = 32
	novariants = FALSE

/obj/item/stack/ms13/currency/Initialize()
	. = ..()
	AddElement(/datum/element/item_scaling, 0.55, 1)

/obj/item/stack/ms13/currency/prewar
	name = "\improper pre-war dollars"
	desc = "Old currency from before the war. Still in use to this day."
	icon_state = "prewar"
	singular_name = "pre-war dollar"
	merge_type = /obj/item/stack/ms13/currency/prewar

/obj/item/stack/ms13/currency/prewar/five
	amount = 5

/obj/item/stack/ms13/currency/prewar/ten
	amount = 10

/obj/item/stack/ms13/currency/prewar/twenty
	amount = 20

/obj/item/stack/ms13/currency/prewar/thirty
	amount = 30

/obj/item/stack/ms13/currency/prewar/fourty
	amount = 40

/obj/item/stack/ms13/currency/prewar/fifty
	amount = 50

/obj/item/stack/ms13/currency/prewar/sixty
	amount = 60

/obj/item/stack/ms13/currency/prewar/seventy
	amount = 70

/obj/item/stack/ms13/currency/prewar/eighty
	amount = 80

/obj/item/stack/ms13/currency/prewar/ninety
	amount = 90

/obj/item/stack/ms13/currency/prewar/hunned
	amount = 100

/obj/item/stack/ms13/currency/prewar/hunnedtwenty
	amount = 120

/obj/item/stack/ms13/currency/prewar/mayor
	amount = 300

/obj/item/stack/ms13/currency/ncr_dollar
	name = "\improper NCR dollars"
	desc = "Recently printed currency, minted exclusively by the New California Republic."
	icon_state = "ncr"
	singular_name = "NCR dollar"
	merge_type = /obj/item/stack/ms13/currency/ncr_dollar

/obj/item/stack/ms13/currency/ncr_dollar/five
	amount = 5

/obj/item/stack/ms13/currency/ncr_dollar/ten
	amount = 10

/obj/item/stack/ms13/currency/ncr_dollar/twenty
	amount = 25

/obj/item/stack/ms13/currency/ncr_dollar/thirty
	amount = 30

/obj/item/stack/ms13/currency/ncr_dollar/fourty
	amount = 40

/obj/item/stack/ms13/currency/ncr_dollar/fifty
	amount = 50

/obj/item/stack/ms13/currency/ncr_dollar/sixty
	amount = 60

/obj/item/stack/ms13/currency/ncr_dollar/seventy
	amount = 70

/obj/item/stack/ms13/currency/ncr_dollar/eighty
	amount = 80

/obj/item/stack/ms13/currency/ncr_dollar/ninety
	amount = 90

/obj/item/stack/ms13/currency/ncr_dollar/hunned
	amount = 100

/obj/item/stack/ms13/currency/ncr_coin
	name = "\improper NCR coins"
	desc = "Recently stamped NCR coin. Seemingly made of solid gold."
	icon_state = "ncr_gold"
	singular_name = "NCR coin"
	max_amount = 50
	merge_type = /obj/item/stack/ms13/currency/ncr_coin

/obj/item/stack/ms13/currency/ncr_coin/five
	amount = 5

/obj/item/stack/ms13/currency/ncr_coin/ten
	amount = 10

/obj/item/stack/ms13/currency/ncr_coin/twenty
	amount = 20

/obj/item/stack/ms13/currency/aurelius
	name = "\improper Legion aurelii"
	desc = "Golden coin. There is an image of a bull and a head."
	icon_state = "aurelius"
	singular_name = "Aurelius coin"
	max_amount = 50
	merge_type = /obj/item/stack/ms13/currency/aurelius

/obj/item/stack/ms13/currency/aurelius/two
	amount = 2

/obj/item/stack/ms13/currency/aurelius/five
	amount = 5

/obj/item/stack/ms13/currency/aurelius/ten
	amount = 10

/obj/item/stack/ms13/currency/aurelius/fifteen
	amount = 15

/obj/item/stack/ms13/currency/aurelius/twenty
	amount = 20

/obj/item/stack/ms13/currency/aurelius/twentyfive
	amount = 25

/obj/item/stack/ms13/currency/aurelius/thirty
	amount = 30

/obj/item/stack/ms13/currency/denarius
	name = "\improper Legion denarii"
	desc = "Silver coin. There is an image of a bull and a head."
	icon_state = "denarius"
	singular_name = "Denarius coin"
	max_amount = 50
	merge_type = /obj/item/stack/ms13/currency/denarius

/obj/item/stack/ms13/currency/denarius/two
	amount = 2

/obj/item/stack/ms13/currency/denarius/five
	amount = 5

/obj/item/stack/ms13/currency/denarius/ten
	amount = 10

/obj/item/stack/ms13/currency/denarius/fifteen
	amount = 15

/obj/item/stack/ms13/currency/denarius/twenty
	amount = 20

/obj/item/stack/ms13/currency/denarius/twentyfive
	amount = 25

/obj/item/stack/ms13/currency/denarius/thirty
	amount = 30

/obj/item/stack/ms13/currency/cap
	name = "\improper bottle caps"
	desc = "Standard nuka cola bottlecaps are found everywhere. Perhaps they're worth something to someone."
	icon_state = "caps"
	singular_name = "bottle cap"
	max_amount = 450
	merge_type = /obj/item/stack/ms13/currency/cap

/obj/item/stack/ms13/currency/cap/four
	amount = 4

/obj/item/stack/ms13/currency/cap/ten
	amount = 10

/obj/item/stack/ms13/currency/cap/fifteen
	amount = 15

/obj/item/stack/ms13/currency/cap/twentyfive
	amount = 25

/obj/item/stack/ms13/currency/cap/thirtyfive
	amount = 35

/obj/item/stack/ms13/currency/cap/fifty
	amount = 50

/obj/item/stack/ms13/currency/cap/sixty
	amount = 60

/obj/item/stack/ms13/currency/cap/seventy
	amount = 70

/obj/item/stack/ms13/currency/cap/eighty
	amount = 80

/obj/item/stack/ms13/currency/cap/ninety
	amount = 90

/obj/item/stack/ms13/currency/cap/hunned
	amount = 100

/obj/item/stack/ms13/currency/cap/hunnedtwentyfive
	amount = 125

/obj/item/stack/ms13/currency/cap/baron
	amount = 200

// Ideas- NCR dollar spawns 20% of the time.
