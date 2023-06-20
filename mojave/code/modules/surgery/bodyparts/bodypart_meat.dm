/obj/item/food/meat/slab/ms13/bodypart
	name = "lean meat"
	desc = "A slab of \"meat\"."
	gender = PLURAL
	tastes = list("tender meat" = 1)

/obj/item/food/meat/slab/ms13/bodypart/MakeGrillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/plain/ms13/bodypart, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/ms13/bodypart/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/meat/rawcutlet/plain/ms13/bodypart, 3, 30)

/obj/item/food/meat/slab/ms13/bodypart/ribs
	name = "ribs"
	desc = "A slab of \"ribs\"."
	icon_state = "fatty"
	tastes = list("juicy meat" = 1)

/obj/item/food/meat/slab/ms13/bodypart/ribs/MakeGrillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/steak/plain/ms13/bodypart/ribs, rand(30 SECONDS, 90 SECONDS), TRUE, TRUE)

/obj/item/food/meat/slab/ms13/bodypart/ribs/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE,  /obj/item/food/meat/rawcutlet/plain/ms13/bodypart, 3, 30)

/obj/item/food/meat/steak/plain/ms13/bodypart
	tastes = list("tender meat" = 1)

/obj/item/food/meat/steak/plain/ms13/bodypart/ribs
	name = "roasted ribs"
	desc = "A piece of juicy ribs."
	gender = PLURAL
	icon_state = "fatty_roasted"
	tastes = list("juicy meat" = 1)

/obj/item/food/meat/rawcutlet/plain/ms13/bodypart
	tastes = list("tender meat" = 1)

/obj/item/food/meat/rawcutlet/plain/ms13/bodypart/MakeGrillable()
	AddComponent(/datum/component/grillable, /obj/item/food/meat/cutlet/plain/ms13/bodypart, rand(35 SECONDS, 50 SECONDS), TRUE, TRUE)

/obj/item/food/meat/cutlet/plain/ms13/bodypart
	tastes = list("tender meat" = 1)
