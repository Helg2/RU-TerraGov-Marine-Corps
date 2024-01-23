
/mob/living/carbon/xenomorph/queen
	footstep_type = FOOTSTEP_XENO_STOMPY
// ***************************************
// *********** Front Armor
// ***************************************
//TODO: probably better make it a trait & move it to xenomorph level, but idk
/mob/living/carbon/xenomorph/queen/projectile_hit(obj/projectile/proj, cardinal_move, uncrossing)
	if(SEND_SIGNAL(src, COMSIG_XENO_PROJECTILE_HIT, proj, cardinal_move, uncrossing) & COMPONENT_PROJECTILE_DODGE)
		return FALSE
	if(proj.ammo.flags_ammo_behavior & AMMO_SKIPS_ALIENS)
		return FALSE
	proj.damage -= proj.damage * (0.3 * get_sunder())
	return ..()

/mob/living/carbon/xenomorph/queen/generate_name()
	var/playtime_mins = client?.get_exp(xeno_caste.caste_name)
	var/prefix = (hive.prefix || xeno_caste.upgrade_name) ? "[hive.prefix][xeno_caste.upgrade_name] " : ""
	switch(playtime_mins)
		if(0 to 300)
			name = prefix + "Young Queen ([nicknumber])"
		if(301 to 1500)
			name = prefix + "Mature Queen ([nicknumber])"
		if(1501 to 4200)
			name = prefix + "Elder Empress ([nicknumber])"
		if(4201 to 9000)
			name = prefix + "Ancient Empress ([nicknumber])"
		if(9001 to INFINITY)
			name = prefix + "Prime Empress ([nicknumber])"
		else
			name = prefix + "Young Queen ([nicknumber])"

	real_name = name
	if(mind)
		mind.name = name
