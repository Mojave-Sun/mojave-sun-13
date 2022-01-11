// These are just indicator icons, so in throw_alert we set severity to null
// Also - these currently are on or off, with no colour difference for severity

/atom/movable/screen/alert/hudbar
	icon = 'mojave/icons/hud/ms_ui_health.dmi'
	screen_loc = ui_healthdoll

/atom/movable/screen/alert/hudbar/oxy
	name = "Choking (No O2)"
	desc = "You're not getting enough oxygen. Find some good air before you pass out!"
	icon_state = "status_O2"
/atom/movable/screen/alert/hudbar/fire
	name = "On Fire"
	desc = "You're on fire. Stop, drop and roll to put the fire out or move to a vacuum area."
	icon_state = "status_fire"

/atom/movable/screen/alert/hudbar/fire/Click()
	. = ..()
	if(!.)
		return

	var/mob/living/living_owner = owner

	living_owner.changeNext_move(CLICK_CD_RESIST)
	if(living_owner.mobility_flags & MOBILITY_MOVE)
		return living_owner.resist_fire()

/atom/movable/screen/alert/hudbar/toxin
	name = "Choking (Toxins)"
	desc = "The air you're breathing in is toxic. Find some fresh air."
	icon_state = "status_toxic"

/atom/movable/screen/alert/hudbar/hunger
	name = "Hungry"
	desc = "Some food would be good right about now."
	icon_state = "status_nutrition"

/atom/movable/screen/alert/hudbar/hunger/starving
	name = "Starving"
	desc = "You're severely malnourished. The hunger pains make moving around a chore."

/atom/movable/screen/alert/hudbar/hunger/fat
	name = "Fat"
	desc = "You ate too much food, lardass. Run around the wasteland and lose some weight."
/atom/movable/screen/alert/hudbar/hot
	name = "Too Hot"
	desc = "You're flaming hot! Get somewhere cooler and take off any insulating clothing."
	icon_state = "status_hot"
/atom/movable/screen/alert/hudbar/cold
	name = "Too Cold"
	desc = "You're freezing cold! Get somewhere warmer and take off any insulating clothing."
	icon_state = "status_cold"

/atom/movable/screen/alert/hudbar/low_pressure
	name = "Low Pressure"
	desc = "The air around you is hazardously thin."
	icon_state = "status_pressure"

/atom/movable/screen/alert/hudbar/high_pressure
	name = "High Pressure"
	desc = "The air around you is hazardously thick."
	icon_state = "status_pressure"

/atom/movable/screen/alert/hudbar/thirst/not_thirsty
	name = "Not Thirsty"
	desc = "A rarity in the wasteland, not being thirstful is a sign of a good life so far."
	icon_state = "status_thirst"

/atom/movable/screen/alert/hudbar/thirst/slight_thirst
	name = "Slightly Thirsty"
	desc = "Your mouth feels a bit dry, could solve that problem by applying some water to it."
	icon_state = "status_thirst"

/atom/movable/screen/alert/hudbar/thirst/thirsty
	name = "Thirsty"
	desc = "You definitely have a somewhat bad feeling of thirst, you would obviously like some water."
	icon_state = "status_thirst"

/atom/movable/screen/alert/hudbar/thirst/very_thirsty
	name = "Very Thirsty"
	desc = "Your mouth barely feels wet, you're afraid if you don't get your hands on water, your future looks bleak."
	icon_state = "status_thirst"

/atom/movable/screen/alert/hudbar/thirst/dehydrated
	name = "Substantially Dehydrated"
	desc = "You're already on deaths door, get that water, now!"
	icon_state = "status_thirst"
