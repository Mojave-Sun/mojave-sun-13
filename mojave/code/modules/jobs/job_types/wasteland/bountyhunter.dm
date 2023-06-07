/*/datum/job/ms13/wasteland/bountyhunter
	title = "Bounty Hunter"
	total_positions = 0
	spawn_positions = 0
	supervisors = "Your employer"
	description = "Seek out the given target, follow instructions and then move onto the next task."
	forbid = "Do not create unnecessary casualties."
	enforce = "Stick to the list."

	outfit = /datum/outfit/job/ms13/wasteland/bountyhunter
*/ //Uncommented until this fella is made a latespawn or something.//

/datum/outfit/job/ms13/wasteland/bountyhunter
	name = "_Bounty Hunter"
	//jobtype = /datum/job/ms13/wasteland/bountyhunter

	head = 		 /obj/item/clothing/head/helmet/ms13/eliteriot/bountyhunter
	suit = 		 /obj/item/clothing/suit/ms13/ljacket/bountyhunter
	suit_store = /obj/item/gun/ballistic/rifle/ms13/hunting/scoped/amr
	uniform =  	 /obj/item/clothing/under/ms13/wasteland/whiteshirt
	belt = 		 /obj/item/gun/ballistic/automatic/pistol/ms13/m12mm
	gloves = 	 /obj/item/clothing/gloves/ms13/winter/black
	shoes = 	 /obj/item/clothing/shoes/ms13/military
	r_pocket =   /obj/item/reagent_containers/hypospray/medipen/stimpak
	l_pocket =   /obj/item/stack/medical/gauze/ms13/military
	back =  	 /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(/obj/item/stack/medical/suture/ms13=1,\
	/obj/item/ammo_box/magazine/ms13/m12mm=2,\
	/obj/item/ammo_box/magazine/ms13/amr=1,\
	/obj/item/kitchen/knife/ms13/hunting/unique=1,\
	/obj/item/restraints/handcuffs=2)

/datum/outfit/job/ms13/wasteland/bountyhunter/pre_equip(mob/living/carbon/human/H)
	..()
