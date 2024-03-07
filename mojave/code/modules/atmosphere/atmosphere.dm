//MS13 Atmosphere Ambient Noise System//

//ported from septic shock//

SUBSYSTEM_DEF(atmosphere)
	name = "Droning"
	flags = SS_NO_FIRE

/datum/controller/subsystem/atmosphere/proc/area_entered(area/area_entered, client/entering)
	if(!area_entered || !entering)
		return
	if(!entering.prefs.read_preference(/datum/preference/toggle/enable_atmosphere_music))
		kill_atmosphere(entering)
		return
	var/list/last_atmosphere = list()
	last_atmosphere |= entering.last_atmosphere_track
	var/list/new_atmosphere = list()
	new_atmosphere |= area_entered.atmosphere_track
	//Same ambience, don't bother
	if(last_atmosphere ~= new_atmosphere)
		return
	play_area_sound(area_entered, entering)

/datum/controller/subsystem/atmosphere/proc/play_area_sound(area/area_player, client/listener)
	if(!listener.prefs.read_preference(/datum/preference/toggle/enable_atmosphere_music))
		return
	if(LAZYLEN(area_player.atmosphere_track))
		//kill the previous atmosphere sound
		kill_atmosphere(listener)
		var/sound/atmosphere = sound(pick(area_player.atmosphere_track), area_player.atmosphere_repeat, area_player.atmosphere_wait, area_player.atmosphere_channel, area_player.atmosphere_volume)
		SEND_SOUND(listener, atmosphere)
		listener.atmosphere_track = atmosphere
		listener.last_atmosphere_track = area_player.atmosphere_track

/datum/controller/subsystem/atmosphere/proc/kill_atmosphere(client/victim)
	if(!victim?.atmosphere_track)
		return
	var/sound/sound_killer = sound()
	sound_killer.channel = victim.atmosphere_track.channel
	SEND_SOUND(victim, sound_killer)
	victim.atmosphere_track = null
	victim.last_atmosphere_track = null

//MS13 Base Area Tweaks for Atmosphere

/area
	var/list/atmosphere_track
	var/list/atmosphere_sound
	var/atmosphere_vary = 0
	var/atmosphere_repeat = TRUE
	var/atmosphere_wait = 0
	var/atmosphere_volume = 50
	var/atmosphere_channel = CHANNEL_BUZZ
	var/atmosphere_frequency = 0

/area/Entered(atom/movable/arrived, area/old_area)
	set waitfor = FALSE
	SEND_SIGNAL(src, COMSIG_AREA_ENTERED, arrived, old_area)
	var/mob/living/living_arrived = arrived
	if(istype(living_arrived) && living_arrived.client && !living_arrived.combat_mode)
		//Ambience if combat mode is off
		SSatmosphere.area_entered(src, living_arrived.client)
	if(!LAZYACCESS(arrived.important_recursive_contents, RECURSIVE_CONTENTS_AREA_SENSITIVE))
		return
	for(var/atom/movable/recipient as anything in arrived.important_recursive_contents[RECURSIVE_CONTENTS_AREA_SENSITIVE])
		SEND_SIGNAL(recipient, COMSIG_ENTER_AREA, src)

/area/on_joining_game(mob/living/boarder)
	. = ..()
	if(istype(boarder) && boarder.client && !boarder.combat_mode)
		//Ambience if combat mode is off
		SSatmosphere.area_entered(src, boarder.client)

//MS13 Base Client/Living Tweaks for Atmosphere

/client
	/// Used by the area music system to avoid repeating tracks
	var/last_atmosphere_track
	/// Current ambient track
	var/sound/atmosphere_track

/client/Destroy()
	. = ..()
	QDEL_NULL(atmosphere_track)
	last_atmosphere_track = null

/mob/living/death(gibbed)
	. = ..()
	if(.)
		if(client)
			SSatmosphere.kill_atmosphere(client)

//Insert Music Defines Here

/datum/asset/simple/atmosphere
	early = TRUE
	var/static/list/atmosphere_files

/datum/asset/simple/atmosphere/New()
	. = ..()
	if(!atmosphere_files)
		var/list/atmospheric = list()
		atmospheric |= COLD_WASTELAND_ATMOSPHERE
		atmospheric |= DESERT_ATMOSPHERE
		atmospheric |= BUILDING_ATMOSPHERE
		atmospheric |= BUNKER_ATMOSPHERE
		atmospheric |= FOREST_ATMOSPHERE
		atmospheric |= INDUSTRIAL_ATMOSPHERE
		atmospheric |= NCR_ATMOSPHERE
		atmospheric |= CAVE_ATMOSPHERE
		atmospheric |= SEWER_ATMOSPHERE
		atmospheric |= VAULT_ATMOSPHERE
		atmospheric |= BARONY_ATMOSPHERE
		atmospheric |= DRYLANDER_ATMOSPHERE
		atmospheric |= GOLDMAN_ATMOSPHERE
		atmospheric |= SNOWCREST_ATMOSPHERE
		atmosphere_files = atmospheric

/datum/asset/simple/atmosphere/send(client)
	. = ..()
	if(!.)
		return
	for(var/atmospheric in atmosphere_files)
		SEND_SOUND(client, sound(atmospheric, FALSE, CHANNEL_ADMIN, 0))
		SEND_SOUND(client, sound(null, FALSE, CHANNEL_ADMIN, 0))
