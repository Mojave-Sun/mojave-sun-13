/datum/bodypart_aid/gauze/ms13
	name = "gauze"
	stack_to_drop = /obj/item/stack/medical/gauze/ms13
	overlay_prefix = "gauze"
	desc_prefix = "bandaged"
	/// How much more can we absorb
	absorption_capacity = 5
	/// How fast do we absorb
	absorption_rate = 0.12
 	/// How much does the gauze help with keeping infections clean
	sanitisation_factor = 0.5
	/// How much sanitisation we've got after we become fairly stained and worn
	sanitisation_factor_stained = 0.9

/datum/bodypart_aid/gauze/ms13/military
	name = "military gauze"
	stack_to_drop = /obj/item/stack/medical/gauze/ms13/military
	overlay_prefix = "gauze"
	/// How much more can we absorb
	absorption_capacity = 6.5
	/// How fast do we absorb
	absorption_rate = 0.18
	/// How much does the gauze help with keeping infections clean
	sanitisation_factor = 0.35
	/// How much sanitisation we've got after we become fairly stained and worn
	sanitisation_factor_stained = 0.7

/datum/bodypart_aid/splint/ms13
	name = "splint"
	splint_factor = 0.4
	stack_to_drop = /obj/item/stack/medical/splint/ms13
	overlay_prefix = "splint_improv"

/datum/bodypart_aid/splint/ms13/wooden
	name = "wooden splint"
	splint_factor = 0.6
	stack_to_drop = /obj/item/stack/medical/splint/ms13/wooden
	overlay_prefix = "splint_improv"
