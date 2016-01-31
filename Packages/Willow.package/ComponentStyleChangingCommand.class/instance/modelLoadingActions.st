accessing
modelLoadingActions

	^Array with: 
			[:aScript :aCanvas |
			| component transformedComponent |
			component := componentProvider value: aCanvas.
			transformedComponent := transformationProvider
						value: (component perform: transformationMessage with: styleToToggle).
			aScript << transformedComponent]