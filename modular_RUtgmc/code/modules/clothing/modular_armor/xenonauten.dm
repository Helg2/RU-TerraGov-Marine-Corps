/obj/item/clothing/suit/modular/xenonauten/light
	soft_armor = list(MELEE = 35, BULLET = 55, LASER = 55, ENERGY = 50, BOMB = 40, BIO = 45, FIRE = 45, ACID = 45)
	slowdown = SLOWDOWN_ARMOR_VERY_LIGHT

/obj/item/clothing/suit/modular/xenonauten //medium
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 65, ENERGY = 55, BOMB = 45, BIO = 50, FIRE = 50, ACID = 50)
	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/module/mimir_environment_protection,
		/obj/item/armor_module/module/mimir_environment_protection/mark1,
		/obj/item/armor_module/module/hlin_explosive_armor,
		/obj/item/armor_module/module/ballistic_armor,
		/obj/item/armor_module/module/chemsystem,
		/obj/item/armor_module/module/eshield,
		/obj/item/armor_module/module/sigyn_acid_armor,
		/obj/item/armor_module/module/sigyn_acid_armor/mark1,

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

/obj/item/clothing/suit/modular/xenonauten/heavy
	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 70, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 50, ACID = 60)
	slowdown = SLOWDOWN_ARMOR_VERY_HEAVY

/obj/item/clothing/head/modular/m10x
	soft_armor = list(MELEE = 45, BULLET = 65, LASER = 65, ENERGY = 55, BOMB = 45, BIO = 50, FIRE = 50, ACID = 50)

/obj/item/clothing/head/modular/m10x/leader
	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 70, ENERGY = 60, BOMB = 50, BIO = 50, FIRE = 50, ACID = 55)

/obj/item/clothing/suit/modular/xenonauten/light/mk1
	name = "\improper Xenonauten-L-MK1 pattern armored vest"
	greyscale_config = /datum/greyscale_config/xenonaut/mk1/light

/obj/item/clothing/suit/modular/xenonauten/mk1
	name = "\improper Xenonauten-M-MK1 pattern armored vest"
	greyscale_config = /datum/greyscale_config/xenonaut/mk1/medium

/obj/item/clothing/suit/modular/xenonauten/heavy/mk1
	name = "\improper Xenonauten-H-MK1 pattern armored vest"
	greyscale_config = /datum/greyscale_config/xenonaut/mk1/heavy

/obj/item/clothing/head/modular/m10x
	name = "\improper M10X pattern marine helmet"
	desc = "A standard M10 Pattern Helmet with attach points. It reads on the label, 'The difference between an open-casket and closed-casket funeral. Wear on head for best results.'."

	item_state_worn = TRUE
	soft_armor = list(MELEE = 50, BULLET = 70, LASER = 70, ENERGY = 60, BOMB = 55, BIO = 55, FIRE = 55, ACID = 60)
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
		/obj/item/armor_module/module/sigyn_head,
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
	)

/obj/item/clothing/head/modular/m10x/heavy
	name = "\improper M10XE pattern marine helmet"
	desc = "A standard M10XE Pattern Helmet. This is a modified version of the M10X helmet, offering an enclosed visor apparatus."
	item_state = "helm"
	greyscale_config = /datum/greyscale_config/xenonaut/helm/heavy
	starting_attachments = list(/obj/item/armor_module/armor/visor/marine/xenonaut, /obj/item/armor_module/storage/helmet)
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
		/obj/item/armor_module/module/motion_detector,
		/obj/item/armor_module/module/sigyn_head,
		/obj/item/armor_module/storage/helmet,
		/obj/item/armor_module/armor/badge,
		/obj/item/armor_module/armor/visor/marine/xenonaut,
	)

/obj/item/clothing/head/modular/m10x/mk1
	name = "\improper M10X1 pattern marine helmet"
	greyscale_config = /datum/greyscale_config/xenonaut/helm/mk1

/obj/item/clothing/suit/modular/xenonauten/pilot
	attachments_allowed = list(
		/obj/item/armor_module/module/better_shoulder_lamp,
		/obj/item/armor_module/module/valkyrie_autodoc,
		/obj/item/armor_module/module/fire_proof,
		/obj/item/armor_module/module/tyr_extra_armor,
		/obj/item/armor_module/module/tyr_extra_armor/mark1,
		/obj/item/armor_module/module/sigyn_acid_armor,
		/obj/item/armor_module/module/sigyn_acid_armor/mark1,
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
		/obj/item/armor_module/storage/injector,
		/obj/item/armor_module/storage/integrated,
		/obj/item/armor_module/armor/badge,
	)
