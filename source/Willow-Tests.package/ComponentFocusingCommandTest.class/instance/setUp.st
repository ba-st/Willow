initialization
setUp

	super setUp.
	command := ComponentFocusingCommand findingComponentUsing: [ :canvas | canvas jQuery this ]