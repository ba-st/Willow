processing
applyTo: aComponent on: aCanvas

	(aComponent attributeAt: 'src') addField: 'time' value: Time millisecondClockValue