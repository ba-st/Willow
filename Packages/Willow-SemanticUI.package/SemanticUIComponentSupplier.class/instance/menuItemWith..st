accessing
menuItemWith: aContentBlock

	^ [ :canvas | 
	canvas div
		class: SemanticStyle for item;
		with: aContentBlock ]