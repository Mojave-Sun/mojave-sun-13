/datum/computer_file/program/skill_tracker
	filename = "skilltracker"
	filedesc = "ExperTrak Skill Tracker"
	category = PROGRAM_CATEGORY_MISC
	program_icon_state = "generic"
	extended_desc = "Scan and view your current marketable job skills."
	size = 2
	tgui_id = "NtosSkillTracker"
	program_icon = "medal"
	usage_flags = PROGRAM_TABLET // Must be a handheld device to read read your chakras or whatever

/datum/computer_file/program/skill_tracker/ui_data(mob/user)
	var/list/data = get_header_data()

	var/list/skills = list()
	data["skills"] = skills

	var/datum/mind/targetmind = user.mind
	if(targetmind)
		for (var/type in GLOB.skill_types)
			var/datum/skill/skill = GetSkillRef(type)
			var/lvl_num = targetmind.get_skill_level(type)
			var/lvl_name = uppertext(targetmind.get_skill_level_name(type))
			var/exp = targetmind.get_skill_exp(type)
			var/xp_prog_to_level = targetmind.exp_needed_to_level_up(type)
			var/xp_req_to_level = 0
			if (xp_prog_to_level && lvl_num < length(SKILL_EXP_LIST)) // is it even possible to level up?
				xp_req_to_level = SKILL_EXP_LIST[lvl_num+1] - SKILL_EXP_LIST[lvl_num]

			var/list/skilldata = list(
				"name" = skill.name,
				"desc" = skill.desc,
				"lvl_name" = lvl_name
			)
			if (exp && xp_req_to_level)
				skilldata["progress_percent"] = (xp_req_to_level-xp_prog_to_level)/xp_req_to_level
				skilldata["overall_percent"] = exp / SKILL_EXP_LIST[length(SKILL_EXP_LIST)]
			skills[++skills.len] = skilldata

	return data
