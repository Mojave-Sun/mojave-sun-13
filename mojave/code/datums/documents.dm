/datum/terminal/document
	var/title = "Vault-Tec Explains: What IS a GECK?"
	var/content = "This space has been left intentionally blank."

/datum/terminal/document/readme
	title = "Read Me"
	content = "Welcome to your new RobCo Terminal, running the RobCo Unified Operating System! \
	You have taken the first step in modernizing your home, office, or industrial complex simply \
	by purchasing this product, but the possibilities for improvement are endless. \
	<br><br>To get you started, this terminal comes pre-loaded with RobCo Word Processor. If you'd \
	like access to even more programs, you may purchase them in holotape format at your nearest \
	RobCo Industries supply store. \
	<br><br>Welcome to the future. We hope you enjoy your stay."

/datum/terminal/document/corrupted
	title = "ERROR 0x07F6BAAC"
	content = "Bad data. Cannot read \
	<br><br>Contact Administrator for assistance or send a letter to your local RobCo facility and fill a repair request."

/datum/terminal/document/joker //For rigged terminals
	title = "Got you!"
	content = "Hear that ticking? I bet you do. That's right- you fell for it. You're an IDIOT. By the time you even finish reading this, the bomb stashed in the back of the terminal is destined to go off. Should have used your eyes, you damn idiot.\
		I would say let this be a lesson- But you're already dead, no?"

// Mammoth specific notes //

/datum/terminal/document/vault_door_notice // Explaining to the libs why there's only one gate, and why they can't be shut-ins. BTFO.
	title = "Dual-Loc Chamber Notice"
	content = "Attention gatesman! \
		The exterior chamber entryway has a critically damaged component. Further use at best will outright refuse to function and potentailly completely ruin it further at worst. \
		<br><br>Do NOT attempt to link the terminal to it and move it. It can SERIOUSLY destroy it. We've got a scheduled order in coming in next week, after that- we can get it working again on time. \
		<br><br>\
		<br><br> Thank you for your cooperation."


/// NCR TERMINALS ///
/datum/terminal/document/ncr_disciplinary // Snowcrest NCR holding cell terminal rundown
	title = "General Holding Cell Procedure"
	content = "This holding cell is to house no more than five people as long as the situation allows it. \
		<br><br>The purpose of this cell is to allow transparency to the inhabitants of Snowcrest that their fellow man will not be harmed under our law, even if held under scrutiny. \
		<br> You are to hold them for their sentence in this general holding cell for as long as they are peaceful. If they become hostile, they may be sent to the individualized incapacitation cells downstairs. \
		<br><br> If in the event, for whatever reason, you detain individuals NOT OF CITIZENSHIP of Snowcrest, they should be removed from the town's premises. If the crime is harsh enough, they are to be sent straight to the IIC's. \
		<br> If a crime IS substantial enough, with fair trial and the blessing of the highest ranking, death by firing squad may be dealt. \
		<br><br> This is all necessary in order to maintain peace. Do not act in your own interests."

/datum/terminal/document/ncr_sergeant_breakdown // Snowcrest NCR sergeant's terminal
	title = "To the Sergeant it may concern"
	content = "Congratulations on being chosen for this position! \
		<br><br>Snowcrest is a hell of a town. I don't know you, but I'm sure you'll protect it well. \
		<br> There's some fine folk here. Not without fault of course. There's been a history of a bit of... dishevelment... in the past. The establishment of the Republic here wasn't a very easy process but we're just about set. \
		<br> Most of the people here mean well. Even if they don't know it. Try not to ruin relations with them and get yourself kicked out, yeah? Hah, I kid. \
		<br> Anyways. That Mayor is a character indeed. A bit pompous sometimes. Though you can never really know what they're going to give you on a day to day. The guards are real protective. Be careful of them. Some of them have yet to warm up to us. \
		<br> Seriously though. Be careful. When our ambassador was here talking to them, there was some unruly individuals about. We nearly had a riot break out at one point as papers were just finished getting signed. \
		<br><br>\
		<br><br> Stay Vigilent. Signing off, Staff Sergeant Williams"

/datum/terminal/document/ncr_front_gate // Snowcrest front "gate" terminal
	title = "Shipment delay"
	content = "Bad news. \
		<br> The materials for the gate we requested has gotten backed up consideraby due to something happening with a supplier. The exact details aren't known to us, yet.\
		<br> As you may or may not have known. The Engineers were SUPPOSED to be coming in with their little mile long caravan of scrap and components to get the gate up a month after you guys were stationed in Snowcrest. Alas, here we are.\
		<br> That means YOU get the privilege of doing this the old fashioned way. As I type this we're setting up a bit of a temporary checkpoint. It's nothing special, but you guys can improve on it if you want. \
		<br><br> Not like you have much else to do other than sit around anyways, huh? \
		<br>Good luck, and don't forget... To have fun!"

/// BROTHERHOOD TERMINALS //
/datum/terminal/document/brotherhood_hint // BOS reminder to not ignore their loot
	title = "Supply count"
	content = "Before the departure of the last chapter splinter, they took the liberty of leaving behind some excess equipment.  \
		A lot of our hardware should be in the generator room's crates. Look around for a crowbar and start busting them open- They can't stay there forever. \
		According to one of them, they're actually kind enough to keep some medical supplies with us. Check the storage for them below the medical bay. \
		<br><br>The supplies are fantastic and well appreciated- But we need to remember to keep an eye out when we're out on the field. Take what you can, the opportuntiy might not arise again."

/datum/terminal/document/brotherhood_hint_two // BOS reminder to not fly out the rear entrance and get fragged by shellheads
	title = "About the rear entrance"
	content = "Attention! Heed caution exiting through the rear tunnels. Recently, mirelurks have taken to a liking of the pools out back.  \
		It wouldn't be the first time a simple thing as a mirelurk has claimed one of our own... You all much exercise caution when going out through the back. Not like there's much point anyways. The tunnels probably don't lead anywhere. \
		If you REALLY insist on going out there, bring at least on partner and log your exit with your nearest superior. Keep a flashlight handy and stay in the light. Good luck."

// PREWAR MILITARY TERMINALS //

/datum/terminal/document/military_base_lockdown // Tunnel outpost
	title = "Emergency Lockdown Protocol"
	content = "By orders of Major Handfordth any posted guard is required to read the following. \
		<br><br>This post is multi-functioned and should be kept online unless absolutely necessary. Primary priority following a high security threat is to put the facility under yellow alert and await further instruction. \
		<br><br>In the event of a catastrophic event and or declaration of DEFCON level two and up, this point should only be put under complete lockdown under orders of a Lieutenant colonel or higher. \
		<br><br>Non-compliance with this standard will- depending on conditions- at the very best earn you a swift loss of rank. At worse... Try it and find out, in Major Handfordth's terms."

/datum/terminal/document/military_bunker_lockdown // Bottom-right military bunker
	title = "Emergency Lockdown Protocol"
	content = "In case of catastrophic event, the Major has given this post the all-clear to proceed with mobilization.  \
		Inform the soldiers to rally to their superiors and begin the lockdown procedure. This will unlock the armory and unlock the protectron storage. \
		Once prepared, the base will be required to evacuate sub-THIRTY minutes. Any stragglers must be arrested or shot. By this point, anyone could be an enemy. Keep this log out of sight.area \
		A verti-bird will be dispatched to the base's pads and any soldiers that remain in our control will be sent off to the compound directly north-west of here. Further instructions pending once on site."


/datum/terminal/document/military_crypt_initial // Topright military bunker outpost - First log
	title = "Downfall"
	content = "Well. Here it is. Today marks my ONE YEAR anniversary of being in this dumphole. I think I'll go ahead and do one of these every year until the storage slots fill up, and run out of storage space. What a shame that these things come with so little capacity.   \
		You know, I've had a LOT of time to think on it. Perhaps these things have been upgraded by any survivors out there... If there is any, anyways. I could probably try my hand in it...\
		The boredom is... boring. I've written a thousand of these logs, but just have to write over them because of the lack of storage on this damn thing.\
		<br><br>They told me to NEVER leave this casket of mine... Stand your post until the cavalry arrives! At least that's what they said. A dozen brainshaking explosions in the distance and a year later and I think that's not going to be happening.\
		All the food and supplies I could ever need for the next two years in case of a disaster... Though I question the validity of that claim, even with me rationing my food as painfully as I can. I suppose I'll find out in a year.\
		<br><br>I am a guard. My job is to guard. I sit in this chair and guard. I will guard until they arrive and relieve me of post. As long as I keep this thought with me, I can retain my sanity."

/datum/terminal/document/military_crypt // Topright military bunker outpost - Fifth log
	title = "An Eternity"
	content = "Five years ago, I was given the 'special' opportunity of being a guard to this outpost.   \
		Five. Years. FIVE. years. Five years of my life glued to this god damn chair. Five YEARS. I've written this log a million times over just to keep my brain occupied. Many people couldn't comprehend being stuck in your own mind for a week, let alone what I believe to be five years.\
		<br><br>Note to me: The paid tuition wasn't worth it. None of this shit was.\
		<br><br>I sit in this chair rotting away... both mentally and physically. My skin has turned to a nasty wrinkled mess and i've begun developing a rasp in my voice- perhaps from all the talking I've done to myself over these years.\
		As the terminal hums and clicks in my ear. I stare out into the darkness of the viewport and have seen nothing until recently... I believe I've started seeing movement outside.\
		Anyways. I suppose there isn't any delay. I set out a promise four years ago- This is my fifth annual saved log, and I've no longer got any storage left. I tried tinkering with the terminal a few years back, but I think I might have dinged something and broke the storage.\
		I'll cry long after i'm gone if it turns out I have damaged the last of my legacy- these logs are my one chance to get my story out to anyone.\
		<br><br>What seems to be a lifetime of paranoid anticipation and lethal boredome has left me to this very moment. When I wake up later, I'll be releasing the preservation seal and venturing back out into the world I once knew. I'll be taking my rifle with me, god only knows if the communists won."

/datum/terminal/document/military_crypt_unlock // Topright military bunker outpost - terminal to unlock armory
	title = "Armory Unlock note"
	content = "To the guardsman whom it may concern: You should be at your POST. You were specifically ordered to NEVER exit your post. The very fact you're even seeing this is enough to get you shot for insubordinance. \
		<br><br>Now that you're here, this is the part where I tell you to never unlock the armory! Why you may ask? Because it also unlocks the security bay for the sentry bot, who was programmed to be VERY adamant on the integrity of our storage.\
		<br><br>I leave this note not for your personal integrity, but as a plead for you to avoid having him blow up our reserves before the rest get there. Trust me, there will be nothing left. \
		<br><br>If I've got to clean your body off of anything that may have survived, I'll personally scoop your brains up and pour it into a robobrain tank. Consider that before you toy around with things above you."

//// MINI MAMMOTH SPECIFIC ////

// Upper military

/datum/terminal/document/upper_mil_morning // Mini mammoth military base gatehouse morning logs
	title = "Entry Log - Morning Shift"
	content ="Date: 10/22/2077 \
		<br>07:30 AM Recorded the following personnel and vehicle entries during the morning shift: \
		<br>07:32 AM: Private Hogg - Personnel Entry \
		<br>07:45 AM: Supply Truck A-12 - Cargo Entry (Manifest ID: MT567) \
		<br>08:05 AM: Sergeant Ramirez - Personnel Entry \
		<br>08:11 AM: Supply Truck A-12 - Vehicle exit \
		<br>08:20 AM: Civilian Contractor - Personnel Entry (Temporary Access Granted)\
		<br>08:35 AM: Maintenance Vehicle M-6 - Cargo Entry (Manifest ID: MA987)\
		<br><br>All entries properly logged and verified. Gatehouse secure and operational."

/datum/terminal/document/upper_mil_afternoon // Mini mammoth military base gatehouse afternoon logs
	title = "Entry Log - Afternoon Shift"
	content ="Date: 10/22/2077 \
		<br>Recorded the following personnel and vehicle exits during the afternoon shift:\
		<br>13:20 PM: Lieutenant Thompson - Personnel Exit\
		<br>13:35 PM: Medical Team - Vehicle Exit (Medical Supplies Dispatched)\
		<br>13:50 PM: Researcher Anderson - Personnel Exit\
		<br>14:10 PM: Supply Truck C-8 - Vehicle Exit (Manifest ID: CT459)\
		<br>14:25 PM: Sergeant Martinez - Personnel Exit\
		<br><br>All exits properly logged and verified. Gatehouse operations continue without issues."

/datum/terminal/document/upper_mil_evening // Mini mammoth military base gatehouse evening logs
	title = "Entry Log - Evening Shift"
	content ="Date: 10/22/2077 \
		<br>Recorded the following personnel and vehicle entries during the evening shift:\
		<br>17:31 PM: Lieutenant Thompson - Personnel Entry\
		<br>18:05 PM: Supply Truck D-9 - Cargo Entry (Manifest ID: MT234)\
		<br>18:22 PM: Corporal Wilson - Personnel Entry\
		<br>18:35 PM: Maintenance Vehicle M-14 - Cargo Entry (Manifest ID: MA789)\
		<br>18:47 PM: Supply Truck D-9 - Cargo Exit\
		<br><br>All exits properly logged and verified. Gatehouse operations remain optimal."

/datum/terminal/document/upper_mil_thebig1 // Mini mammoth military base SUPER BADASS SHIPMENT... too late tho
	title = "High-Priority Shipment Inbound #REQ361"
	content ="Date: 10/18/2077 \
		<br>Time: 12:23 PM\
		<br><br>\
		<br>Incoming Shipment - Energy Based Expansion\
		<br><br>\
		<br>Shipment Carrier -  S-Truck X-22 (Manifest ID: DT492)\
		<br>Approximate Arrival -  10/26/2077 12:00 PM\
		<br>Received an incoming shipment of advanced energy weapons at the gatehouse. Verified and logged the following items:\
		<br><br>\
		<br>Item 1: Gauss Rifle Mark IV\
		<br><br>\
		<br>Origin: Research Facility - GaussTech Industries\
		<br>Quantity: 3\
		<br>Serial Numbers: 58GR2010, 58GR2011, 58GR2012\
		<br>Item 2: Plasma Caster\
		<br><br>\
		<br>Origin: Military Surplus - Fort Daggerwill Armory\
		<br>Quantity: 2\
		<br>Serial Numbers: PC-376502, PC-376503\
		<br>Item 3: Pulse Grenades\
		<br><br>\
		<br>Origin: Prototype Production - Advanced Ordnance Department\
		<br>Quantity: 5\
		<br>Serial Numbers: XPG1749824, XPG1749825, XPG1749826, XPG1749827, XPG1749828\
		<br>Upon Arrival of S-Truck X-22, Lieutenant Thompson is to be notified immediately and present for the boarding process.\
		<br>All items properly secured and accounted for in the armory until further demonstration. Enhanced security protocols activated to ensure the safety of these cutting-edge weapons. \
		<br>Warehouse personnel assigned to specialized training for handling and transporation."


/datum/terminal/document/upper_mil_secproc // Mini mammoth military base gatehouse security procedure
	title = "CRITICAL NOTICE - Security Procedure Update"
	content ="Date: 10/22/2077 Time: 20:38 PM<br><br>\
		<br>Security Notice - Heightened Security Measures\
		<br>Effective immediately, all gatehouse personnel are hereby notified of the implementation of heightened security measures within the base premises. This decision comes as a result of recent security concerns and potential threats identified in the surrounding area. The following measures are to be strictly enforced:\
		<br><br>Increased personnel presence: Additional security personnel have been assigned to patrol key areas and checkpoints, ensuring heightened vigilance and rapid response to any suspicious activities.\
		<br>Access restrictions: All personnel entering or exiting the base must present valid identification as per usual as well as undergo additional thorough screening procedures. No exceptions will be made.\
		<br>Restricted areas: Certain sections of the base have been designated as restricted zones. Unauthorized personnel are strictly prohibited from entering these areas without proper clearance.\
		<br>Randomized security checks: Randomized security checks will be conducted on personnel and vehicles to deter unauthorized items from entering or leaving the base.\
		<br><br>Furthermore, as part of these enhanced security measures, the previously stationed sentry bot designated as 'Sentry Unit Bravo' has been granted permission for free roaming within the base perimeter. This autonomous unit will serve as an additional deterrent and provide an extra layer of defense.\
		<br><br>All gatehouse personnel are advised to familiarize themselves with the updated security protocols and report any suspicious activities immediately to their superiors. Your cooperation and adherence to these measures are vital to maintaining the safety and integrity of the base."

/datum/terminal/document/upper_mil_req1 // Mini mammoth military base warehouse req
	title = "Requision Req #REQ - Munitions"
	content ="Requisition ID: REQ361\
		<br>Date: 10/18/2077\
		<br>Requester: Lieutenant Thompson\
		<br>Priority: High\
		<br><br>\
		<br>Item(s) Requested: Ammunition\
		<br>Quantity:\
		<br><br>\
		<br>5.56mm: 10,000 rounds\
		<br>.308 caliber: 5,000 rounds\
		<br>9mm: 2,500 rounds\
		<br>Reason: Preparing for upcoming joint training exercises. Require sufficient ammunition for live-fire drills and weapons proficiency training.\
		<br><br>\
		<br>Status: Approved\
		<br>Est. Delivery Date: 10/25/2077"

/datum/terminal/document/upper_mil_req2 // Mini mammoth military base warehouse req
	title = "Requision Req #REQ361 - Munitions"
	content ="<br>Requisition ID: REQ365\
		<br>Date: 10/18/2077\
		<br>Requester: Corporal Wilson\
		<br>Priority: Med\
		<br><br>\
		<br>Item Requested: Medical Supplies\
		<br>Quantity:\
		<br><br>\
		<br>Bandages: 500\
		<br>Antiseptic solution: 10 bottles\
		<br>Painkillers: 100 doses\
		<br>Stimulation Delivery Packages: 15\
		<br>Reason: Replenishing medical supplies for field medic kits. Critical for providing immediate care and treatment to wounded personnel \
		<br>during potential combat operations and general replenglishment of reserves to infirmary..\
		<br><br>\
		<br>Status: Approved\
		<br>Delivery Date: 10/27/2077"

// RANDOM WORLD TERMINALS //

/datum/terminal/document/water_plant_notice // For the water plant terminal with sewer control
	title = "Notice for Operator."
	content = "Leaving this notice here as an official declaration of being over this shit. This is COMPLETELY unacceptable. \
		<br><br>Consider this the final warning- The system can NOT take another closure like this, last week it got backed up to max capacity and nearly backwashed into the primary reservoir. \
		We've recently came upon a list of the culprits involved in this matter, it will not be formally disclosed to you all. \
		<br><br> I don't know what you think, but I've got a decent idea of what's REALLY going on here. I had a meeting with the local Sheriff and he's been alerted to this, so you should save yourself the bother and be on good behavior. \
		In the meantime- DO. NOT. TOUCH. THE. CHOKES. \
		<br><br>\
		<br><br> I will be watching. -Director Norrison."

/datum/terminal/document/toystore_restocklist // if you say this is coding i'll kill you; the toy store in the south of the map
	title = "STOCKING LIST"
	content= "train models:<br>#14-001 to 013(rail pieces; always keep healthy surplus)<br>#14-023(staple bi-directional engine)<br>#14-041<br>#14-055<br>#15-004<br>#15-006<br>#15-016(order an extra and don't forget to put $3.99 in the register and put it down as an employee sale)\
		<br>#16-005<br>#17-027 to 030<br>#17-033(basic light set, keep healthy surplus)<br>#18-001(David; do not stock more than one at a time. These are way too expensive to keep ordering every month.)\
		<br><br>regular toys:<br>refer to the shelves next to the back door, if any are half empty then re-order<br>(David; please order some more of the BB guns. They're flying off shelves. Don't forget the BBs this time, please.)\
		<br><br>science kits:<br>basic chemistry glowing volcano kit(best seller)<br>basic chemistry lead plating kit<br>basic radiometry nuclear blast test kit<br>basic astronomy build your own telescope kit<br>basic mechanics mini nuclear car kit\
		<br>basic electronics build your own flashlight kit<br>basic rocketry commie-buster kit<br>(David; keep your eyes on the new catalogues, you understand what youngins want more than I do.)"

/datum/terminal/document/toystore_notetoself // same as above, immersive
	title = "NOTE TO SELF"
	content = "remember to get clay and paint for train diorama"

/datum/terminal/document/principals_office // School Principal's Office - First Log
	title = "Unruly Brats"
	content = "Another week another damn prankster. This time it was the usual Steve Brown, he decided it would be a 'funny' prank to clog all the female toilets and wait outside the toilets and laugh as all the students came running out.\
		 I told his mother this isn't good behavior and that I will kick Steve out incase he tries anything else, again. But my words fall on deaf ears.."

/datum/terminal/document/waste_management
	title = "Rapture of Barrel"
	content = "One of the waste barrels sent to us from the local power plant had it's lid loose, thank god Adams spotted it quickly before it irradiated more of the place.\
		<br><br> Other than the minor radiation leak from the barrel, everything here is a-okay, none of us three have puked in months, so hoorah to us right?"

/datum/terminal/document/hospital_storage_notice // Hospital storage room wall terminal notice
	title = "Notice"
	content = "Due to suspected theft, operation of the storage safety lock is no longer manually overridable. Please buzz the Director's secretary for access.\
		<br><br> Anyone found attempting to override this and access it by hand will be stipped of their position. Additionally, two Protectron security enforcers have been placed within the storage. Please have your identification tag visible at all times as to avoid issues.\
		The association is not liable for any damages and by continuing forward you agree to this."

/datum/terminal/document/mansion_rant // North-West mansion bedroom terminal
	title = "Torn to Pieces"
	content = "I've worked pretty much my whole life. Most people couldn't picture that. From the age of ten years old I was working in a corn field. By the time I was sixteen I was enrolled in a college in nuclear engineering.\
		<br><br> The thing that they neglect to tell you about life is that no matter how much hard work you put in- Sometimes you can't just have it all. I was recently let go from my job for something I had nothing to do with in any way- shape NOR form.\
		There's nothing quite like being put on blast and thrown to the pits after ten years of servitude- but it's fine.\
		<br><br>So I fetch a ride all the way home early from work- Walk through my front doors in this beautiful home I've gathered for our family...\
		<br><br> I feel like I don't need to transcribe what I had seen in my bedroom involving my wife, so I won't. It just goes to show you how predictable women are, ALWAYS doing shit like this. The fact that I mustn't even note it down to let you know exactly\
		what had happened is enough proof to me that our country is to ruins. I don't think I'll trust a woman again. So now, I've thrown away our beautiful double queen bed and got us two twins. Unfortunately we'll still share a room until the whore's sister can\
		move her out.\
		<br><br> At least I've got my son in all this, as secluded as he is in his tinkering. Due to his condition, it seems like he hasn't really noticed much going on between his mother and I. Oh well... I have faith in god an opportunity to repay her will arise."

/datum/terminal/document/mansion_confession // North-West mansion bunker terminal
	title = "Redemption"
	content = "I write this not in celebration of my actions, but in regret. Every moment I take a breath, it's nearly met with violent vomiting. I've sinned greatly. It's been four or so months since I've plunged into this shelter with my son...\
		<br><br> It had just happened so fast, I hadn't had time to clear my mind and just think- In the heat of the moment any human could make the mistake... But I left Mary to die out there. We had been merely playing pool together, my son and I.\
		Of course Mary came in nagging as her usual self... Over the radio, we heard the notice, I suppose as many of the rest had. Nuclear annihilation guarenteed- I bolted to the shelter, my son's wrist in hand. Mary tried to follow us down the stairs\
		but... I just snapped... I pulled my thirty-eight out from my holster and drew it on her out of panic- I didn't wish to hurt her, but there's no way I could let the woman I trusted so much into safety with us. She betrayed me before, she could again, right?\
		I have been... Overcome with grief, to say the least. Thomas hasn't been taking it well, and by extension I haven't either. He's hardly messed around and made a single thing since the bombs dropped. I think the whole thing with Mary banging on the shutters really shook him."

/datum/terminal/document/mansion_end // North-West mansion bedroom terminal - Log 2
	title = "The End"
	content = "Sleep. I don't remember the last time I had it. It's been about a week since Thomas passed away in his sleep. I don't quite know from what, but he's been acting strangely on the medication I've been giving him... I suspect I'm the culprit for another\
		family member's demise. I'm a horrible person and deserve what is coming to me. Let it be known that Malcolm Robinson isn't a coward and has owned up to the grim reality of what he's done- I intend on doing it briefly after this log, but I am scheduled\
		to depart this hellhole of a prison I call my new home. Not through physical freedom, but mental. It won't be long until I'm dead and at the gates, in God's judgement. I only wish that my family can forgive me for the sins I've committed against them."

/datum/terminal/document/publicbunker_1 //public bunker big cheese room terminal entry 1 kind of in the middle of the map
	title = "Nuclear Holocaust"
	content = "It finally happened. The Reds launched the big ones. I hope we took a good chunk of them out.<br>Not important. We are safe in this public bunker, not some stupid subscription like those Vaults or whatever. I'm sure those are nicer, but we still need a\
		place for the less fortunate of us. I am the leader, I suppose, though it's not like I'm going to get arrested if I don't want to. No more cops. Feels good to be able to say that.<br>Guess I should document something important on here. Well, the sirens were\
		blaring, and I don't really think this place was being guarded, but we all kinda knew it was here. We just rushed in. Lots of people, honestly. Maybe too many. It got claustrophibic quick. We're probably gonna need some more space, figure no one will care if\
		we dig a hole in a wall for more beds. After everyone was inside, I counted about 30, including myself. I donjg people are bugging me to help take mattress off of bedframes ill come back to this"

/datum/terminal/document/publicbunker_2 //public bunker big cheese room terminal entry 2
	title = "Holes"
	content = "Well, we managed to dig a hole. Big problem though. It seems like the outside world is radioactive, despite none of the nukes hitting around here, I thought? Whatever was in these walls was protecting us. The people I had mine the thing out are losing hair\
		at a disgusting pace. Worst part is I had them dig into the wall of the main hallway, so the cafeteria is not safe, and we already set up lots of beds in the hallway. This is fucked. Fuck fuck fuck fuck fuck"

/datum/terminal/document/publicbunker_3 //public bunker big cheese room terminal entry 3
	title = "New Entry"
	content = "The peopel are mutating oh godf theyre attacking everyone its like zombies man fuck i locked myself in my room. THey canyt get me in here right? saving opne bullet for myself God fuckikng dammit FUCKim so sorry I know they can't hear this but I'm so sorry.\
		I didn't mean to fuck us all. I wanted to keep as many of us in here as I could and I fucked up in the process, this fucking piece of shit bunker was only meant for 20 people not 30. I'm goign to hell fucking shit man fuck"

/datum/terminal/document/oopersuperbmed // The superB market :)
	title = "Surge of drug addicts"
	content = "Hey Martin! I'm leaving this for when you start your shift on the twenty-third. Hope you had a good vacation! You'll have to tell me about it when our schedules align again! Anyways, we had a tiny bit of a break-in! It's not too bad though, the overnight caught them.\
		Anyways, we've been told to put a bunch of our stuff up on lockup, and I'm sure you noticed the new bars and heard about that new law passed. I'm sure you've read up on it already, but we're supposed to keep the grand majority of our supply locked up when we're not in business.\
		Unfortunately, that entails we'll have to pull you back a shift and you'll do opening. Nothing too drastic should change, other than it being sun-up when you arrive. When we next see each other, I can give you the keys for lockup. There's a few of them, actually. That was also mandated...\
		<br><br>\
		So... Yeah. If you do end up coming in on the twenty-third and see this before I can snag you up or Rich got to you first, just hang around and work as usual, we'll get together to talk a bit more about the new protocol. -Rebecca."

//// DROUGHT SPECIFIC ////

/datum/terminal/document/drought_junkyard_warn //Drought junkyard sentry warning
	title = "DO NOT ENTER"
	content = "Jacobsen fucked it up big time. That giant hunk of prewar kickass was hardly on the hoist for all of five fucking minutes before the moron pressed on the wrong part of it. I didn't even get to see him before he disappeared into a cloud of red mist.\
		<br>\
		I managed to contain it, but Nick took some shots and I don't think he's going to make it. The sentry bot is active in there- If you end up making it back, I pray to god you read this message. We can't stay here.\
		<br>\
		We'll be meeting up in the old Sheriff's station. You need to come over with us, take a right when you exit the junkyard, hang a left at the first road and keep walking. We'll probably be out front waiting once we've cleared it out a bit. It's just us two, now.\
		<br>\
		Moral of the story is... Don't play around with military tech. It's not worth it."
