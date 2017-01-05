accessing
bottomMenuWith: aContentBlock

	^ [ :canvas | 
	canvas div
		class: SemanticStyle ui bottom fixed borderless inverted olive menu;
		with: aContentBlock ]