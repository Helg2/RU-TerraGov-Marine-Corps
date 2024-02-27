/obj/structure/closet
	//var to prevent welding stasis bags and tarps
	var/can_be_welded = TRUE
	//the amount of material you drop
	var/drop_material_amount = 1

/obj/structure/closet/welder_act(mob/living/user, obj/item/tool/weldingtool/welder)
	if(!can_be_welded)
		return FALSE
	if(!welder.isOn())
		return FALSE

	if(opened)
		if(!welder.use_tool(src, user, 2 SECONDS, 1, 50))
			balloon_alert(user, "Need more welding fuel")
			return TRUE
		balloon_alert_to_viewers("\The [src] is cut apart by [user]!")
		deconstruct()
		return TRUE

	if(!welder.use_tool(src, user, 2 SECONDS, 1, 50))
		balloon_alert(user, "Need more welding fuel")
		return TRUE
	welded = !welded
	update_icon()
	balloon_alert_to_viewers("[src] has been [welded ? "welded shut" : "unwelded"]")
	return TRUE

/obj/structure/closet/deconstruct(disassembled = TRUE)
	if(ispath(drop_material) && drop_material_amount)
		new drop_material(loc, drop_material_amount)
	dump_contents()
	return ..()

/obj/structure/closet/secure_closet/marine
	name = "marine's locker"
	req_access = list(ACCESS_MARINE_PREP)
	icon_state = "marine_locked"
	icon_closed = "marine_unlocked"
	icon_locked = "marine_locked"
	icon_opened = "marine_open"
	icon_broken = "marine_emmaged"
	icon_off = "marine_off"
	icon = 'modular_RUtgmc/icons/obj/structures/closet.dmi'
	var/closet_squad //which squad this closet belong to

/obj/structure/closet/secure_closet/marine/Initialize()
	. = ..()
	if(closet_squad)
		icon_state = "[closet_squad]_locked"
		icon_closed = "[closet_squad]_unlocked"
		icon_locked = "[closet_squad]_locked"
		icon_broken = "[closet_squad]_emmaged"
		icon_off = "[closet_squad]_off"

/obj/structure/closet/secure_closet/marine/PopulateContents()
	if(SSmapping.configs[GROUND_MAP].environment_traits[MAP_COLD])
		new /obj/item/clothing/mask/rebreather/scarf(src)

/obj/structure/closet/secure_closet/marine/alpha
	name = "alpha equipment locker"
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_ALPHA)
	closet_squad = "alpha"

/obj/structure/closet/secure_closet/marine/alpha/PopulateContents()
	. = ..()
	new /obj/item/radio/headset/mainship/marine/alpha(src)
	new /obj/item/clothing/head/tgmcberet/squad/alpha(src)
	new /obj/item/clothing/head/tgmcberet/squad/alpha/black(src)
	new /obj/item/clothing/mask/bandanna/alpha(src)
	new /obj/item/clothing/head/squad_headband/alpha(src)

/obj/structure/closet/secure_closet/marine/bravo
	name = "bravo equipment locker"
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_BRAVO)
	closet_squad = "bravo"

/obj/structure/closet/secure_closet/marine/bravo/PopulateContents()
	. = ..()
	new /obj/item/radio/headset/mainship/marine/bravo(src)
	new /obj/item/clothing/head/tgmcberet/squad/bravo(src)
	new /obj/item/clothing/head/tgmcberet/squad/bravo/black(src)
	new /obj/item/clothing/mask/bandanna/bravo(src)
	new /obj/item/clothing/head/squad_headband/bravo(src)

/obj/structure/closet/secure_closet/marine/charlie
	name = "charlie equipment locker"
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_CHARLIE)
	closet_squad = "charlie"

/obj/structure/closet/secure_closet/marine/charlie/PopulateContents()
	. = ..()
	new /obj/item/radio/headset/mainship/marine/charlie(src)
	new /obj/item/clothing/head/tgmcberet/squad/charlie(src)
	new /obj/item/clothing/head/tgmcberet/squad/charlie/black(src)
	new /obj/item/clothing/mask/bandanna/charlie(src)
	new /obj/item/clothing/head/squad_headband/charlie(src)

/obj/structure/closet/secure_closet/marine/delta
	name = "delta equipment locker"
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_DELTA)
	closet_squad = "delta"

/obj/structure/closet/secure_closet/marine/delta/PopulateContents()
	. = ..()
	new /obj/item/radio/headset/mainship/marine/delta(src)
	new /obj/item/clothing/head/tgmcberet/squad/delta(src)
	new /obj/item/clothing/head/tgmcberet/squad/delta/black(src)
	new /obj/item/clothing/mask/bandanna/delta(src)
	new /obj/item/clothing/head/squad_headband/delta(src)
