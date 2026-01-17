///@description Disable btn when loading

// Inherit the parent event
event_inherited();

if (layer_get_visible("UI_loading") == true) isActive = false;
