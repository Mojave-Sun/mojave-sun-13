/// THIS FILE HOSTS THE SNOWFLAKE STRUCTURES USED TO CREDITING DEVS. /// 
/// NOT TO BE USED ANYWHERE BUT MOJAVECOM /// 
/// TO WHOMEVER IT MAY CONCERN- IF YOU REMOVE THESE YOU'RE NOT A VERY GOOD PERSON. /// 

/obj/structure/ms13/developer_credit
	icon = 'mojave/icons/structure/ms_devs.dmi'
	var/cause_of_death
	var/known_for

/obj/structure/ms13/developer_credit/examine(mob/user)
	. = ..()
	. += span_notice("Known for: [known_for]")
	. += span_danger("Root of Demise: [cause_of_death]")

/obj/structure/ms13/developer_credit/infrared_baron
	name = "INFRARED_BARON"
	icon_state = "INFRARED_BARON"
	desc = "A master artist, responsible for 95% of the assets seen within the MS13's staggering roster of sprites."
	cause_of_death = "Overspriting"
	known_for = "Over-over-spriting"

/obj/structure/ms13/developer_credit/bobjoga
	name = "Bob Joga"
	icon_state = "Bobjoga"
	desc = "A high octane coder, the creator of many of our beloved systems. Namely- Tetris inventory and DT armour."
	cause_of_death = "Mental rot"
	known_for = "Epic coding"

/obj/structure/ms13/developer_credit/fattybunbah
	name = "Fattybunbah"
	icon_state = "Fattybunbah"
	desc = "Talented Music producer, responsible for our three unique titlescreen themes."
	cause_of_death = "Got too dry"
	known_for = "Fantastic lobby music"

/obj/structure/ms13/developer_credit/badatthisgame
	name = "badatthisgame"
	icon_state = "BadAtThisGame"
	desc = "A fun face and a good mapper! Helped us when we needed it. For that we owe a thanks."
	cause_of_death = "Murdered by Riddler"
	known_for = "Crossing into Riddler's mapping territory"

/obj/structure/ms13/developer_credit/sparrowbird611
	name = "Sparrowbird611"
	icon_state = "Sparrowbird611"
	desc = "Took matters into their own hands and pulled up the bootstraps, aiding in some balancing issues/oversights and adding silly features."
	cause_of_death = "Poked a shotgun with a screwdriver while it was loaded"
	known_for = "Aspiring balancetainer"
	
/obj/structure/ms13/developer_credit/uzbekdime
	name = "{Uzbek}Dime"
	icon_state = "Dime"
	desc = "Second in command of mapping soul. Make excellent californian shitholes- added a lot of soul to our maps where it lacked."
	cause_of_death = "Too many PFP changes"
	known_for = "Turning empty buildings into californian paradises and winning PVP events"

/obj/structure/ms13/developer_credit/mrpibb
	name = "Mr Pibb"
	icon_state = "MrPibb"
	desc = "Everyone's favourite blogger. A good friend and occasional mapper. Added in some inspired locations when nobody else would. Also contributed his voice towards our Mumbleboop system- thanks for it all."
	cause_of_death = "Shared his political views"
	known_for = "mr-pibbs-site.neocities"

/obj/structure/ms13/developer_credit/hyperio
	name = "Hyperio"
	icon_state = "Hyperio"
	desc = "Atlas personified. A noble coder who held up our github during the beginning of the end. Added numerous soulful features with lots of character. Many thanks for all he did in such a short time."
	cause_of_death = "Fell into a grave building his bridge"
	known_for = "Digging graves and building bridges"

/obj/structure/ms13/developer_credit/thatguythere
	name = "Thatguythere03"
	icon_state = "ThatGuyThere"
	desc = "A pioneer of the Legion on MS13. A faction that unfortunately didn't see much light of day, they gave us a good semi-unique aesthetic and wonderful sprites."
	cause_of_death = "Crossed"
	known_for = "Witnessing the fall of the west"

/obj/structure/ms13/developer_credit/keks
	name = "Kekskruemelkittey"
	icon_state = "Kekskruemelkittey"
	desc = "A talented spriter and mapper. Helped us towards the beginning while we built up and made an incredible amount of buildings when Mammoth was still in its baby stage. Provided their voice for the Mumbleboop system."
	cause_of_death = "Stabbed to death at 3am in downtown New York by rapscallions"
	known_for = "Superb fridge sprites"

/obj/structure/ms13/developer_credit/starlesshorizon
	name = "StarlessHorizon"
	icon_state = "StarlessHorizon"
	desc = "A wonderful spriter that gave us many iconic assets that are used pretty much everywhere."
	cause_of_death = "Tripped over a railing that didn't get coded right, snapping their neck in 5 places."
	known_for = "Railing us"

/obj/structure/ms13/developer_credit/rapird
	name = "Rapird"
	icon_state = "Rapird"
	desc = "Top bloke that gave us many inspired sprites. Creator of the Hellpig. Good spriter and a voice donor for the Mumbleboop system."
	cause_of_death = "Killed for janitor inactivity"
	known_for = "Revolutionizing fear of walking in a forest alone"

/obj/structure/ms13/developer_credit/memager
	name = "Memager"
	icon_state = "Memager"
	desc = "Top tier spriter that helped us upon occasion- namely during the earlier stages of MS13. Made epic pool tables that we used to set anything but pool cues or balls on."
	cause_of_death = "died of natural causes at the ripe age of 82"
	known_for = "Masterfully crafted pool tables and fixing 1glitchycent's drawings"

/obj/structure/ms13/developer_credit/spookywastaken
	name = "Spookywastaken"
	icon_state = "SpookyWasTaken"
	desc = "Insanely good spriter. Very fun to work with and had incredibly inspired designs. Responsible for making even our worst faction additions look fucking awesome."
	cause_of_death = "Robbed by Goldmen"
	known_for = "Making bad men look good"

/obj/structure/ms13/developer_credit/gomble
	name = "Gomble"
	icon_state = "Gomble"
	desc = "Very fun guy and a good coder. Potentially could have revolutionized us at least 20 times over and is the inventor of PartiCool! Made our day/night cycles, weather, and many more additions. Inspired us to try to be the best."
	cause_of_death = "Veganism-induced nutrient deficiency while hiding in a hut during a radstorm"
	known_for = "Sadistic veganism (killed animals and farmed them on vintage story)"

/obj/structure/ms13/developer_credit/hekzder
	name = "Hekzder"
	icon_state = "Hekzder"
	desc = "Head balancetainer. Nobody runs numbers like this guy- essentially the sole reason our game's balance was near perfect the first time around every time. Added an ungodly amount of assets and was a pillar of our dev team."
	cause_of_death = "Mingus jones"
	known_for = "Mingus jones and balancing"

/obj/structure/ms13/developer_credit/killa
	name = "Killa"
	icon_state = "Killa"
	desc = "Insanely good coder. Gave us many good features. Power armour modularity was wonderful- even if we didn't utilize it to its fullest. We let him down by not getting PERSON functional."
	cause_of_death = "Body torn in half while operating a faulty T51B power armour set"
	known_for = "Inventing power armor"

/obj/structure/ms13/developer_credit/polyzonial
	name = "Polyzonial"
	icon_state = "Polyzonial"
	desc = "The Baron's head Water technician. Established pipelines within the Barony, as well as ensured the people of Drought would never get a sip of water again as long as it wasn't by His command. Helped us a lot in earlier stages too- including giving NCR radio backpack soul."
	cause_of_death = "Fell into a water resevoir and drowned"
	known_for = "Plumbing, radio technology, and more."

/obj/structure/ms13/developer_credit/minegriss
	name = "Minegriss"
	icon_state = "Minegriss"
	desc = "An OG admin. During our earlier stages, added a bunch of assets in for us. Many of their additions are still used to this day. Helped us when everyone else didn't have the balls to- Godspeed, soldier."
	cause_of_death = "Suffocated while between a bedframe and a mattress"
	known_for = "Being a gross janitor... and a good friend."

/obj/structure/ms13/developer_credit/technobug
	name = "Technobug"
	icon_state = "Technobug"
	desc = "The king of fishing. Added many things that he deemed fun and gave ideas for ten-fold that. Stealthboys were never this cool..."
	cause_of_death = "Beaten to death by a Sturgeon while fishing under Snowcrest in a small sewer outelt."
	known_for = "Fishing, ideas, and fishing ideas."

/obj/structure/ms13/developer_credit/therealscarhomie
	name = "TheRealScarHomie"
	icon_state = "TheRealScarHomie"
	desc = "A real homie. Sprited the grand majority of our clothing at one point. Added lots of soul features including porting numerous insanely useful systems. A pillar of our development and a fun guy. Growing tobacco and rolling cigarettes were revolutionized by this man."
	cause_of_death = "Found the tobaccer. It was laced."
	known_for = "SOUL!!!"

/obj/structure/ms13/developer_credit/theriddler
	name = "The Riddler"
	icon_state = "TheRiddler"
	desc = "The best mapper SS13 will ever know. Crafted incredibly complex environments and is the king of making great looking bad places. #1 above all- hire this man. Inventor of KOBAN as we know it today. Overall a great dude and basically made the majority of our two maps."
	cause_of_death = "Impaled by KOBAN"
	known_for = "Making entire countries worth of quality buildings"

/obj/structure/ms13/developer_credit/koshenko
	name = "Koshenko"
	icon_state = "Koshenko"
	desc = "The father of teaching. Guided all of the brainless little whelps back even when we were just trading files over DMs. Huge props to him for reaching and working with us. Would have been literally impossible to make it this far without him."
	cause_of_death = "Executed for usurping Host role via stoning."
	known_for = "Teaching morons and hosting the server/maintaining the box."

/obj/structure/ms13/developer_credit/originalidea
	name = "Original Idea"
	icon_state = "Original_Idea"
	desc = "Unwilling developer who just wanted a fun game to play- didn't actually play a single round. Maptainer and unfortunate head janitor."
	cause_of_death = "Burned at the stake for being a janitor"
	known_for = "Killing what you all loved"

/obj/structure/ms13/developer_credit/lord_of_cringe
	name = "ChLorine"
	icon_state = "Chlorine"
	desc = "Pioneer of the mumbleboop aesthetic. Helped us invent a format to make the coolest pseudo-TTS system there is around. Did numerous mapping PRs and is overall a great big brother to MrPibb."
	cause_of_death = "Choked on a microphone while experimenting with mumbleboops"
	known_for = "Being the father to mumbleboops"

/obj/structure/ms13/developer_credit/oneglitchycent
	name = "1glitchycent"
	icon_state = "1glitchycent"
	desc = "A strong personality and the spriter of Atlas Ironworks. Even though they never got coded- were easily one of the more inspired faction concepts we've had and could have saved us all. Many thanks for putting in the effort."
	cause_of_death = "Caught taking a break- executed by Severance Administrator"
	known_for = "Founding the most efficient company in northern California."

/obj/structure/ms13/developer_credit/ma44
	name = "ma44 (Doughe)"
	icon_state = "ma44"
	desc = "Dough. Incredibly helpful during the beginning stages and even later on provided incredibly helpful things. Boss mobs were incredible and a great source of entertainment for us all."
	cause_of_death = "Filled with lead from Reaper"
	known_for = "Terrorizing dungeon runners"

/obj/structure/ms13/developer_credit/therest
	name = "And Everyone Else"
	icon_state = "therest"
	desc = "Tomb of the unknown dev: Many people have contributed to our success, no matter how 'little' or few times they'd come forward. \
	Putting in an amount of effort towards something you want to see succeed is the only way to ensure that such a place thrives. \
	This is a blanket apology and thanks for even one-off contributors that simply wanted a thing or two fixed. You helped us more than you know."
	cause_of_death = "Hit by a nuke"
	known_for = "Taking initiative to make something 'okay' feel great."

/// BONUS CONTENT: little versions of things we like /// 

/obj/item/toy/plush/ms13
	icon = 'mojave/icons/structure/ms_devs.dmi'

/obj/item/toy/plush/ms13/reaper
	name = "Reaper"
	icon_state = "sentry_plush"
	desc = "A very menacing creature full of malice and hatred. do NOT mess with this thing."

/obj/item/toy/plush/ms13/hellpig
	name = "hellpig plush"
	icon_state = "hellpig_plush"
	desc = "The original hogwild beast."

/obj/item/toy/plush/ms13/severance
	name = "Severance Administrator"
	icon_state = "severance"
	desc = "A very large and mighty administrator! Beware!"

/obj/item/toy/plush/ms13/koban
	name = "KOBAN"
	icon_state = "KOBAN"
	desc = "The terror of the streets. This beast shook Snowcrest countless times- and it never got old. Not once."

/obj/item/toy/plush/ms13/koban/use(used)
	to_chat(usr, span_notice("You squeeze the [src]"))
	playsound(src, 'mojave/sound/ms13npc/hellpig_attack1.ogg', 90, TRUE)

/obj/item/ms13/nonsense
	desc = "Random bullshit dev references."
	icon = 'mojave/icons/structure/ms_devs.dmi'

/obj/item/ms13/nonsense/lubeman
	name = "Lubeman bodypillow"
	icon_state = "lubeman"
	desc = "An honest to-scale replica of Lubeman! Original never even watched watchmen. He just thought the pfp was funny."

/// fridge
/obj/item/ms13/nonsense/fridge
	name = "fridge"
	icon_state = "fridge"
	desc = "fridge"

/obj/item/ms13/nonsense/hammer
	name = "Atlas' Hammer"
	icon_state = "atlas_hammer"
	desc = "A mighty sledge used to destroy the most unefficient workers of Atlas Ironworks"

/obj/item/ms13/nonsense/nuke
	name = "fatman"
	icon_state = "mininuke"
	desc = "A totally real mininuke launcher."

/obj/item/ms13/nonsense/nuke/pickup(mob/living/carbon/user)
	. = ..()
	to_chat(usr, span_narsie("NOT WORTHY."))
	user.gib()

/// MOJAVECOM AREAS/TRACKS /// 

#define FATTY_ATMOSPHERE list('mojave/sound/ms13music/lobby/droughtsong.ogg', \
							'mojave/sound/ms13music/lobby/the_west.ogg', \
							'mojave/sound/ms13music/lobby/the_underground.ogg')

/area/ms13/start_area
	name = "Mojavecom"
	icon_state = "mojavecom"
	requires_power = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	outdoors = TRUE
	atmosphere_sound = BUILDING_ATMOSPHERE

/area/ms13/start_area/museum 
	name = "Museum of the Fallen"
	icon_state = "mojavemuseum"
	outdoors = TRUE
	atmosphere_sound = FATTY_ATMOSPHERE

#undef FATTY_ATMOSPHERE

/// NOTES BY ORIGINAL IDEA: TO WHOMEVER IT MAY CONCERN /// 

/* 

This server started with basically nothing. It's possible to make anything you want to- you just need to do it.
Pull up those bootstraps and make what you want to, other people aren't going to just make all of your ideas for you. 
If we did it, you can too. Make the server of your dreams and truly care for it and put in effort. 
So little people care for quality not. Not to say we shat sunshine but our community was one that truly cared about making something we all liked and cared for. 
Be whatever change you want to be. Don't take shit seriously. Go have whatever fun you can muster- it's just a game. 

Smile because it happened. 

P.S: Don't descecrate these graves. These are all people that put in vast amounts of efforts and deserve to be recognized. Include this shit, dummy. 

P.P.S: Sorry about the runtimes if you're trying to host this shit. We know. It's not incredible. The proc errors especially- shoutout to upstream changes am i right? 

P.P.P.S: On the same hand, i'm not sharing any of the shortcomings we discoverered or the ultra-niche intricacies we had to work around. Good fkin luck lmao.

*/
