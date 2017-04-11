initialization
initialize

	super initialize.
	scriptCommand := ComponentScriptCommand toExecute: [ :canvas | canvas jQuery this propertyAt: 'selectedIndex' put: -1 ]