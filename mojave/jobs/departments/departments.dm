#define DEPARTMENT_BITFLAG_NCR (1<<10)
#define DEPARTMENT_NCR "NCR"
#define EXP_TYPE_NCR "NCR"
#define DEPARTMENT_BITFLAG_BOS (1<<11)
#define DEPARTMENT_BOS "BOS"
#define EXP_TYPE_BOS "BOS"
#define DEPARTMENT_BITFLAG_RAIDERS (1<<12)
#define DEPARTMENT_RAIDERS "Raiders"
#define EXP_TYPE_RAIDERS "Raiders"
#define DEPARTMENT_BITFLAG_TOWN (1<<13)
#define DEPARTMENT_TOWN "Town"
#define EXP_TYPE_TOWN "Town"
#define DEPARTMENT_BITFLAG_WASTELAND (1<<14)
#define DEPARTMENT_WASTELAND "Wasteland"
#define EXP_TYPE_WASTELAND "Wasteland"

/datum/job_department/ncr
	department_name = DEPARTMENT_NCR
	department_bitflags = DEPARTMENT_BITFLAG_NCR
	department_head = /datum/job/NCR Lieutenant
	department_experience_type = EXP_TYPE_NCR
	//display_order = 0
	//label_class = "NCR"
	//latejoin_color = "#ffddf0"

/datum/job_department/bos
	department_name = DEPARTMENT_BOS
	department_bitflags = DEPARTMENT_BITFLAG_BOS
	department_head = /datum/job/Head Paladin
	department_experience_type = EXP_TYPE_BOS
	//display_order = 0
	//label_class = "BOS"
	//latejoin_color = "#ffddf0"

/datum/job_department/raiders
	department_name = DEPARTMENT_RAIDERS
	department_bitflags = DEPARTMENT_BITFLAG_RAIDERS
	department_head = /datum/job/Raider Boss
	department_experience_type = EXP_TYPE_RAIDERS
	//display_order = 0
	//label_class = "RAIDERS"
	//latejoin_color = "#ffddf0"

/datum/job_department/town
	department_name = DEPARTMENT_TOWN
	department_bitflags = DEPARTMENT_BITFLAG_TOWN
	department_head = /datum/job/Town Mayor
	department_experience_type = EXP_TYPE_TOWN
	//display_order = 0
	//label_class = "TOWN"
	//latejoin_color = "#ffddf0"

/datum/job_department/wasteland
	department_name = DEPARTMENT_WASTELAND
	department_bitflags = DEPARTMENT_BITFLAG_WASTELAND
	department_head = /datum/job/ hea
	department_experience_type = EXP_TYPE_WASTELAND
	//display_order = 0
	//label_class = "WASTELAND"
	//latejoin_color = "#ffddf0"
