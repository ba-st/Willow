accessing
interactiveDropdownItemNamed: aName offering: anOptionCollection

	^ SemanticDropdown
		named: aName
		offering: anOptionCollection
		interactingThrough: WebInteractionInterpreter forChangeInComponentValue
		applying: (CssStyleCommand toStyleWith: SemanticStyle for item)