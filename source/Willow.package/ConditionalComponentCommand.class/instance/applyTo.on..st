processing
applyTo: aComponent on: aCanvas

	(conditionBlock cull: aComponent)
		ifTrue: [ command applyTo: aComponent on: aCanvas ]