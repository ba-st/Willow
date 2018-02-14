processing
applyTo: anAnchorComponent on: aCanvas

	anAnchorComponent url: destination.
	targetOptional
		withContentDo: [ :target | 
			anAnchorComponent
				target: target;
				relationship: 'noopener noreferrer' ]