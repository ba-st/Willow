rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas button.
	componentCommand applyTo: component on: aCanvas.
	interactionInterpreter applyTo: component on: aCanvas.
	component
		class: SemanticStyle ui button;
		with: label