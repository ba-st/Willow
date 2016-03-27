accessing
rightActiveMenuItemWith: aContentBlock

	^ [ :canvas | 
	canvas div
		class: SemanticStyle for right item active;
		with: aContentBlock ]