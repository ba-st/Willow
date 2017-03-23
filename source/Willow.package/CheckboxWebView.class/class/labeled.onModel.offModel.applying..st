instance creation
labeled: aLabel onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent

	^ self
		labeledAccordingTo: (Optional containing: aLabel)
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent