instance creation
labeled: aRenderable onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent

	^ self
		labeledAccordingTo: (Optional containing: aRenderable)
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent