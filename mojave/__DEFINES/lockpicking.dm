/////////////////////////////////////////////////////////////
///////// MOJAVE SUN LOCKPICKING SIGNALS DIRECTORY //////////
/////////////////////////////////////////////////////////////

///for any lockpicking behaviors: (obj/item/L, mob/living/user, list/lockpicks, list/wedges)
#define COMSIG_LOCKPICK_ATTACKBY "lockpick_with"
	#define COMPONENT_BLOCK_LOCKPICK (1<<0)

#define COMSIG_LOCKPICK_ONMOUSEDOWN "lockpick_onmousedown"
	#define COMPONENT_LOCKPICK_ONMOUSEDOWN_BYPASS (1<<0)

#define COMPONENT_PICKED "picked"

#define LOCKPICKING_TENSION_SOUNDS list('mojave/sound/ms13effects/lockpicking/lockpick_tension_1.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_2.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_3.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_4.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_5.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_6.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_7.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_8.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_9.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_10.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_11.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_tension_12.ogg')

#define LOCKPICKING_TURN_SOUNDS list('mojave/sound/ms13effects/lockpicking/lockpick_cylinderturn_1.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_cylinderturn_2.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_cylinderturn_3.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_cylinderturn_4.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_cylinderturn_5.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_cylinderturn_6.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_cylinderturn_7.ogg', \
		'mojave/sound/ms13effects/lockpicking/lockpick_cylinderturn_8.ogg')
