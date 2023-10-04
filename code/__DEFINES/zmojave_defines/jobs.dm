// ~guestbook_flags variable on datum/job
/// We will know absolutely everyone, no matter the department
#define GUESTBOOK_OMNISCIENT (1 << 0)
/// We will know others of the same job type
#define GUESTBOOK_JOB (1 << 1)
/// We will know others in our departments
#define GUESTBOOK_DEPARTMENT (1 << 2)
/// We will not be known by others, even if they pass checks in any way otherwise
#define GUESTBOOK_FORGETMENOT (1 << 3)
