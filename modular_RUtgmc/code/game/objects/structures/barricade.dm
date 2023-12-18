/obj/structure/barricade/metal
	max_integrity = 225 //4 sheets

/obj/structure/barricade/metal/plasteel
	name = "plasteel barricade"
	desc = "A sturdy and heavily assembled barricade made of plasteel plates. Use a blowtorch to repair."
	icon_state = "new_plasteel_0"
	max_integrity = 350 //4 sheets
	soft_armor = list(MELEE = 0, BULLET = 45, LASER = 45, ENERGY = 45, BOMB = 35, BIO = 100, FIRE = 80, ACID = 55)
	stack_type = /obj/item/stack/sheet/plasteel
	stack_amount = 4
	destroyed_stack_amount = 2
	hit_sound = "sound/effects/metalhit.ogg"
	barricade_type = "new_plasteel"
	can_wire = TRUE
	resistance_flags = UNACIDABLE|XENO_DAMAGEABLE

/obj/structure/barricade/metal/plasteel/attackby(obj/item/I, mob/user, params)
	. = ..()

	if(!istype(I, /obj/item/stack/sheet/plasteel))
		return

	if(obj_integrity >= max_integrity * 0.3)
		return

	var/obj/item/stack/sheet/plasteel/plasteel_sheets
	if(plasteel_sheets.get_amount() < 2)
		balloon_alert(user, "You need at least 2 plasteel")
		return FALSE

	if(LAZYACCESS(user.do_actions, src))
		return

	balloon_alert_to_viewers("Repairing base...")

	if(!do_after(user, 2 SECONDS, TRUE, src, BUSY_ICON_FRIENDLY) || obj_integrity >= max_integrity * 0.3)
		return FALSE

	if(!plasteel_sheets.use(2))
		return FALSE

	repair_damage(max_integrity * 0.3, user)
	balloon_alert_to_viewers("Base repaired")
	update_icon()

#define BARRICADE_PLASTEEL_LOOSE 0
#define BARRICADE_PLASTEEL_ANCHORED 1
#define BARRICADE_PLASTEEL_FIRM 2

/obj/structure/barricade/plasteel/metal
	name = "folding metal barricade"
	desc = "A folding barricade made out of metal, making it slightly weaker than a normal metal barricade. Use a blowtorch to repair. Can be flipped down to create a path."
	icon_state = "folding_metal_closed_0"
	max_integrity = 350 //6 sheets
	soft_armor = list(MELEE = 0, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 0, BIO = 100, FIRE = 80, ACID = 40)
	stack_type = /obj/item/stack/sheet/metal
	stack_amount = 6
	destroyed_stack_amount = 3
	barricade_type = "folding_metal"

/obj/structure/barricade/plasteel/metal/welder_act(mob/living/user, obj/item/I)
	. = welder_repair_act(user, I, 85, 2.5 SECONDS, 0.3, SKILL_ENGINEER_PLASTEEL, 1)
	if(. == BELOW_INTEGRITY_THRESHOLD)
		balloon_alert(user, "Too damaged. Use metal sheets.")

/obj/structure/barricade/plasteel/metal/attackby(obj/item/I, mob/user, params)
	. = ..()

	if(istype(I, /obj/item/stack/sheet/metal))
		var/obj/item/stack/sheet/metal/metal_sheets = I
		if(obj_integrity >= max_integrity * 0.3)
			return

		if(metal_sheets.get_amount() < 2)
			balloon_alert(user, "You need at least 2 metal")
			return

		if(LAZYACCESS(user.do_actions, src))
			return

		balloon_alert_to_viewers("Repairing base...")

		if(!do_after(user, 1.5 SECONDS, TRUE, src, BUSY_ICON_FRIENDLY) || obj_integrity >= max_integrity * 0.3)
			return

		if(!metal_sheets.use(2))
			return

		repair_damage(max_integrity * 0.3, user)
		balloon_alert_to_viewers("Base repaired")
		update_icon()

/obj/structure/barricade/plasteel/metal/crowbar_act(mob/living/user, obj/item/I)
	if(!iscrowbar(I))
		return

	if(busy || !COOLDOWN_CHECK(src, tool_cooldown))
		return

	if(LAZYACCESS(user.do_actions, src))
		return

	COOLDOWN_START(src, tool_cooldown, 1 SECONDS)

	switch(build_state)
		if(BARRICADE_PLASTEEL_FIRM)
			balloon_alert_to_viewers("[linked ? "un" : "" ]linked")
			linked = !linked
			for(var/direction in GLOB.cardinals)
				for(var/obj/structure/barricade/plasteel/metal/cade in get_step(src, direction))
					cade.update_icon()
			update_icon()
		if(BARRICADE_PLASTEEL_LOOSE) //Anchor bolts loosened step. Apply crowbar to unseat the panel and take apart the whole thing.
			if(user.skills.getRating(SKILL_ENGINEER) < SKILL_ENGINEER_PLASTEEL)
				var/fumbling_time = 5 SECONDS * ( SKILL_ENGINEER_PLASTEEL - user.skills.getRating(SKILL_ENGINEER) )
				if(!do_after(user, fumbling_time, TRUE, src, BUSY_ICON_UNSKILLED))
					return
			balloon_alert_to_viewers("disassembling")
			playsound(loc, 'sound/items/crowbar.ogg', 25, 1)
			busy = TRUE

			if(!do_after(user, 50, TRUE, src, BUSY_ICON_BUILD))
				busy = FALSE
				return

			busy = FALSE
			user.visible_message(span_notice("[user] takes [src]'s panels apart."),
			span_notice("You take [src]'s panels apart."))
			playsound(loc, 'sound/items/deconstruct.ogg', 25, 1)
			var/deconstructed = TRUE
			for(var/obj/effect/xenomorph/acid/A in loc)
				if(A.acid_t != src)
					continue
				deconstructed = FALSE
				break
			deconstruct(deconstructed)

/obj/structure/barricade/plasteel
	soft_armor = list(MELEE = 0, BULLET = 45, LASER = 45, ENERGY = 45, BOMB = 30, BIO = 100, FIRE = 80, ACID = 55)
	stack_amount = 6
	destroyed_stack_amount = 3

#undef BARRICADE_PLASTEEL_LOOSE
#undef BARRICADE_PLASTEEL_ANCHORED
#undef BARRICADE_PLASTEEL_FIRM

/obj/structure/barricade/hitby(atom/movable/atom_movable)
	if(atom_movable.throwing && is_wired)
		if(iscarbon(atom_movable))
			var/mob/living/carbon/living_carbon = atom_movable
			if(living_carbon.mob_size <= MOB_SIZE_XENO) // so most of t3 xeno's are immune to that
				balloon_alert(living_carbon, "Wire slices into us")
				living_carbon.apply_damage(10, blocked = MELEE , sharp = TRUE, updating_health = TRUE)
				living_carbon.Knockdown(2 SECONDS) //Leaping into barbed wire is VERY bad
				playsound(living_carbon, 'modular_RUtgmc/sound/machines/bonk.ogg', 75, FALSE)
	..()
