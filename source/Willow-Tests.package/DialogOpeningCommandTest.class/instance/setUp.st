initialization
setUp

	super setUp.
	command := DialogOpeningCommand alwaysOpening: [ :canvas | canvas dialog attributeAt: 'open' put: true ]