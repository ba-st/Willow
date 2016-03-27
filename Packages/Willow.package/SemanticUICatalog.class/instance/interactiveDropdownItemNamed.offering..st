accessing
interactiveDropdownItemNamed: aName offering: anOptionCollection

	^ SemanticDropdown
		named: aName
		offering: anOptionCollection
		applying: (CssStyleCommand toStyleWith: SemanticStyle for item)