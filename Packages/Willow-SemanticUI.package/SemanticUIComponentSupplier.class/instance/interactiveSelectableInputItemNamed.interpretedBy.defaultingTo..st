accessing
interactiveSelectableInputItemNamed: aName interpretedBy: anInputInterpreter defaultingTo: aDefaultModel

	| inputView |

	inputView := self interactiveInputItemNamed: aName interpretedBy: anInputInterpreter.
	^ SemanticSelectableInput
		selecting: inputView
		defaultingTo: aDefaultModel
		applying: (CssStyleCommand toStyleWith: SemanticStyle for item)