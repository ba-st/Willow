rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas div.
	componentCommand applyTo: component on: aCanvas.
	component with: inputView