/// Grabs just the first letters of text, so you can get name initials and such in a standardized way
/proc/text_initials(text, splitter = " ", joiner = ". ", ender = ".")
	var/list/splittext = splittext(text, splitter)
	var/list/initials = list()
	for(var/word in splittext)
		initials += uppertext(word[1])
	var/final_text = jointext(initials, joiner)
	if(ender)
		final_text += ender
	return final_text
