/turf/open/space/transit/Entered(atom/movable/crosser, atom/old_loc, list/atom/old_locs)
	..()

	if(isobserver(crosser) || crosser.anchored)
		return

	if(!isobj(crosser) && !isliving(crosser))
		return

	if(!isspaceturf(old_loc))
		var/turf/projected = get_ranged_target_turf(crosser.loc, dir, 10)
		crosser.throw_at(projected, 50, 3, null, TRUE, targetted_throw = TRUE)
		addtimer(CALLBACK(src, PROC_REF(handle_crosser), crosser), 0.5 SECONDS)

/turf/open/space/transit/proc/handle_crosser(atom/movable/crosser)
	if(QDELETED(crosser))
		return

	// you just jumped out of a dropship, have fun living on the way down!
	var/list/ground_z_levels = SSmapping.levels_by_trait(ZTRAIT_GROUND)
	if(!length(ground_z_levels))
		return qdel(crosser)

	//find a random spot to drop them
	var/list/area/potential_areas = shuffle(SSmapping.areas_in_z["[ground_z_levels[1]]"])
	for(var/area/potential_area in potential_areas)
		if(potential_area.flags_area & NO_DROPPOD || potential_area.flags_area & OB_CAS_IMMUNE || !potential_area.outside)
			continue
		if(isspacearea(potential_area)) // make sure its not space, just in case
			continue

		var/turf/open/possible_turf
		var/list/area_turfs = get_area_turfs(potential_area)
		for(var/i in 1 to 10)
			possible_turf = pick_n_take(area_turfs)
			// we're looking for an open, non-dense, and non-space turf.
			if(!istype(possible_turf) || is_blocked_turf(possible_turf) || isspaceturf(possible_turf))
				continue

		if(!istype(possible_turf) || is_blocked_turf(possible_turf) || isspaceturf(possible_turf))
			continue // couldnt find one in 10 loops, check another area

		// we found a good turf, lets drop em
		crosser.handle_airdrop(possible_turf)
		return
	return qdel(crosser)

/atom/movable/proc/handle_airdrop(turf/target_turf)
	pixel_z = 360
	forceMove(target_turf)
	animate(src, time = 6, pixel_z = 0, flags = ANIMATION_PARALLEL)
	target_turf.ceiling_debris(2 SECONDS)

/obj/handle_airdrop(turf/target)
	..()
	if(!CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE) && prob(30)) // throwing objects from the air is not always a good idea
		deconstruct(FALSE)

/obj/structure/closet/handle_airdrop(turf/target_turf) // good idea but no
	if(!opened)
		for(var/atom/movable/content in src)
			content.handle_airdrop(target_turf)
		open()
	. = ..()

/obj/item/handle_airdrop(turf/target_turf)
	..()
	if(QDELETED(src))
		return
	if(!CHECK_BITFIELD(resistance_flags, INDESTRUCTIBLE) && w_class < WEIGHT_CLASS_NORMAL) //tiny and small items will be lost, good riddance
		deconstruct(FALSE)
		return
	explosion_throw(200) // give it a bit of a kick

/obj/item/explosive/handle_airdrop(turf/target_turf)
	if(active)
		deconstruct(FALSE)
		return
	..()

/mob/living/handle_airdrop(turf/target_turf)
	..()
	remove_status_effect(/datum/status_effect/spacefreeze)
	Paralyze(30 SECONDS)
	playsound(target_turf, "punch", 100, TRUE)
	playsound(target_turf, "bone_break", 100, TRUE)

	Knockdown(10 SECONDS)
	Stun(3 SECONDS)
	SetParalyzed(0)
	take_overall_damage(300, BRUTE, BOMB, updating_health = TRUE)
	take_overall_damage(300, BRUTE, MELEE, updating_health = TRUE)
	visible_message(span_warning("[src] falls out of the sky."), span_highdanger("As you fall out of the sky, you plummet towards the ground."))
