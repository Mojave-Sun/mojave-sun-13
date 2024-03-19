/obj/item/ms13/lock/scrap
	name = "makeshift lock"
	desc = "A crude and makeshift scrap lock, enough to keep people out of your stuff."
	icon_state = "scrap"
	inhand_icon_state = "scrap_lock"
	lock_difficulty = 12
	pin_amount = 4

/obj/item/ms13/lock/scrap/unlocked
	pre_locked = FALSE

/obj/item/ms13/lock/brass
	name = "brass lock"
	desc = "A refined and intricate brass lock, keeps people out."
	icon_state = "brass"
	inhand_icon_state = "brass_lock"
	lock_difficulty = 3

/obj/item/ms13/lock/brass/unlocked
	pre_locked = FALSE

/obj/item/ms13/lock/advanced
	name = "advanced lock"
	desc = "A high tech and experimental piece of locking technology, impervious to lockpicking."
	icon_state = "advanced"
	inhand_icon_state = "advanced_lock"
	can_be_lockpicked = FALSE

/obj/item/ms13/lock/advanced/unlocked
	pre_locked = FALSE
