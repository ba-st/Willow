evaluating
apply: anAsynchronousCall to: aComponent on: aCanvas

	aComponent
		addButton: acceptanceText
		do:
			(aCanvas jQuery
				script: [ :script | 
					script << anAsynchronousCall.
					script << aCanvas jQuery new dialog close ])