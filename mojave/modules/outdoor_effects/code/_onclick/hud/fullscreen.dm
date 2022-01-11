/* Our sunlight planemaster mashes all of our sunlight overlays together into one             */
/* The fullscreen then grabs the plane_master with a layer filter, and colours it             */
/* We do this so the sunlight fullscreen acts as a big lighting object, in our lighting plane */
/atom/movable/screen/fullscreen/lighting_backdrop/Sunlight
	icon_state  = ""
	screen_loc = "CENTER"
	transform = null
	plane = LIGHTING_PLANE
	blend_mode = BLEND_ADD
	show_when_dead = TRUE

/atom/movable/screen/fullscreen/lighting_backdrop/Sunlight/Initialize()
	. = ..()
	filters += filter(type="layer", render_source=SUNLIGHTING_RENDER_TARGET)
	SSoutdoor_effects.sunlighting_planes |= src
	color = SSoutdoor_effects.last_color
	if(SSoutdoor_effects.initialized)
		SSoutdoor_effects.transition_sunlight_color(src)

/atom/movable/screen/fullscreen/lighting_backdrop/Sunlight/Destroy()
	. = ..()
	SSoutdoor_effects.sunlighting_planes -= src
