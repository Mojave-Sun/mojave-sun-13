/datum/reagent/consumable/ms13
	name = "Generic MS13 yummy liquid"
	description = "Yeah probably skip out on this one chief."
	color = "#7c7b7a"
	quality = DRINK_NICE
	glass_name = "glass of liquid" // Keep these generic for flavour!
	glass_desc = "A pale coloured liquid. It screams 'PAIN'." // Same with this. Keep people guessin'. Make em know the drink via flavour and look for immersion.
	glass_icon_state = null

/datum/reagent/consumable/ethanol/ms13
	name = "Generic MS13 alcohol"
	description = "Don't drink this bro	"
	color = "#404030"
	nutriment_factor = 0
	taste_description = "alcohol"
	boozepwr = 20

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
	if(prob(5))
		M.adjustBruteLoss(0.5) //aspartame is bad for your bones. Shoulda just drank water.

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
	glass_name = "glass of clear sparkly liquid"
	glass_desc = "A clear sparkly liquid with a slighty sweet smell. Bubbles form on the side."

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

/datum/reagent/consumable/ms13/nuka_vaccinated //TBD
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
	glass_desc = "A purple fizzy liquid with a slighty berry smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_frutti // Grape/Orange/Cherry
	name = "Nuka-Frutti"
	description = "Perfect for when you're feeling fruity."
	color = "#d8bd72"
	quality = DRINK_VERYGOOD
	taste_description = "strong fruity cola"
	glass_name = "glass of pale yellow fizzy liquid"
	glass_desc = "A pale yellow fizzy liquid with a strong fruit smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_love // Quartz and Cherry
	name = "Nuka-Love"
	description = "Aww, it's pink!"
	color = "#c06968"
	quality = DRINK_VERYGOOD
	taste_description = "sparkling sweet fruit cola"
	glass_name = "glass of pale red sparkly liquid"
	glass_desc = "A pale red sparkly liquid with a slighty fruity smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_rush //Victory and Wild
	name = "Nuka-Rush"
	description = "Fills you with energy."
	color = "#4db13f"
	quality = DRINK_VERYGOOD
	taste_description = "dense ginger soda"
	glass_name = "glass of green fizzy liquid"
	glass_desc = "A deep green fizzy liquid with a slighty fruity smell, just a sniff gives you a bit of a head rush. Bubbles form on the side."

/datum/reagent/consumable/ms13/newka_cola //Cola and Cherry
	name = "newka-Cola"
	description = "Based on the failed Cherry Nuka-Cola, this drink is guaranteed to disappoint."
	color = "#550404"
	quality = DRINK_NICE
	taste_description = "mediocre nuka-cola"
	glass_name = "glass of deep red fizzy liquid"
	glass_desc = "A deep red fizzy liquid with a disapointing bland smell. Bubbles form on the side."

/datum/reagent/consumable/ms13/nuka_free //Cola and Water
	name = "Nuka-Free"
	description = "That's not how diet drinks work, you know."
	color = "#4b3f35"
	quality = DRINK_VERYGOOD
	taste_description = "watered down cola"
	glass_name = "glass of pale murky liquid"
	glass_desc = "A purple fizzy liquid with a slighty berry smell. You can see an occasional bubble."

/datum/reagent/consumable/ms13/nuka_black //Cola and Coffee
	name = "Nuka-Black"
	description = "Cola and coffee, finally married in perfect harmony."
	color = "#3B2F2F"
	quality = DRINK_VERYGOOD
	taste_description = "strong caffinated cola"
	glass_name = "glass of dark liquid"
	glass_desc = "A dark liquid reeking of coffee. Nothing is going on inside the glass."

/datum/reagent/consumable/ms13/vim_refresh
	name = "Vim Refresh"
	description = "Gives you the zip you need to get through the day."
	color = "#8db600"
	quality = DRINK_VERYGOOD
	taste_description = "light apple flavored soda"
	glass_name = "glass of green bubbly liquid"
	glass_desc = "A green bubbly liquid smelling of vague apple."

/datum/reagent/consumable/ms13/sunset_sarsaparilla
	name = "Sunset Sarsaparilla"
	description = "Build mass with sass!"
	color = "#290E05"
	quality = DRINK_VERYGOOD
	taste_description = "mildly sweet dense soda"
	glass_name = "glass of dark fizzy liquid"
	glass_desc = "A dark fizzy liquid with a bland smell. Large bubbles form on the side."

// A for Adult drinks - Alcohols //
/datum/reagent/consumable/ethanol/ms13/nukashine //this stuff makes you harder to stun, but liver hurtie.
	name = "Nukashine"
	description = "The best drink a college freshman could ask for."
	color = "#48c2be"
	quality = null
	boozepwr = 85
	taste_description = "vile burning cola"
	glass_name = "glass of bright blue fizzy liquid"
	glass_desc = "A bright blue fizzy liquid with a overwealming alcoholic smell. You feel like you get a hangover from the fumes itself."

/datum/reagent/consumable/ethanol/ms13/nukashine/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/ephedrine)
	to_chat(L, (span_swarmer("Your stomach burns with pain as you drink the Nukashine!")))

/datum/reagent/consumable/ethanol/ms13/nukashine/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/ephedrine)
	L.clear_fullscreen("nukashine")
	to_chat(L, (span_swarmer("Against it all odds, it looks like the pain faded...")))
	..()

/datum/reagent/consumable/ethanol/ms13/nukashine/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-10, FALSE)
	M.AdjustKnockdown(-10, FALSE)
	M.adjustStaminaLoss(-2, 0)
	M.Jitter(2)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, rand(1,5))
	..()

/datum/reagent/consumable/ethanol/ms13/nuka_dark
	name = "Nuka-Dark"
	description = "A classy blend of Nuka-Cola and dark rum."
	quality = DRINK_NICE
	color = "#3E1B00"
	boozepwr = 40
	taste_description = "alcoholic nuka-cola"
	glass_name = "glass of still dark liquid"
	glass_desc = "A still and dark liquid with a moderate alcoholic smell, with a hint of sweet cola mixed in."

//Mixed Drinks

/datum/reagent/consumable/ethanol/ms13/rum_nuka //Cola and Rum
	name = "Rum and Nuka"
	description = "Rum, mixed with Nuka-Cola."
	quality = DRINK_NICE
	color = "#2c1605"
	boozepwr = 45
	taste_description = "alcoholic nuka cola"
	glass_name = "glass of dark fizzing liquid"
	glass_desc = "A dark fizzing liquid with a fair alcohlic smell to it."

/datum/reagent/consumable/ethanol/ms13/whiskey_nuka //Whiskey and Nuka
	name = "Whiskey and Nuka"
	description = "Whiskey, mixed with Nuka-Cola. Surprisingly refreshing."
	color = "#3E1B00"
	quality = DRINK_NICE
	boozepwr = 60
	taste_description = "strong alcoholic nuka cola with spice"
	glass_name = "glass of dark fizzing liquid"
	glass_desc = "A dark fizzing liquid with a hint of spice and a decent alcohlic smell to it."

/datum/reagent/consumable/ethanol/ms13/vodka_nuka // Vodka and Nuka
	name = "Vodka and Nuka"
	description = "Vodka and Nuka-Cola. For when you love alcohol, but hate the taste."
	quality = DRINK_NICE
	color = "#6e3e18"
	boozepwr = 75
	taste_description = "strong alcoholic nuka cola"
	glass_name = "glass of brown fizzing liquid"
	glass_desc = "A brown fizzing liquid with a sharp alcohlic smell to it."

/datum/reagent/consumable/ethanol/ms13/mammoth_bait // Soot flower Powder / Prickly pear Juice / Vodka
	name = "Mammoth Bait"
	description = "A recipe passed down through the generations in Mammoth. Perfect for warming up in the eversnow."
	taste_description = "coffee with a kick"
	quality = DRINK_NICE
	color = "#ce99c2"
	boozepwr = 25
	taste_description = "off-tasting caffinated alcohol"
	glass_name = "glass of dull pink liquid"
	glass_desc = "A dull pink bubbly liquid with a strange smell- Vaguely alcoholic."

/datum/reagent/consumable/ethanol/ms13/atomic_cocktail // Mentat powder / Nuka Victory / Vodka
	name = "Atomic Cocktail"
	description = "A favourite from old Nevada."
	taste_description = "the power of the atom"
	quality = DRINK_FANTASTIC
	color = "#A6B199"
	boozepwr = 60
	taste_description = "ginger-y caffinated alcohol with chemicals"
	glass_name = "glass of pale green liquid"
	glass_desc = "A pale green liquid with a strange smell. Based on smell, definitely has alcohol."

/datum/reagent/consumable/ethanol/ms13/wares_waldon // Yeah what he said down there
	name = "Ware's Waldon"
	description = "A mix of Ware's Brew, Catseye, Vodka and Cranberry Juice."
	taste_description = "confusion"
	quality = DRINK_FANTASTIC
	color = "#5D0F0C"
	boozepwr = 75
	taste_description = "berry alcohol with a hint of chemicals"
	glass_name = "glass of red liquid"
	glass_desc = "A red liquid with a strange film on the top. Reeks of alcohol.."

/datum/reagent/consumable/ethanol/ms13/necromancer // Vodka / Rum / Ash Blossom powder
	name = "Necromancer"
	description = "Strong enough to wake the dead.."
	quality = DRINK_NICE
	color = "#360705"
	boozepwr = 75
	taste_description = "intense alcoholic taste with nostril burning"
	glass_name = "glass of dark red liquid"
	glass_desc = "A dark red liquid with particles floating around in it. Intense alcoholic aroma."

/datum/reagent/consumable/ethanol/ms13/necromancer/on_mob_life(mob/living/carbon/M)
	M.drowsyness = max(0,M.drowsyness-3)
	M.AdjustSleeping(-20)
	..()
	. = 1

/datum/reagent/consumable/ethanol/ms13/dirty_wastelander // Mutfruit / Nuka / Whiskey
	name = "Dirty Wastelander"
	description = "A pre-war classic adapted to the post-war world."
	quality = DRINK_VERYGOOD
	color = "#703817"
	boozepwr = 35
	taste_description = "spiced fruit cola with alcohol"
	glass_name = "glass of dull orange liquid"
	glass_desc = "A dull orange liquid with a spiced fruity smell to it. Has alcohol in it, though the amount is uncertain."

/datum/reagent/consumable/ethanol/ms13/nawlins_sazerac // Cognac / Coyote tobacco powder
	name = "Nawlins Sazerac"
	description = "A favourite from Nawlins, way down South."
	quality = DRINK_VERYGOOD
	color = "#d85016"
	boozepwr = 50
	taste_description = "bitter herb-y alcohol with a strange aftertaste"
	glass_name = "glass of orange liquid"
	glass_desc = "A orange liquid with small leaf bits floating around in it. Decent alcoholic smell."

/datum/reagent/consumable/ethanol/ms13/clogged_pump //nuka-cola / rad-ant lager
	name = "Clogged pump"
	description = "Nuka-Cola and brewed ant meat. Interesting."
	quality = DRINK_VERYGOOD
	color = "#552c2b"
	boozepwr = 25
	taste_description = "meat tinted soda with hint of alcohol"
	glass_name = "glass of dark red liquid"
	glass_desc = "A dark red liquid with a slight sweet meat-y smell. Strange. You can also pick up hints of alcohol in it."

//B for Brewed - Home brewed fun //

// Basic Brews //

/datum/reagent/consumable/ethanol/ms13/barrel_wine
	name = "Barrel cactus wine"
	description = "Wine brewed from a barrel cactus fruit. Tangy."
	quality = DRINK_GOOD
	color = "#dbcb35"
	boozepwr = 25
	taste_description = "tangy barrel fruit wine"
	glass_name = "glass of yellow liquid"
	glass_desc = "A dark red liquid with a slight sweet meat-y smell. Strange. You can also pick up hints of alcohol in it."

/datum/reagent/consumable/ethanol/ms13/waster_tequila //Agave
	name = "Wasteland Tequila"
	description = "A rough-and-ready tequila born of the wasteland."
	quality = DRINK_NICE
	color = "#b6b687"
	boozepwr = 65
	taste_description = "rough agave alcohol"
	glass_name = "glass of bright blue fizzy liquid"
	glass_desc = "A faint pale yellow liquid with a familiar distant agave smell to it. Smells pretty alcoholic."

/datum/reagent/consumable/ethanol/ms13/waster_tequila/on_mob_life(mob/living/carbon/M)
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(-1*REM, 0)
		. = 1
	if(holder.has_reagent(/datum/reagent/toxin))
		holder.remove_reagent(/datum/reagent/toxin, 0.5)
	..()

// Combination Brews //

/datum/reagent/consumable/ethanol/ms13/ballistic_bock // Gunpowder, Wheat
	name = "Ballistic Bock"
	description = "A dark, malty ale complemented perfectly with gunpowder."
	quality = DRINK_NICE
	color = "#5D0F0C"
	boozepwr = 30
	taste_description = "faint gunpowder and beer"
	glass_name = "glass of dark liquid"
	glass_desc = "A dark and liquid. It smells faintly of alcohol and gunpowder."

/datum/reagent/consumable/ethanol/ms13/rad_ant_lager // Rad ant meat, Wheat, Uranium???
	name = "Rad Ant Lager"
	description = "A light, hoppy beer complemented exquisitely with Rad Ant meat."
	quality = DRINK_NICE
	color = "#864b49"
	boozepwr = 30
	taste_description = "meat tinted alcohol"
	glass_name = "glass of pale red liquid"
	glass_desc = "A faint pale red liquid with a slight meat-y smell. Strange. You can also pick up hints of alcohol in it."

/datum/reagent/consumable/ethanol/ms13/swift_recovery // Brain fungus and Tato
	name = "Swift Recovery brew"
	description = "A flavorful and light beer. Reeks of fungus."
	quality = DRINK_NICE
	color = "#cead42"
	boozepwr = 35
	taste_description = "tato and fungus flavored alcohol"
	glass_name = "glass of pale orange liquid"
	glass_desc = "A pale orange liquid. It reeks of fungus and has hints of tato."

/datum/reagent/consumable/ethanol/ms13/swift_recovery/on_mob_life(mob/living/carbon/M)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(-5,-1))
	if(M.getToxLoss() && prob(20))
		M.adjustToxLoss(1*REM, 0)
		. = 1
	..()

/datum/reagent/consumable/ethanol/ms13/fire_wine // Firecap and xander
	name = "Fire Wine"
	description = "Perfect for warming yourself in the harsh winters."
	quality = DRINK_NICE
	color = "#2b0b0a"
	boozepwr = 35
	taste_description = "rough spiced alcohol"
	glass_name = "glass of deep red liquid"
	glass_desc = "A deep red liquid with a spiced aroma. Smelling it brings a comforting aura."

/datum/reagent/consumable/ethanol/ms13/fire_wine/on_mob_life(mob/living/carbon/M)
	M.adjust_bodytemperature(25 * TEMPERATURE_DAMAGE_COEFFICIENT, 0, M.get_body_temp_normal())
	..()
	. = 1

/datum/reagent/consumable/ethanol/ms13/waster_tea // Ash Rose / Broc
	name = "Waster's Tea"
	description = "A lightly alcoholic hot drink. Tastes medicinal."
	quality = DRINK_NICE
	color = "#a39d46"
	boozepwr = 10
	taste_description = "filling herbal brew with slight alcoholic burn"
	glass_name = "glass of pale green liquid"
	glass_desc = "A faint pale green liquid with an herbal smell to it. Faintly alcoholic"

/datum/reagent/consumable/ethanol/ms13/waster_tea/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(rand(1,2))
	M.AdjustSleeping(15)
	..()
	. = 1

/datum/reagent/consumable/ethanol/ms13/herb_brew // Coyote tobacco and lureweed
	name = "Herbal Brew"
	description = "An alcoholic herbal brew, made by tribals from the local forage."
	quality = DRINK_GOOD
	color = "#66693b"
	boozepwr = 10
	taste_description = "rough soothing broth"
	glass_name = "glass of pale-ish green liquid"
	glass_desc = "A faint pale-ish green liquid with an herbal smell to it with distant bitterness. Faintly alcoholic"

/datum/reagent/consumable/ethanol/ms13/herb_brew/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-1)
	M.drowsyness = (5)
	..()
	. = 1

/datum/reagent/consumable/ms13/gagquik // Med-X / Cola :denthead:
	name = "Gagquik"
	description = "A common wastelander brew in case of injesting poisonous substances."
	color = "#3a502b"
	quality = DRINK_VERYGOOD
	taste_description = "putrid herbs and fruit"
	glass_name = "glass of murky green liquid"
	glass_desc = "A murky green liquid with bits of plant matter floating at the top. Has a vile smell to it."

/datum/reagent/consumable/ms13/gagquik/on_mob_life(mob/living/carbon/M) // This definitely won't be slipped into drinks
	if(prob(25))
		M.vomit(lost_nutrition = 10, distance = 1, purge_ratio = 0.5)
	..()

//N for NOBODY should consume - Horrible mixtures //

/datum/reagent/consumable/ms13/nuka_lixir // Med-X / Cola :denthead:
	name = "Nuka-Lixir"
	description = "...Who thought this was a good idea?"
	color = "#2accc7"
	quality = DRINK_VERYGOOD
	taste_description = "intense burning chemical taste and soda"
	glass_name = "glass of pale blue fizzy liquid"
	glass_desc = "A pale blue fizzy liquid with a slighty sweet smell."

/datum/reagent/consumable/ms13/nuka_lixir/on_mob_life(mob/living/carbon/M) // Other effects TBD once med-x is in
	if(prob(15))
		M.adjustOrganLoss(ORGAN_SLOT_STOMACH, rand(1,10)) // They ignored the label: Not for oral consumption
	..()

/datum/reagent/consumable/ethanol/ms13/lead_champagne // lead powder / Champagne - What a cruel joke.
	name = "Lead Champagne"
	description = "Are you sure this is safe to drink?"
	quality = DRINK_NICE
	color = "#7c1f4d"
	boozepwr = 35
	taste_description = "dense champagne"
	glass_name = "glass of a reddish-purple liquid"
	glass_desc = "A reddish-purple liquid with a distant fruit aroma to it, occasional black flakes can be seen floating around. Alcohol is present in it, albeit not too strong."

/datum/reagent/consumable/ethanol/ms13/lead_champagne/on_mob_life(mob/living/carbon/M)
	if(prob(20))
		M.radiation -= min(4, M.radiation)
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(1,5))
	..()
