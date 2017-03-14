accessing
interactiveDropdownItemNamed: aName offering: anOptionCollection

	^ SemanticDropdown
		named: aName
		offering: anOptionCollection
		interactingThrough: WebInteractionInterpreter forChangeInComponentValue
		applying: (ComponentClassificationCommand toStyleWith: SemanticStyle for item)