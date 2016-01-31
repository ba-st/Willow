evaluating
applyTo: aComponent on: aCanvas

	self prepareActions.
	self shouldApplyActions
		ifTrue: 
			[triggerPolicy
				apply: (self commandToExecuteOn: aCanvas)
				to: aComponent
				on: aCanvas]