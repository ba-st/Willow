accessing
serverIndependentActions

	^ Array
		with: [ :aScript :aCanvas | 
			aScript
				<< ((componentProvider value: aCanvas) perform: transformationMessage with: styleToChange) ]