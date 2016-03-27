accessing
rightMenuItemWith: aContentBlock

	^ [ :canvas | 
	canvas div
		class: SemanticStyle for right item;
		with: aContentBlock ]