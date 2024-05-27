/obj/item/clothing/suit/modular/jaeger
	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/module/sigyn_acid_armor,
		/obj/item/armor_module/module/sigyn_acid_armor/mark1,
		/obj/item/armor_module/module/vidar,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/module/chemsystem,
		/obj/item/armor_module/module/eshield,

		/obj/item/armor_module/storage/general,
		/obj/item/armor_module/storage/ammo_mag,
		/obj/item/armor_module/storage/engineering,
		/obj/item/armor_module/storage/medical,
		/obj/item/armor_module/storage/general/som,
		/obj/item/armor_module/storage/engineering/som,
		/obj/item/armor_module/storage/medical/som,
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/grenade,
		/obj/item/armor_module/storage/integrated,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/suit/modular/jaeger/light
	soft_armor = list(MELEE = 35, BULLET = 55, LASER = 55, ENERGY = 50, BOMB = 40, BIO = 45, FIRE = 45, ACID = 45)
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT

/obj/item/clothing/suit/modular/jaeger //medium
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 65, ENERGY = 55, BOMB = 45, BIO = 50, FIRE = 50, ACID = 50)

/obj/item/clothing/suit/modular/jaeger/heavy
	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 70, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 50, ACID = 60)
	slowdown = SLOWDOWN_ARMOR_VERY_HEAVY

/obj/item/clothing/head/modular/marine
	colorable_allowed = PRESET_COLORS_ALLOWED|HAIR_CONCEALING_CHANGE_ALLOWED
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 65, ENERGY = 55, BOMB = 45, BIO = 50, FIRE = 50, ACID = 50)

//jaeger hats
/obj/item/clothing/head/modular/marine
	attachments_allowed = list(
		/obj/item/armor_module/module/tyr_head,
		/obj/item/armor_module/module/fire_proof_helmet,
		/obj/item/armor_module/module/hod_head,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet/mark1,
		/obj/item/armor_module/module/welding,
		/obj/item/armor_module/module/welding/superior,
		/obj/item/armor_module/module/binoculars,
		/obj/item/armor_module/module/binoculars/artemis_mark_two,
		/obj/item/armor_module/module/artemis,
		/obj/item/armor_module/module/antenna,
		/obj/item/armor_module/module/night_vision,
		/obj/item/armor_module/module/motion_detector,
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
		/obj/item/armor_module/armor/visor/marine,
		/obj/item/armor_module/armor/visor/marine/skirmisher,
		/obj/item/armor_module/armor/visor/marine/scout,
		/obj/item/armor_module/armor/visor/marine/eva,
		/obj/item/armor_module/armor/visor/marine/eva/skull,
		/obj/item/armor_module/armor/visor/marine/gungnir,
		/obj/item/armor_module/armor/visor/marine/eod,
		/obj/item/armor_module/armor/visor/marine/assault,
		/obj/item/armor_module/armor/visor/marine/helljumper,
		/obj/item/armor_module/armor/visor/marine/ranger,
		/obj/item/armor_module/armor/visor/marine/traditional,
		/obj/item/armor_module/armor/visor/marine/trooper,
		/obj/item/armor_module/armor/visor/marine/kabuto,
		/obj/item/armor_module/armor/visor/marine/hotaru,
		/obj/item/armor_module/armor/visor/marine/dashe,
		/obj/item/armor_module/armor/visor/marine/fourvisor,
		/obj/item/armor_module/armor/visor/marine/foureyevisor,
		/obj/item/armor_module/armor/visor/marine/markonevisor,
		/obj/item/armor_module/armor/secondary_color/helm,
	)
