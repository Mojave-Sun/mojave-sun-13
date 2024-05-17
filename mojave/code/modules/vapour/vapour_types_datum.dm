/datum/vapours
	/// Name of the vapour, if null will be treated as abstract and wont be initialized as singleton
	var/name
	/// Flags of the vapour, determine whether it has an appearance, smell, touch act, breath act
	var/vapours_flags = NONE
	/// Below are variables for appearance
	/// What color will the vapour be, can be left null
	var/color
	/// What is it desired alpha?
	var/alpha = 255
	/// How "thick" is it, the thicker the quicker it gets to desired alpha and is stronger than other vapours in blending appearance
	var/thickness = 1
	///FILL THE BELOW OUT IF ITS SMELLABLE!
	/// How intense is one unit of the vapour for smell purposes?
	var/smell_intensity
	/// Descriptor of the smell
	var/descriptor
	/// Scent of the smell
	var/scent
	/// Use this to avoid spamming screens with messages!
	COOLDOWN_DECLARE(agony_announcement)
	/// Used to ensure that deliberately harmful stuff outside sticks around a little longer
	var/dissipation_resistance

///When a vapour touches an unprotected carbon mob
/datum/vapours/proc/TouchAct(mob/living/carbon/victim, amount)
	return

///When a carbon mob breathes in the vapour
/datum/vapours/proc/BreatheAct(mob/living/carbon/victim, amount)
	return
