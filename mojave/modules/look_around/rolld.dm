
/proc/dice6(time)
	var/sum = 0
	for(time, time > 0, time--)
		var/num = rand(1, 6)
		sum += num
	return sum

/proc/rolld(dice, value, strictly = TRUE)
	if(strictly)
		if(dice < value)
			return value - dice
	else
		if(dice <= value)
			return value - dice + 1
	return FALSE
