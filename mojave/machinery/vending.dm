/obj/machinery/vending/ms13
	name = "base class MS13 vending machine"
	desc = "Alert a coder/mapper if you see this."
	icon = 'mojave/icons/structure/vending.dmi'
	circuit = null
	light_power = 0
	active = 0
	max_integrity = 350
	var/loot_inside //amount of times you can rummage in here/what you can get
	//loot tables and chances
	var/rare_chance = 20
	var/list/loot_rare
	var/high_chance = 30
	var/list/loot_high
	var/medium_chance = 50
	var/list/loot_medium
	//only used on destroy
	var/low_chance = 50
	var/list/loot_low

/obj/machinery/vending/ms13/Initialize(mapload)
	. = ..()
	loot_inside = rand(0, 5)
	if(loot_inside == 0)
		desc = "[desc] It seems to be empty."

/obj/machinery/vending/ms13/examine(mob/user)
	. = ..()
	. += "<span class='notice'>You might be able to search inside of [src] for some goods.</span>"

/obj/machinery/vending/ms13/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(loot_inside <= 0)
		to_chat(user, span_notice("[src] appears empty...</span>"))
		return
	var/tell_em = FALSE
	if(!tell_em)
		to_chat(user, span_notice("You start rumamging your hand around in [src] flap, trying to get something out!</span>"))
		tell_em = TRUE
		playsound(src, 'mojave/sound/ms13effects/vending_rattle.ogg', 100, TRUE)
	if(do_after(user, 16 SECONDS, src))
		tell_em = FALSE
		playsound(src, 'mojave/sound/ms13effects/vending_rattle.ogg', 100, TRUE)
		var/obj/item/vend_loot
		var/whathappens = (rand(1,100))
		switch(whathappens)
			if(1 to 24) //nothing
				to_chat(user, span_danger("You feel a slight discomfort and feel nothing in reach.</span>"))
				return
			if(25 to 79) //winner winner
				var/chance = pick_weight(list("medium" = medium_chance, "high" = high_chance, "rare" = rare_chance))
				switch(chance)
					if("medium")
						vend_loot = pick_weight(loot_medium)
					if("high")
						vend_loot = pick_weight(loot_high)
					if("rare")
						vend_loot = pick_weight(loot_rare)
				var/obj/item/vend_loot_name = new vend_loot(loc)
				to_chat(user, span_green("You rummage around and feel something inside, you carefully pull out \a [vend_loot_name.name]!"))
				user.put_in_active_hand(vend_loot)
				loot_inside -= 1
				return
			if(80 to 100) //arm break
				var/mob/living/carbon/vender_victim = user
				var/obj/item/bodypart/affecting = vender_victim.get_bodypart("[(user.active_hand_index % 2 == 0) ? "r" : "l" ]_arm")
				to_chat(user, span_danger("You feel a horrible pain as your arm gets stuck in the [src]s [pick("mechanisms", "parts", "gears")]!"))
				if(affecting?.receive_damage(30))
					var/type_wound = pick(list(/datum/wound/blunt/critical, /datum/wound/blunt/severe, /datum/wound/blunt/moderate))
					affecting.force_wound_upwards(type_wound)
					vender_victim.emote("scream")
					vender_victim.update_damage_overlays()
				return

/obj/machinery/vending/ms13/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		new /obj/item/stack/sheet/ms13/scrap_steel(loc, 3)
		new /obj/item/stack/sheet/ms13/scrap_electronics(loc, 2)
		new /obj/item/stack/sheet/ms13/scrap_parts(loc, 2)
	if(loot_inside > 0)
		for(var/B = 1 to loot_inside)
			var/obj/item/vend_loot
			var/chance = pick_weight(list("low" = low_chance, "none" = (100 - low_chance)))
			switch(chance)
				if("low")
					vend_loot = pick(loot_low)
					new vend_loot(src)
				if("none")
					continue
		for(var/obj/item/I in src)
			I.forceMove(loc)
	qdel(src)

/obj/machinery/vending/ms13/can_vend(user, silent)
	return FALSE

/obj/machinery/vending/ui_interact(mob/user, datum/tgui/ui)
	return

/obj/machinery/vending/ms13/vend(list/params, list/greyscale_colors)
	return

/obj/machinery/vending/ms13/nuka
	name = "Nuka Cola vending machine"
	desc = "An old Nuka Cola vending machine."
	icon_state = "nuka_old"
	loot_rare = NUKA_VENDOR_DROP_RARE
	loot_high = NUKA_VENDOR_DROP_HIGH
	loot_medium = NUKA_VENDOR_DROP_MEDIUM
	loot_low = NUKA_VENDOR_DROP_LOW
	rare_chance = 16
	high_chance = 28
	medium_chance = 58

/obj/machinery/vending/ms13/nuka/pristine
	name = "Nuka Cola vending machine"
	desc = "An old Nuka Cola vending machine, either left untouched or restored to its former glory."
	icon_state = "nuka_new"

/obj/machinery/vending/ms13/sarsaparilla
	name = "Sunset Sarsaparilla vending machine"
	desc = "One of the few to challenge Nuka's dominance, this Sunset Sarsaparilla machine still stands."
	icon_state = "sarsaparilla"
	loot_rare = SARSPA_VENDOR_DROP_RARE
	loot_high = SARSPA_VENDOR_DROP_HIGH
	loot_medium = SARSPA_VENDOR_DROP_MEDIUM
	loot_low = SARSPA_VENDOR_DROP_LOW

/obj/machinery/vending/ms13/cigarettes
	name = "cigarette vending machine"
	desc = "Delicious cigarettes"
	icon_state = "cigarette"
	tiltable = FALSE
	loot_rare = CIGARETTE_VENDOR_DROP_RARE
	loot_high = CIGARETTE_VENDOR_DROP_HIGH
	loot_medium = CIGARETTE_VENDOR_DROP_MEDIUM
	loot_low = CIGARETTE_VENDOR_DROP_LOW
