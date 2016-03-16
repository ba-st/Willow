rendering
renderContentOn: aCanvas

	| component |

	component := aCanvas div.
	componentCommand applyTo: component on: aCanvas.
	component
		class: 'ui selection dropdown item';
		script: (self dropdownScriptOn: aCanvas);
		with: [ self renderInputOn: aCanvas.
			self renderIconOn: aCanvas.
			self renderNameOn: aCanvas.
			self renderOptionsOn: aCanvas ]