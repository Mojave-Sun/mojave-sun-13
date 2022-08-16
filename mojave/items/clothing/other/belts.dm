// YES, YOU READ CORRECTLY, BELTS

/obj/item/storage/belt/ms13/katana
    name = "katana sheath"
    desc = "A leather sheath, to hold your sharp stick. It's remarkably preserved for how old it must be."
    icon = 'mojave/icons/objects/clothing/clothing_world/belts_world.dmi'
    worn_icon = 'mojave/icons/mob/clothing/belt.dmi'
    icon_state = "sheath_katana"
    worn_icon_state = "sheath_katana"
    grid = FALSE

/obj/item/storage/belt/ms13/katana/ComponentInitialize()
    . = ..()
    var/datum/component/storage/STR = GetComponent(/datum/component/storage)
    STR.max_items = 1
    STR.max_w_class = WEIGHT_CLASS_NORMAL
    STR.set_holdable(list(
		/obj/item/claymore/ms13/machete/katana,
        /obj/item/claymore/ms13/machete/katana/immortal
		))

/obj/item/storage/belt/ms13/katana/examine(mob/user)
	. = ..()
	. += span_notice("Right-click it to quickly draw the blade.")

/obj/item/storage/belt/ms13/katana/attack_hand_secondary(mob/living/user)
    . = ..()
    if(!user.canUseTopic(src, BE_CLOSE, NO_DEXTERITY, FALSE, TRUE))
        return
    if(length(contents))
        var/obj/item/I = contents[1]
        user.visible_message(span_notice("[user] takes [I] out of [src]."), span_notice("You take [I] out of [src]."))
        user.put_in_hands(I)
        update_appearance()
    else
        to_chat(user, span_warning("[src] is empty!"))
    
/obj/item/storage/belt/ms13/katana/update_appearance()
    if(/obj/item/claymore/ms13/machete/katana in contents)
        icon_state = "sheath_katana_black"
        worn_icon_state = "sheath_katana_black"
    if(/obj/item/claymore/ms13/machete/katana/immortal in contents)
        icon_state = "sheath_katana_red"
        worn_icon_state = "sheath_katana_red"
    if(!contents.len)
        icon_state = "sheath_katana"
        worn_icon_state = "sheath_katana"
