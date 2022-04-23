/obj/vv_get_dropdown()
	. = ..()
	VV_DROPDOWN_OPTION(VV_HK_SUBARMOR_MOD, "Modify subarmor values")

/obj/vv_do_topic(list/href_list)
	if(!(. = ..()))
		return
	if(href_list[VV_HK_ARMOR_MOD])
		var/list/pickerlist = list()
		var/list/armorlist = armor.getList()

		for(var/i in armorlist)
			pickerlist += list(list("value" = armorlist[i], "name" = i))

		var/list/result = presentpicker(usr, "Modify subarmor", "Modify subarmor: [src]", Button1="Save", Button2 = "Cancel", Timeout=FALSE, inputtype = "text", values = pickerlist)

		if (islist(result))
			if (result["button"] != 2) // If the user pressed the cancel button
				// text2num conveniently returns a null on invalid values
				subarmor = subarmor.setRating(subarmor_flags = text2num(result["values"][SUBARMOR_FLAGS]),\
			                  edge_protection = text2num(result["values"][EDGE_PROTECTION]),\
			                  crushing = text2num(result["values"][CRUSHING]),\
			                  cutting = text2num(result["values"][CUTTING]),\
			                  piercing = text2num(result["values"][PIERCING]),\
			                  impaling = text2num(result["values"][IMPALING]),\
							  laser = text2num(result["values"][LASER]),\
							  energy = text2num(result["values"][ENERGY]),\
			                  fire = text2num(result["values"][FIRE]),\
			                  acid = text2num(result["values"][ACID]))
				log_admin("[key_name(usr)] modified the subarmor on [src] ([type]) to subarmor_flags: [subarmor.subarmor_flags], crushing: [subarmor.crushing], cutting: [subarmor.cutting], piercing: [subarmor.piercing], impaling: [subarmor.impaling], laser: [subarmor.laser], energy: [subarmor.energy], acid: [subarmor.acid]")
				message_admins(span_notice("[key_name_admin(usr)] modified the subarmor on [src] ([type]) to subarmor_flags: [subarmor.subarmor_flags], crushing: [subarmor.crushing], cutting: [subarmor.cutting], piercing: [subarmor.piercing], impaling: [subarmor.impaling], laser: [subarmor.laser], energy: [subarmor.energy], acid: [subarmor.acid]"))
