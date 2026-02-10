/world/New()
	..()
	if(!islist(GLOB.traits_by_type))
		return
	var/list/mob_traits = GLOB.traits_by_type[/mob]
	if(mob_traits && !(TRAIT_HIDE0US_FACE in mob_traits))
		mob_traits += TRAIT_HIDE0US_FACE
