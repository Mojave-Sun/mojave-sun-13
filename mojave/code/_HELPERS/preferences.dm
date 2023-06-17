//Hair Colour

/proc/random_hair_color()
	return pick(GLOB.hair_colors)

GLOBAL_LIST_INIT(hair_colors, sort_list(list(
	"Dark Gray",
	"Light Gray",
	"Black",
	"Brown Black",
	"Darkest Brown",
	"Dark Brown",
	"Medium Brown",
	"Light Brown",
	"Dark Ginger",
	"Light Ginger",
	"Dark Blonde",
	"Medium Blonde",
	"Light Blonde"
	)))

/proc/hairtone2hex(hair_color)
	. = 0
	switch(hair_color)
		if("Dark Gray")
			. = "#363636"
		if("Light Gray")
			. = "#8c8c8c"
		if("Black")
			. = "#242424"
		if("Brown Black")
			. = "#171211"
		if("Darkest Brown")
			. = "#271917"
		if("Dark Brown")
			. = "#341d18"
		if("Medium Brown")
			. = "#412d25"
		if("Light Brown")
			. = "#563e2e"
		if("Dark Ginger")
			. = "#6a3b14"
		if("Light Ginger")
			. = "#c27e41"
		if("Dark Blonde")
			. = "#7f5d3a"
		if("Medium Blonde")
			. = "#b48454"
		if("Light Blonde")
			. = "#ba9c78"

//Eye Colour

/proc/random_eye_color()
	return pick(GLOB.eye_colors)

GLOBAL_LIST_INIT(eye_colors, sort_list(list(
	"Light Turqouise",
	"Medium Turqouise",
	"Dark Turqouise",
	"Light Blue",
	"Medium Blue",
	"Dark Blue",
	"Light Green",
	"Medium Green",
	"Dark Green",
	"Light Purple",
	"Medium Purple",
	"Dark Purple",
	"Light Brown",
	"Medium Brown",
	"Dark Brown",
	"Light Gray",
	"Medium Gray",
	"Dark Gray"
	)))

/proc/eyetone2hex(eye_color)
	. = 0
	switch(eye_color)
		if("Light Turqouise")
			. = "#79a99b"
		if("Medium Turqouise")
			. = "#236d6d"
		if("Dark Turqouise")
			. = "#0f4251"
		if("Light Blue")
			. = "#81b7d1"
		if("Medium Blue")
			. = "#3175b2"
		if("Dark Blue")
			. = "#1c3a5c"
		if("Light Green")
			. = "#5f7f4d"
		if("Medium Green")
			. = "#16552a"
		if("Dark Green")
			. = "#112315"
		if("Light Purple")
			. = "#5c5277"
		if("Medium Purple")
			. = "#403454"
		if("Dark Purple")
			. = "#1b1424"
		if("Light Brown")
			. = "#79553b"
		if("Medium Brown")
			. = "#47250c"
		if("Dark Brown")
			. = "#2b1412"
		if("Light Gray")
			. = "#767674"
		if("Medium Gray")
			. = "#4e4e4e"
		if("Dark Gray")
			. = "#22211d"


//Underwear Colour

var/underwear_colour

/proc/random_underwear_color()
	return pick(GLOB.underwear_colors)

GLOBAL_LIST_INIT(underwear_colors, sort_list(list(
	"Brown",
	"Green",
	"Red",
	"Blue",
	"Purple",
	"Yellow",
	"Orange",
	"Black",
	"White"
	)))

/proc/undiestone2hex(underwear_color)
	. = 0
	switch(underwear_color)
		if("Brown")
			. = "#FFCC99"
		if("Green")
			. = "#88BB88"
		if("Red")
			. = "#9F6A58"
		if("Blue")
			. = "#61889B"
		if("Purple")
			. = "#A188C6"
		if("Yellow")
			. = "#CACA46"
		if("Orange")
			. = "#D59A42"
		if("Black")
			. = "#555555"
		if("White")
			. = "#FFFFFF"

/proc/random_voice_type(gender)
	switch(gender)
		if(MALE)
			return pick(GLOB.male_voice_type_list)
		if(FEMALE)
			return pick(GLOB.female_voice_type_list)

GLOBAL_LIST_INIT(male_voice_type_list, sort_list(list(
	"male_01",
	"male_02",
	"male_03",
	"male_04",
	"male_05",
	"male_06",
	"male_07",
	)))

GLOBAL_LIST_INIT(female_voice_type_list, sort_list(list(
	"female_01",
	"female_02",
	"female_03",
	)))

