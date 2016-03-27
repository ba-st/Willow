rendering
renderContentOn: aCanvas

	| containerComponent |

	containerComponent := aCanvas div.
	componentCommand applyTo: containerComponent on: aCanvas.
	containerComponent
		with: [ aCanvas
				render: checkboxView;
				render: inputView ]