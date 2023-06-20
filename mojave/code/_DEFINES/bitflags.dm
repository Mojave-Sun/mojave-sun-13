//for convenience
#define ENABLE_BITFIELD(variable, flag) (variable |= (flag))
#define DISABLE_BITFIELD(variable, flag) (variable &= ~(flag))
#define CHECK_BITFIELD(variable, flag) (variable & (flag))
#define TOGGLE_BITFIELD(variable, flag) (variable ^= (flag))

#define COPY_SPECIFIC_BITFIELDS(a,b,flags)\
	do{\
		var/_old = a & ~(flags);\
		var/_cleaned = b & (flags);\
		a = _old | _cleaned;\
	} while(0);

#define CHECK_MULTIPLE_BITFIELDS(flagvar, flags) (((flagvar) & (flags)) == (flags))
