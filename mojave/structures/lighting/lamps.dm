// Lamps!

/obj/structure/ms13/prewar_lamp
    name = "table lamp"
    desc = "An old prewar table lamp. The fission battery inside still has juice, and it's in good condition."
    icon = 'mojave/icons/structure/lamps.dmi'
    icon_state = "tablelamp"
    light_range = 4.5
    light_power = 0
    var/on = FALSE

/obj/structure/ms13/prewar_lamp/attack_hand(mob/living/user, list/modifiers) 
    if(!on)
        to_chat(user, span_notice("You switch the lamp on."))
        playsound(user, 'mojave/sound/ms13effects/buttonpush.ogg', 20)
        set_light(4.5, 1)
        on = TRUE
        icon_state = "tablelamp_on"
        return
    else
        to_chat(user, span_notice("You switch the lamp off."))
        playsound(user, 'mojave/sound/ms13effects/buttonpush.ogg', 20)
        set_light(4.5, 0)
        on = FALSE
        icon_state = "tablelamp"
        return


/obj/structure/ms13/prewar_lamp/on
    on = TRUE
    icon_state = "tablelamp_on"
    light_range = 4.5
    light_power = 1


/obj/structure/ms13/prewar_lamp/makeshift
    name = "makeshift lamp"
    desc = "A makeshift lamp fashioned from a battery, a light bulb and some wires. Primitive, but functional."
    icon_state = "handmadelamp"
    density = FALSE
    anchored = TRUE
    layer = BELOW_MOB_LAYER
    light_range = 3.5
    light_power = 0
    on = FALSE

/obj/structure/ms13/prewar_lamp/makeshift/attack_hand(mob/living/user, list/modifiers)
    if(!on)
        to_chat(user, span_notice("You hook the battery to the light, turning it on."))
        playsound(user, 'mojave/sound/ms13effects/lightson.ogg', 30)
        set_light(3.5, 0.8)
        on = TRUE
        icon_state = "handmadelamp_on"
        return
    else
        to_chat(user, span_notice("You disconnect the light from the battery, turning it off."))
        set_light(3.5, 0)
        on = FALSE
        icon_state = "handmadelamp"
        return
    

/obj/structure/ms13/prewar_lamp/makeshift/on
    icon_state = "handmadelamp_on"
    light_range = 3.5
    light_power = 0.8
    on = TRUE
