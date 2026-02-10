/mob/living/carbon/proc/heart_attack_fake()
	if(HAS_TRAIT(src, TRAIT_INFINITE_STAMINA))
		return
	shake_camera(src, 1, 3)
	blur_eyes(10)
	var/stuffy = list("ZIZO GRABS MY WEARY HEART!","ARGH! MY HEART BEATS NO MORE!","NO... MY HEART HAS BEAT IT'S LAST!","MY HEART HAS GIVEN UP!","MY HEART BETRAYS ME!","THE METRONOME OF MY LIFE STILLS!")
	to_chat(src, span_userdanger("[pick(stuffy)]"))
	emote("breathgasp", forced = TRUE)
