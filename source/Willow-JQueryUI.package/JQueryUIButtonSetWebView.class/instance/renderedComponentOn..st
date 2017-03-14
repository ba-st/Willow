private-rendering
renderedComponentOn: aCanvas

	^(aCanvas div)
		script: aCanvas jQuery new buttonset;
		yourself