accessing
topMenuWith: aContentBlock

	^ [ :canvas | 
	canvas div
		class: SemanticStyle ui top fixed borderless inverted brown secondary five item stackable menu;
		with: aContentBlock ]