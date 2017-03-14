accessing
containerWith: aContentBlock

	^ [ :canvas | 
	canvas div
		class: SemanticStyle ui container;
		with: aContentBlock ]