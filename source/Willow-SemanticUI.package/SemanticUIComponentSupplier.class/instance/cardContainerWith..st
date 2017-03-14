accessing
cardContainerWith: aContentBlock

	^ [ :canvas | 
	canvas div
		class: SemanticStyle ui two cards container;
		with: aContentBlock ]