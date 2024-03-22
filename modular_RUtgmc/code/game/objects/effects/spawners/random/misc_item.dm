/obj/effect/spawner/random/misc/plushie
	loot = list(
		/obj/item/toy/plush/moth,
		/obj/item/toy/plush/rouny,
		/obj/item/toy/plush/therapy_blue,
		/obj/item/toy/plush/therapy_green,
		/obj/item/toy/plush/therapy_yellow,
		/obj/item/toy/plush/therapy_orange,
		/obj/item/toy/plush/therapy_red,
		/obj/item/toy/plush/therapy_purple,
		/obj/item/toy/plush/pig,
	)

/obj/effect/spawner/random/misc/koran
	name = "Random koran spawner"
	icon = 'modular_RUtgmc/icons/effects/random/misc.dmi'
	icon_state = "random_koran"
	spawn_loot_chance = 75
	loot = list(
		/obj/item/storage/bible/koran,
		/obj/item/namaz,
		/obj/item/storage/holster/blade/tomahawk/classic/full,
		/obj/item/toy/plush/pig,
		/obj/item/reagent_containers/hypospray/autoinjector/hypervene,
	) // feel free to write something in here, just not the OB bomb vest

/obj/effect/spawner/random/misc/dogs
	name = "Random dogs spawner"
	icon = 'modular_RUtgmc/icons/effects/random/misc.dmi'
	icon_state = "random_dogs"
	loot_subtype_path = /mob/living/simple_animal/corgi

/obj/effect/spawner/random/misc/doggies
	name = "Random doggies spawner"
	icon = 'modular_RUtgmc/icons/effects/random/misc.dmi'
	icon_state = "random_doggies"
	spawn_loot_chance = 75
	loot = list(
		/obj/item/clothing/suit/ianshirt,
		/obj/effect/spawner/random/misc/dogs,
	)
