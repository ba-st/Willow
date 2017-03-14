accessing
interactiveSelectableInputItemNamed: aName interpretedBy: anInputInterpreter defaultingTo: aDefaultModel

	| inputView |

	inputView := self interactiveInputItemNamed: aName interpretedBy: anInputInterpreter.
	^ SemanticSelectableInput
		selecting: inputView
		defaultingTo: aDefaultModel
		applying: (ComponentClassificationCommand toStyleWith: SemanticStyle for item)