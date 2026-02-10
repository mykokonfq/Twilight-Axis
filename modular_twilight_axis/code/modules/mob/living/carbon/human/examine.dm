/mob/living/carbon/human/proc/on_examine_face(mob/living/carbon/human/user)
	if(!istype(user))
		return
	if(user.mind)
		user.mind.i_know_person(src)
	if(HAS_TRAIT(user, TRAIT_JESTERPHOBIA) && job == "Jester")
		user.add_stress(/datum/stressevent/jesterphobia)
	if(HAS_TRAIT(src, TRAIT_BEAUTIFUL) && user != src) // it doesn't really make sense that you can examine your own face
		user.add_stress(/datum/stressevent/beautiful)
	if(HAS_TRAIT(src, TRAIT_UNSEEMLY) && user != src)
		if(!HAS_TRAIT(user, TRAIT_UNSEEMLY))
			user.add_stress(/datum/stressevent/unseemly)

	// Hideous face: makes onlookers scream and warns them in chat.
	if(HAS_TRAIT(src, TRAIT_HIDE0US_FACE) && user != src)
		var/next_allowed = user.hideous_face_next_scream
		if(!isnum(next_allowed))
			next_allowed = null
		if(isnull(next_allowed) || world.time >= next_allowed)
			user.hideous_face_next_scream = world.time + (10 SECONDS)
			user.emote("scream")
			to_chat(user, span_userdanger("I recoil in terror — [src]'s face is unspeakably hideous!"))
			if(user.can_heartattack() && !user.undergoing_cardiac_arrest())
				user.heart_attack_fake()
	if(HAS_TRAIT(src, TRAIT_LEPROSY) && user != src)
		user.add_stress(/datum/stressevent/leprosy)
	if(HAS_TRAIT(src, TRAIT_BEAUTIFUL_UNCANNY) && user != src)
		if(prob(50) && !user.has_stress_event(/datum/stressevent/uncanny))
			user.add_stress(/datum/stressevent/beautiful)
		else
			if(!user.has_stress_event(/datum/stressevent/beautiful))
				user.add_stress(/datum/stressevent/uncanny)
	// Apply Xylix buff when examining someone with the beautiful trait
	if(HAS_TRAIT(user, TRAIT_XYLIX) && !user.has_status_effect(/datum/status_effect/buff/xylix_joy) && user.has_stress_event(/datum/stressevent/beautiful))
		user.apply_status_effect(/datum/status_effect/buff/xylix_joy)
		to_chat(user, span_info("Their beauty brings a smile to my face, and fortune to my steps!"))
