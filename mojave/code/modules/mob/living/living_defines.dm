/mob/living
	/**
	 * NV FOV that is applied from either nativeness or traits
	 * THIS IS ACTUALLY A LIST UNLIKE NORMAL FOV_VIEW, INDEXED BY COMPONENT VAR NAMES
	 */
	var/list/nv_data
	/// Lazy list of NV FOV traits that will apply NV when handled
	var/list/nv_traits
