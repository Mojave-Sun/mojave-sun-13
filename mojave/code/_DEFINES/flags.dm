//Flags specfically for MS13 content; no more dealing with upstream flags
//To be used with the ms13_flags_1 variable; kinda equivalent to the TG flags_1
//WILL NOT WORK OUTSIDE OF THE /mojave folder

#define LOCKABLE_1 (1<<0) // For objects able to be locked, slap this on and it should work, preventing you from interacting
#define LOCKING_ITEM (1<<1) // Locks - For lock general interactions
#define KEY_ITEM (1<<2) // Keys - For key general interactions
