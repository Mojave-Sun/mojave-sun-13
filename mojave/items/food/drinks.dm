// For bottles and drink containers //

/obj/item/reagent_containers/food/drinks/drinkingglass/ms13
	name = "glass"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(10, 15, 20, 25, 30, 50)
	volume = 50
	reagent_flags = OPENCONTAINER | DUNKABLE
	spillable = TRUE
	resistance_flags = ACID_PROOF
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 64
	grid_width = 32

/obj/item/reagent_containers/food/drinks/mug/ms13
	name = "mug"
	desc = "An old mug, if only you had some coffee"
	icon = 'mojave/icons/objects/food/liquids/drink_containers_world.dmi'
	icon_state = "mug"
	throwforce = 5
	volume = 20
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 32
	grid_width = 32

/obj/item/reagent_containers/food/drinks/mug/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/food/liquids/drink_containers_inventory.dmi')

/obj/item/reagent_containers/food/drinks/soda_cans/ms13
	name = "bottle"
	icon = 'mojave/icons/objects/food/liquids/drink_containers_world.dmi'
	icon_state = "bottle"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10, 15) // Small opening moment.
	spillable = FALSE
	volume = 45 // Volume of the container. Keep it relatively realistic or somethin'.
	list_reagents = null // IMMERSION ANNOUNCEMENT: Drinks usually aren't filled to the literal top. Leave a bit less in there.
	foodtype = SUGAR
	isGlass = TRUE
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 64
	grid_width = 32
	var/captype = null

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/food/liquids/drink_containers_inventory.dmi')

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/open_soda(mob/user)
	to_chat(user, "You pry the top off \the [src] off with a satisfying hiss.")
	reagents.flags |= OPENCONTAINER
	playsound(src, "can_open", 50, TRUE)
	spillable = TRUE

//// Soda! ////

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_cola
	name = "Nuka cola bottle"
	desc = "A Nuka cola bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_cola"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_cola = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_dark
	name = "Nuka dark bottle"
	desc = "A Nuka cola bottle. Made to sell off delicious soda to the masses. Allegedly 25 ApV."
	icon_state = "nuka_dark"
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/nuka_dark = 40)
	foodtype = SUGAR | ALCOHOL

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_victory
	name = "Nuka victory bottle"
	desc = "A Nuka victory bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_victory"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_victory = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_quantum
	name = "Nuka quantum bottle"
	desc = "A Nuka victory bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_quantum"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_quantum = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_quartz
	name = "Nuka quartz bottle"
	desc = "A Nuka quarz bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_quartz"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_quartz = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_cherry
	name = "Nuka cherry bottle"
	desc = "A Nuka cherry bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_cherry"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_cherry = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_grape
	name = "Nuka grape bottle"
	desc = "A Nuka grape bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_grape"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_grape = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_orange
	name = "Nuka orange bottle"
	desc = "A Nuka orange bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_orange"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_orange = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_cranberry // Want a nuka cranberry?
	name = "Nuka cranberry bottle"
	desc = "A Nuka cranberry bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_cranberry"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_cranberry = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_wild
	name = "Nuka wild bottle"
	desc = "A Nuka wild bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_wild"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_wild = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_lime
	name = "Nuka lime bottle"
	desc = "A Nuka lime bottle. Made to sell off delicious soda to the masses."
	icon_state = "nuka_lime"
	list_reagents = list(/datum/reagent/consumable/ms13/nuka_lime = 40)

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/nuka_custom
	name = "Nuka custom bottle"
	desc = "A blank Nuka cola bottle. Vendored off in mixing stations for people that wish to make their own combination of flavors."
	icon_state = "nuka_custom"
	list_reagents = null
	reagent_flags = OPENCONTAINER | DUNKABLE // No cap!

/obj/item/reagent_containers/food/drinks/soda_cans/ms13/sarsaparilla
	name = "sunset sarsaparilla bottle"
	desc = "A sunset sarsaparilla bottle. Once a prized drink of the west, always a prized drink of the west."
	icon_state = "sarsaparilla"
	volume = 40
	list_reagents = list(/datum/reagent/consumable/ms13/sunset_sarsaparilla = 35)

//// Alcohol bottles ////

/obj/item/reagent_containers/food/drinks/bottle/ms13
	name = "MS13 bottle"
	desc = "Don't use this one MANE!"
	icon = 'mojave/icons/objects/food/liquids/drink_containers_world.dmi'
	icon_state = "bottle"
	list_reagents = null
	foodtype = ALCOHOL
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/reagent_containers/food/drinks/bottle/ms13/Initialize()
	. = ..()
	AddElement(/datum/element/world_icon, null, icon, 'mojave/icons/objects/food/liquids/drink_containers_inventory.dmi')

/obj/item/reagent_containers/food/drinks/bottle/ms13/plain
	name = "bottle"
	desc = "An unlabeled bottle. Doesn't look like it was ever used. Perfect to use for yourself."
	icon_state = "bottle"
	list_reagents = null
	grid_height = 64
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/moonshine
	name = "moonshine bottle"
	desc = "A large glass bottle bearing the classic 'triple X'. Can hold a whole lot."
	icon_state = "moonshine"
	volume = 100
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/moonshine = 90)
	grid_height = 64
	grid_width = 64

/obj/item/reagent_containers/food/drinks/bottle/ms13/whiskey
	name = "whiskey bottle"
	desc = "A large whiskey bottle. A perfect decoration for your comically small table next to the fire."
	icon_state = "whiskey"
	volume = 80
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/whiskey = 75)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/vodka
	name = "vodka bottle"
	desc = "A medium sized vodka bottle. Skinny and tall, good for transporting your method of coping."
	icon_state = "vodka"
	volume = 70
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/vodka = 65)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/tequila
	name = "tequila bottle"
	desc = "A large tequila bottle. The best used you can get out of this is to pour out the old trash and get a local fillup."
	icon_state = "tequila"
	volume = 70
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/tequila = 65)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/kaluha
	name = "kaluha bottle"
	desc = "A large kaluha bottle. The label is still pretty intact, suprisingly."
	icon_state = "kaluha"
	volume = 70
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/kaluha = 65)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/wine
	name = "wine bottle"
	desc = "A large wine bottle. Impressive this has made it this long, with the stories of how brittle the bottles are."
	icon_state = "wine"
	volume = 70
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/wine = 65)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/champagne
	name = "champagne bottle"
	desc = "A medium champagne bottle. This is a true rarity in these parts! Best hope it's still got the good stuff in it."
	icon_state = "champagne"
	volume = 70
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/champagne = 65)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/cognac
	name = "cognac bottle"
	desc = "A cognac bottle. Rather uncommon to find. Cherish it."
	icon_state = "cognac"
	volume = 55
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/cognac = 50)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/nukashine
	name = "nukashine bottle"
	desc = "A large nukashine bottle. An INCREDIBLE find. Rumor has it that these were discontinued LONG before the bombs even dropped. For good reason, allegedly."
	icon_state = "nuka_shine"
	volume = 80
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/nukashine = 75)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/gin
	name = "gin bottle"
	desc = "A large gin bottle. The colors on it are still pretty vibrant. Would probably make a good shelf decoration."
	icon_state = "gin"
	volume = 80
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/gin = 75)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/sake
	name = "sake bottle"
	desc = "A large sake bottle. Odd to find one of these, but not too incredible."
	icon_state = "sake"
	volume = 80
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/sake = 75)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/vermouth
	name = "vermouth bottle"
	desc = "A vermouth bottle. Thick green glass. Not much to be said there. Not as uncommon as some of the other wines."
	icon_state = "vermouth"
	volume = 70
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/vermouth = 65)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/triple_sec
	name = "triple sec bottle"
	desc = "A triple sec bottle. It's got an intact lable with little orange fruits on the front. How quirky!"
	icon_state = "triple_sec"
	volume = 65
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/triple_sec = 60)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/absinthe
	name = "absinthe bottle"
	desc = "A large absinthe bottle. Rumour has it this was a dangerous drink before the war. Not so much anymore. Relatively, at least."
	icon_state = "absinthe"
	volume = 80
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/absinthe = 75)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/rum
	name = "rum bottle"
	desc = "A rum bottle. It's got a rather bland design. Disappointing."
	icon_state = "rum"
	volume = 80
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/rum = 75)
	grid_height = 96
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/trooper_beer
	name = "trooper's pale ale bottle"
	desc = "A beer bottle. It's got a rather bland design. Disapointing."
	icon_state = "beer"
	volume = 45
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/beer = 40)
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 64
	grid_width = 32

/obj/item/reagent_containers/food/drinks/bottle/ms13/caligary_beer
	name = "New Caligary lager"
	desc = "A beer bottle. This one apparently has something to do with a place called 'Caligary'."
	icon_state = "beer_white"
	volume = 45
	list_reagents = list(/datum/reagent/consumable/ethanol/ms13/beer = 40)
	w_class = WEIGHT_CLASS_SMALL
	grid_height = 64
	grid_width = 32
