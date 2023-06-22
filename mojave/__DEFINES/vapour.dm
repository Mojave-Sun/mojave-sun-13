#define REGISTER_VAPOUR(vapour) SSvapour.all_vapour[vapour] = TRUE
#define UNREGISTER_VAPOUR(vapour) SSvapour.all_vapour -= vapour
#define SET_ACTIVE_VAPOUR(vapour) SSvapour.active_vapour[vapour] = TRUE
#define SET_UNACTIVE_VAPOUR(vapour) SSvapour.active_vapour -= vapour
#define SET_PROCESSED_THIS_RUN(vapour) SSvapour.processed_this_run[vapour] = TRUE
#define REMOVE_VAPOUR_CURRENTRUN(vapour) SSvapour.current_run -= vapour

#define VAPOUR_HEIGHT_DIVISOR 10

#define TICKS_TO_DISSIPATE 6

#define VAPOUR_TASK_PROCESS 1
#define VAPOUR_TASK_DISSIPATE 2

#define SCENT_DESC_ODOR        "odour"
#define SCENT_DESC_SMELL       "smell"
#define SCENT_DESC_FRAGRANCE   "fragrance"

///Minimum amount of smell power to be able to sniff a vapour
#define VAPOUR_SMELL_THRESHOLD 3.5

#define VAPOUR_SMELL_NORMAL 20
#define VAPOUR_SMELL_STRONG 40

#define SMELL_COOLDOWN 30 SECONDS

#define VAPOUR_DISSIPATION_OUTDOOR_MULTIPLIER 3 //dissipation runs every TICKS_TO_DISSIPATE, remember that

//Bitflags for vapours
///VAPOUR has an appearance
#define VAPOUR_APPEARANCE (1<<0)
///VAPOUR has a smell
#define VAPOUR_SMELL (1<<1)
///VAPOUR calls TouchAct() on unprotected people touched by it
#define VAPOUR_TOUCH_ACT (1<<2)
///VAPOUR calls SmellAct() on people breathing it in
#define VAPOUR_BREATHE_ACT (1<<3)

#define VAPOUR_APPEARANCE_THICKNESS_THRESHOLD 10
#define THICKNESS_ALPHA_COEFFICIENT 0.005

//.Cap for active emitters that can be running for a very long time
#define VAPOUR_ACTIVE_EMITTER_CAP 300
