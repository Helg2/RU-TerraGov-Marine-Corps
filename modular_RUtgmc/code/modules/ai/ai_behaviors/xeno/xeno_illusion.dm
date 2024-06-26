/mob/illusion/Destroy()
	. = ..()
	GLOB.mob_illusions_list -= src

/mob/illusion/xeno/Initialize(mapload, mob/living/carbon/xenomorph/original_mob, atom/escorted_atom, life_time)
	. = ..()
	if(.)
		return INITIALIZE_HINT_QDEL
	add_movespeed_modifier(MOVESPEED_ID_XENO_CASTE_SPEED, TRUE, 0, NONE, FALSE, original_mob.xeno_caste.speed * rand(0.9, 1, 1.1, 1.2, 1.3))
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/illusion, escorted_atom)
