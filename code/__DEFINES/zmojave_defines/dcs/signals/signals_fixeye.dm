// ~fix eye component
///from base of datum/component/fixeye/user_toggle_fixeye(): (mob/living/source, silent, forced)
#define COMSIG_FIXEYE_TOGGLE "fixeye_toggle"
///from base of datum/component/fixeye/check_flags(): (mob/living/source, flags)
#define COMSIG_FIXEYE_CHECK	"fixeye_check"
///from base of datum/component/fixeye/safe_enable_fixeye(): (mob/living/source, silent, forced)
#define COMSIG_FIXEYE_ENABLE "fixeye_enable"
///from base of datum/component/fixeye/safe_disable_fixeye(): (mob/living/source, silent, forced)
#define COMSIG_FIXEYE_DISABLE "fixeye_disable"
///from base of datum/component/fixeye/lock_fixeye(): (mob/living/source, silent, forced)
#define COMSIG_FIXEYE_LOCK "fixeye_lock"
///from base of datum/component/fixeye/unlock_fixeye(): (mob/living/source)
#define COMSIG_FIXEYE_UNLOCK "fixeye_unlock"

// ~technically mob signals but i think putting them here is reasonable enough
///from base of datum/component/fixeye/enable_fixeye(): (mob/living/source, silent, forced)
#define COMSIG_LIVING_FIXEYE_ENABLED "living_fixeye_enabled"
///from base of datum/component/fixeye/disable_fixeye(): (mob/living/source, silent, forced)
#define COMSIG_LIVING_FIXEYE_DISABLED "living_fixeye_disabled"
