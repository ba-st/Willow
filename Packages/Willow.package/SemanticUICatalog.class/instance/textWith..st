accessing
textWith: aContentBlock

	^ [ :canvas | 
	canvas div
		class: SemanticStyle for text;
		with: aContentBlock ]