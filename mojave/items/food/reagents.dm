/datum/reagent/consumable/ms13
	name = "Generic MS13 yummy liquid"
	description = "Yeah probably skip out on this one chief."
	color = "#7c7b7a"
	quality = DRINK_NICE
	glass_name = "glass of liquid" // Keep these generic for flavour!
	glass_desc = "A pale coloured liquid. It screams 'PAIN'." // Same with this. Keep people guessin'. Make em know the drink via flavour and look for immersion.
	glass_icon_state = null

// E for Everyone drinks - Soda/Beverages //

/datum/reagent/consumable/ms13/nuka_cola
	name = "Nuka-Cola"
	description = "Zap that thirst!"
	color = "#413022"
	quality = DRINK_VERYGOOD
	taste_description = "nuka-cola"
	glass_name = "glass of dark fizzy liquid"
	glass_desc = "A dark fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_diet
	name = "Nuka-Diet"
	description = "Zap that thirst! Now with no sugar."
	color = "#413022"
	quality = DRINK_GOOD
	taste_description = "weird nuka-cola"
	glass_name = "glass of dark fizzy liquid"
	glass_desc = "A dark fizzy liquid with a slighty off sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_diet/on_mob_life(mob/living/carbon/M)
	if(prob(1))
		M.adjustBruteLoss(0.5) //aspartame is bad for your bones

/datum/reagent/consumable/ms13/nuka_cherry
	name = "Nuka-Cherry"
	description = "Now this is one cherry drink."
	color = "#790604"
	quality = DRINK_VERYGOOD
	taste_description = "sweet fruity cola"
	glass_name = "glass of dark red fizzy liquid"
	glass_desc = "A dark red fizzy liquid with a slighty sweet and fruity smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_grape
	name = "Nuka-Grape"
	description = "Tastes grape."
	color = "#60145C"
	quality = DRINK_VERYGOOD
	taste_description = "sweet grape soda"
	glass_name = "glass of purple fizzy liquid"
	glass_desc = "A purple fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_orange
	name = "Nuka-Orange"
	description = "Orange you glad you found this?"
	color = "#FC8102"
	quality = DRINK_VERYGOOD
	taste_description = "fruity acidic soda"
	glass_name = "glass of orange fizzy liquid"
	glass_desc = "A orange fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_cranberry
	name = "Nuka-Cranberry"
	description = "How did this here all the way from Appalachia?"
	color = "#950714"
	quality = DRINK_VERYGOOD
	taste_description = "bitter fruit soda"
	glass_name = "glass of red fizzy liquid"
	glass_desc = "A red fizzy liquid with a bittersweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_lemon
	name = "Nuka-Lemon"
	description = "All the zip of Nuka-Cola, with all the refreshing zing of lemon."
	color = "#fff44f"
	quality = DRINK_VERYGOOD
	taste_description = "sour fruit soda"
	glass_name = "glass of yellow fizzy liquid"
	glass_desc = "A transparent yellow fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_quantum
	name = "Nuka-Cola Quantum"
	description = "Glowy yet oh so good."
	color = "#15F4EE"
	quality = DRINK_FANTASTIC
	taste_description = "static-y dull soda"
	glass_name = "glass of blue fizzy liquid"
	glass_desc = "A blue fizzy liquid with an odd smell. It glows slightly, and makes small pops at random."

/datum/reagent/consumable/ms13/nuka_quartz
	name = "Nuka-Cola Quartz"
	description = "A classy clear drink."
	color = "#dfdcdc"
	quality = DRINK_FANTASTIC
	taste_description = "extra fizzy nuka-cola"
	glass_name = "glass of clear fizzy liquid"
	glass_desc = "A clear fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_victory
	name = "Nuka-Cola Victory"
	description = "Tastes like freedom."
	color = "#E3931D" //it's fizzy, it's ginger, it's phenomenal
	quality = DRINK_FANTASTIC
	taste_description = "sweet ginger soda"
	glass_name = "glass of orange fizzy liquid"
	glass_desc = "A orange fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_wild
	name = "Nuka-Wild"
	description = "Nuka-Cola's answer to Sunset Sarsaparilla, it never really made an impact in the Southwest."
	color = "#290E05"
	quality = DRINK_VERYGOOD
	taste_description = "sweet dense soda"
	glass_name = "glass of dark fizzy liquid"
	glass_desc = "A dark fizzy liquid with a bland smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_vaccinated
	name = "Nuka-Cola My Blood's In It"
	description = "Tested well in the PEOPLE WHO DON'T WANT TO GET SICK AND DIE demographic."
	color = "#4e2e13"
	quality = DRINK_VERYGOOD
	taste_description = "weird citrus-caramel flavoured soda"
	glass_name = "glass of brown-ish fizzy liquid"
	glass_desc = "A dark brown-ish fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_vaccinated/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-0.2, 0, TRUE)
	for(var/thing in M.diseases)
		var/datum/disease/D = thing
		if(D.severity == DISEASE_SEVERITY_POSITIVE)
			continue
		D.cure()
	..()

/datum/reagent/consumable/ms13/nuka_fusion
	name = "Nuka-Fusion"
	description = "A wildcat beverage made by a Nuka-Cola fanatic."
	color = "#D97031"
	quality = DRINK_FANTASTIC
	taste_description = "intense sweet fruity soda"
	glass_name = "glass of orange fizzy liquid"
	glass_desc = "A orange fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_berry
	name = "Nuka-Berry"
	description = "Packed with berry flavour."
	color = "#5d1f81"
	quality = DRINK_VERYGOOD
	taste_description = "sweet berry cola"
	glass_name = "glass of purple fizzy liquid"
	glass_desc = "A purple fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_frutti
	name = "Nuka-Frutti"
	description = "Perfect for when you're feeling fruity."
	color = "#d8bd72"
	quality = DRINK_VERYGOOD
	taste_description = "strong fruity cola"
	glass_name = "glass of pale yellow fizzy liquid"
	glass_desc = "A pale yellow fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_lixir
	name = "Nuka-Lixir"
	description = "...Who thought this was a good idea?"
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "nuka-medicine"

/datum/reagent/consumable/ms13/nuka_love
	name = "Nuka-Love"
	description = "Aww, it's pink!"
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "cherry love"

/datum/reagent/consumable/ms13/nuka_punch
	name = "Nuka-Punch"
	description = "Serve it up at your next party!"
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "tropical punch"

/datum/reagent/consumable/ms13/nuka_ray
	name = "Nuka-Ray"
	description = "Prepare for blastoff!"
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "space-age soda"

/datum/reagent/consumable/ms13/nuka_rush
	name = "Nuka-Rush"
	description = "Fills you with energy."
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "invigorating refreshment"

/datum/reagent/consumable/ms13/nuka_sunrise
	name = "Nuka-Sunrise"
	description = "Makes you picture simpler times."
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "balmy breezes"

/datum/reagent/consumable/ms13/nuka_xtreme
	name = "Nuka-Xtreme"
	description = "WOAH DUDE IT'S TOO EXTREME!"
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "extreme nuka-flavour"

/datum/reagent/consumable/ms13/newka_cola
	name = "Newka-Cola"
	description = "Based on the failed Cherry Nuka-Cola, this drink is guaranteed to disappoint."
	color = "#15F4EE"
	quality = DRINK_GOOD
	taste_description = "nuka-cola, but worse"

/datum/reagent/consumable/ms13/nuka_fancy
	name = "Nuka-Fancy"
	description = "Cherry rootbeer. A favourite with those who want to act fancy."
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "cherry rootbeer"

/datum/reagent/consumable/ms13/nuka_free
	name = "Nuka-Free"
	description = "That's not how diet drinks work, you know."
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "watery nuka-cola"

/datum/reagent/consumable/ms13/nuka_twin
	name = "Nuka-Twin"
	description = "A classic soda-fountain pairing. Probably."
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "spicy nuka-cola"

/datum/reagent/consumable/ethanol/ms13/nuka_black
	name = "Nuka-Black"
	description = "Cola and coffee, finally married in perfect harmony."
	taste_description = "coffee and cola"
	quality = DRINK_VERYGOOD
	color = "#3B2F2F"

/datum/reagent/consumable/ms13/bawls
	name = "Bawls Guarana"
	description = "STAY UP, DRINK BAWLS GUARANA!!"
	color = "#003366"
	quality = DRINK_GOOD
	taste_description = "guarana"

/datum/reagent/consumable/ms13/vim
	name = "Vim"
	description = "A taste of Maine in a bottle."
	color = "#290E05"
	quality = DRINK_VERYGOOD
	taste_description = "bittersweet soda"

/datum/reagent/consumable/ms13/vim_refresh
	name = "Vim Refresh"
	description = "Gives you the zip you need to get through the day."
	color = "#8db600"
	quality = DRINK_VERYGOOD
	taste_description = "apples"

/datum/reagent/consumable/ms13/vim_quartz
	name = "Vim Quartz"
	description = "Now with extra Vim!"
	color = "#ffffff"
	quality = DRINK_VERYGOOD
	taste_description = "bubblegum"

/datum/reagent/consumable/ms13/vim_captain
	name = "Vim Captain's Blend"
	description = "A true taste of Maine in a bottle."
	color = "#006994"
	quality = DRINK_FANTASTIC
	taste_description = "fishy soda"

/datum/reagent/consumable/ms13/sunset_sarsaparilla
	name = "Sunset Sarsaparilla"
	description = "Build mass with sass!"
	color = "#290E05"
	quality = DRINK_VERYGOOD
	taste_description = "rootbeer"

// A for Adult drinks - Alcohols //
/datum/reagent/consumable/ethanol/ms13
	name = "Generic MS13 alcohol"
	description = "Don't drink this bro	"
	color = "#404030" // rgb: 64, 64, 48
	nutriment_factor = 0
	taste_description = "alcohol"
	boozepwr = 20

/datum/reagent/consumable/ethanol/ms13/nukashine //this stuff makes you faster and stronger, although it also kills your liver in literal seconds, so...
	name = "Nukashine"
	description = "The best drink a college freshman could ask for."
	color = "#15F4EE"
	quality = DRINK_FANTASTIC
	boozepwr = 300
	taste_description = "imminent liver death"

/datum/reagent/consumable/ethanol/ms13/nukashine/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/methamphetamine)
	to_chat(L, "<span class='swarmer'>Your liver burns with pain as you drink the Nukashine!</span>")

/datum/reagent/consumable/ethanol/ms13/nukashine/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/methamphetamine)
	L.clear_fullscreen("nukashine")
	to_chat(L, "<span class='swarmer'>Against all odds, you've survived your experience with Nukashine... but at what cost?</span>")
	..()

/datum/reagent/consumable/ethanol/ms13/nukashine/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-40, FALSE)
	M.AdjustKnockdown(-40, FALSE)
	M.AdjustUnconscious(-40, FALSE)
	M.AdjustParalyzed(-40, FALSE)
	M.AdjustImmobilized(-40, FALSE)
	M.adjustStaminaLoss(-2, 0)
	M.Jitter(2)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, rand(5,10))
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 4)
	M.hallucination += 5
	if((M.mobility_flags & MOBILITY_MOVE) && !ismovable(M.loc))
		step(M, pick(GLOB.cardinals))
		step(M, pick(GLOB.cardinals))
	..()

/datum/reagent/consumable/ethanol/ms13/nukashine/victory_nukashine
	name = "Lady Liberty Nukashine"
	description = "Patriotic enough to make a bald eagle shed a single tear of freedom."
	color = "#E3931D"
	taste_description = "imminent yet patriotic liver death"

/datum/reagent/consumable/ethanol/ms13/nuka_dark
	name = "Nuka-Dark"
	description = "A classy blend of Nuka-Cola and dark rum."
	taste_description = "nuka-dark"
	boozepwr = 40
	quality = DRINK_NICE
	color = "#3E1B00"

/datum/reagent/consumable/ethanol/ms13/nuka_cooler
	name = "Nuka-Cooler"
	description = "Guaranteed to cool you off on a hot day."
	color = "#15F4EE"
	quality = DRINK_VERYGOOD
	taste_description = "a burst of nuka-flavour"
	boozepwr = 40
	glass_name = "glass of orange fizzy liquid"
	glass_desc = "A orange fizzy liquid with a slighty sweet smell. Bubbles form on the side."

/datum/reagent/consumable/ethanol/ms13/waster_tequila
	name = "Wasteland Tequila"
	description = "A rough-and-ready tequila born of the wasteland."
	taste_description = "agave syrup"
	boozepwr = 70
	quality = DRINK_NICE
	color = "#FFFF91"

/datum/reagent/consumable/ethanol/ms13/waster_tequila/on_mob_life(mob/living/carbon/M)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1*REM, 0)
		. = 1
	if(holder.has_reagent(/datum/reagent/toxin))
		holder.remove_reagent(/datum/reagent/toxin, 0.5)
	..()

/datum/reagent/consumable/ethanol/ms13/ballistic_bock
	name = "Ballistic Bock"
	description = "A dark, malty ale complemented perfectly with gunpowder."
	taste_description = "beer"
	boozepwr = 30
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/high_volt_hefe
	name = "High Voltage Hefe"
	description = "A pale, crisp beer complemented beautifully with fusion cell juice."
	taste_description = "beer"
	boozepwr = 30
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/rad_ant_lager
	name = "Rad Ant Lager"
	description = "A light, hoppy beer complemented exquisitely with Rad Ant meat."
	taste_description = "beer"
	boozepwr = 30
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/hoppy_hunter_ipa
	name = "Hoppy Hunter IPA"
	description = "A pale, hoppy beer complemented masterfully with brain fungus."
	taste_description = "beer"
	boozepwr = 30
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/blood_tequila
	name = "Dayglow Blood Tequila"
	description = "A recipe all the way from Dayglow."
	taste_description = "agave and iron"
	boozepwr = 70
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/alcohol_z
	name = "Alcohol-Z"
	description = "The signature drink of vault bars the world over. Exceptionally rare outside of old vaults."
	taste_description = "grain alcohol"
	boozepwr = 65
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/firecracker_whiskey
	name = "Firecracker Whiskey"
	description = "Comes with a kick."
	taste_description = "burning"
	boozepwr = 90
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/firecracker_whiskey/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	..()
	. = 1

/datum/reagent/consumable/ethanol/ms13/lead_champagne
	name = "Lead Champagne"
	description = "Are you sure this is safe to drink?"
	taste_description = "sparkling wine"
	boozepwr = 45
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/lead_champagne/on_mob_life(mob/living/carbon/M)
	if(prob(20))
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, pick(0.1, 0.2, 0.3, 0.4, 0.5))
	..()

/datum/reagent/consumable/ethanol/ms13/mountain_honey
	name = "Mountain Honey"
	description = "Enjoyed by hillbillies and toothless prospectors alike."
	taste_description = "angry bees"
	boozepwr = 100
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/roentgen_rum
	name = "Roentgen Rum"
	description = "A fortified rum made with special ingredients. Probably not safe for human consumption."
	taste_description = "a criticality incident"
	boozepwr = 100
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/roentgen_rum/on_mob_life(mob/living/carbon/M)
	M.adjust_blurriness(1)
	..()

/datum/reagent/consumable/ethanol/ms13/herb_brew
	name = "Herbal Brew"
	description = "An alcoholic herbal brew, made by tribals from the local forage. Almost tastes like cough syrup."
	taste_description = "aniseed"
	boozepwr = 30
	quality = DRINK_GOOD
	color = "#5D0F0C"

//Mixed Drinks

/datum/reagent/consumable/ethanol/ms13/rum_nuka
	name = "Rum and Nuka"
	description = "Rum, mixed with Nuka-Cola."
	taste_description = "nuka-cola"
	boozepwr = 40
	quality = DRINK_NICE
	color = "#3E1B00"

/datum/reagent/consumable/ethanol/ms13/whiskey_nuka
	name = "Whiskey and Nuka"
	description = "Whiskey, mixed with Nuka-Cola. Surprisingly refreshing."
	color = "#3E1B00" // rgb: 62, 27, 0
	boozepwr = 70
	quality = DRINK_NICE
	taste_description = "cola"

/datum/reagent/consumable/ethanol/ms13/vodka_nuka
	name = "Vodka and Nuka"
	description = "Vodka and Nuka-Cola. For when you love alcohol, but hate the taste."
	taste_description = "nuka-cola"
	boozepwr = 40
	quality = DRINK_NICE
	color = "#3E1B00"

/datum/reagent/consumable/ethanol/ms13/cuban_missile_crisis
	name = "Cuban Missile Crisis"
	description = "In memory of Havana."
	color = "#3E1B00" // rgb: 62, 27, 0
	boozepwr = 50
	quality = DRINK_GOOD

/datum/reagent/consumable/ethanol/ms13/fernet_nuka
	name = "Fernet and Nuka"
	description = "A very popular and bittersweet digestif, ideal after a heavy meal. Best served on a sawed-off Nuka-Cola bottle as per tradition."
	color = "#390600" // rgb: 57, 6,
	boozepwr = 25
	quality = DRINK_NICE
	taste_description = "sweet relief"
	glass_icon_state = "godlyblend"

/datum/reagent/consumable/ethanol/ms13/go_getter
	name = "Go-Getter"
	description = "Perks you up, real hard."
	taste_description = "a renewing zing"
	boozepwr = 40
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/dayglow_margarita
	name = "Dayglow Margarita"
	description = "And you thought regular margaritas glowed in the dark."
	taste_description = "salty lime"
	boozepwr = 35
	quality = DRINK_NICE
	color = "#83F52C"

/datum/reagent/consumable/ethanol/ms13/mammoth_bait
	name = "Mammoth Bait"
	description = "A recipe passed down through the generations in Mammoth. Perfect for warming up in the eversnow."
	taste_description = "coffee with a kick"
	boozepwr = 35
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/z_twist
	name = "Z-Tini"
	description = "A classic martini with a twist."
	taste_description = "dry class"
	boozepwr = 60
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/boneyard_405
	name = "Boneyard 405"
	description = "A new take on a classic drink, straight from the bars of New Adytum."
	taste_description = "traffic"
	boozepwr = 35
	quality = DRINK_NICE
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/nuka_bombdrop
	name = "Nuka-Bombdrop"
	description = "A very alcoholic Nuka-Cocktail."
	taste_description = "a nuka-hangover"
	boozepwr = 80
	quality = DRINK_NICE
	color = "#3E1B00"

/datum/reagent/consumable/ethanol/ms13/nuka_cide
	name = "Nuka-Cide"
	description = "One of everything, please!"
	taste_description = "a nuka-carwreck"
	boozepwr = 20
	quality = DRINK_NICE
	color = "#3E1B00"

/datum/reagent/consumable/ethanol/ms13/nuka_hearty
	name = "Nuka-Hearty"
	description = "For when you want your diabetes-inducing death liquid to be a little healthier, and also alcoholic."
	taste_description = "vegetal nuka-cola"
	boozepwr = 20
	quality = DRINK_NICE
	color = "#3E1B00"

/datum/reagent/consumable/ethanol/ms13/nuka_power
	name = "Nuka-Power"
	description = "Basically a less strong Rum and Nuka."
	taste_description = "nuka-cola"
	boozepwr = 20
	quality = DRINK_NICE
	color = "#3E1B00"

/datum/reagent/consumable/ethanol/ms13/nuka_void
	name = "Nuka-Void"
	description = "A swirling void of sparkling glory."
	taste_description = "nuka-quantum"
	boozepwr = 20
	quality = DRINK_NICE
	color = "#3E1B00"

/datum/reagent/consumable/ethanol/ms13/sm_martini
	name = "Sierra Nevada Martini"
	description = "An improvised drink made from junk food, radioactive runoff, and vodka. Reportedly a favourite in certain casinos."
	taste_description = "sugary filth"
	boozepwr = 50
	quality = DRINK_NICE
	color = "#3E1B00"

/datum/reagent/consumable/ethanol/ms13/sm_martini/on_mob_metabolize(mob/living/M)
	M.adjustBruteLoss(-0.5, 0)
	M.adjustFireLoss(-0.5, 0)
	M.adjustToxLoss(1, 0)
	M.Jitter(5)
	if(prob(10))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/consumable/ethanol/ms13/vier_bier_prost
	name = "Vier-Bier-Prost"
	description = "After all, what's better than one beer? Four beers, mixed together!"
	taste_description = "all the beer"
	boozepwr = 50
	quality = DRINK_FANTASTIC
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/atomic_cocktail
	name = "Atomic Cocktail"
	description = "A favourite from old Nevada."
	taste_description = "the power of the atom"
	boozepwr = 60
	quality = DRINK_FANTASTIC
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/wares_waldo //localised to save American sensibilities, also the worst pun name I've ever come up with
	name = "Ware's Waldo"
	description = "A mix of Ware's Brew, Catseye, Vodka and Cranberry Juice."
	taste_description = "confusion"
	boozepwr = 75
	quality = DRINK_FANTASTIC
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/necromancer
	name = "Necromancer"
	description = "Four taken in quick succession will quickly unrevive a corpse."
	taste_description = "a swift wake-up slap"
	boozepwr = 75
	quality = DRINK_FANTASTIC
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/necromancer/on_mob_life(mob/living/carbon/M)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-40)
	..()
	. = 1

/datum/reagent/consumable/ethanol/ms13/bradberton
	name = "Bradberton"
	description = "Best served frozen."
	taste_description = "nuka-cola"
	boozepwr = 35
	quality = DRINK_VERYGOOD
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/dirty_wastelander
	name = "Dirty Wastelander"
	description = "A pre-war classic adapted to the post-war world."
	taste_description = "a good time"
	boozepwr = 35
	quality = DRINK_VERYGOOD
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/commonwealther
	name = "Commonwealther"
	description = "A recipe from the East, made with Vim."
	taste_description = "smokey seafoam"
	boozepwr = 35
	quality = DRINK_VERYGOOD
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/nawlins_sazerac
	name = "Nawlins Sazerac"
	description = "A favourite from Nawlins, way down South."
	taste_description = "herbs and cognac"
	boozepwr = 50
	quality = DRINK_VERYGOOD
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/gorgon_hound
	name = "Gorgon Hound"
	description = "For when you need to brave the dogs."
	taste_description = "bravado"
	boozepwr = 75
	quality = DRINK_VERYGOOD
	color = "#5D0F0C"

/datum/reagent/consumable/ethanol/ms13/nuka_shandy //nuka-lemon and high-voltage hefe
	name = "Nuka-Shandy"
	description = "A combination of Nuka-Lemon and beer. Really cools you down on a hot day."
	taste_description = "bitter lemonade"
	boozepwr = 10
	quality = DRINK_VERYGOOD
	color = "#fff44f"

/datum/reagent/consumable/ethanol/ms13/coolant_pump //nuka-cola and rad-ant lager
	name = "Coolant Pump"
	description = "Nuka-Cola and beer. Bitter, yet refreshing."
	taste_description = "bitter lemonade"
	boozepwr = 10
	quality = DRINK_VERYGOOD
	color = "#fff44f"

/datum/reagent/consumable/ethanol/ms13/waster_tea
	name = "Waster's Tea"
	description = "A lightly alcoholic hot drink. Tastes medicinal."
	taste_description = "medicine"
	boozepwr = 10
	quality = DRINK_NICE
	color = "#fff44f"

//N for absolutely nobody - Quirky concoctions //
