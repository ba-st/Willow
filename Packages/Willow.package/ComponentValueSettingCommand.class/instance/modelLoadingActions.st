accessing
modelLoadingActions

	^ Array
		with: [ :aScript :aCanvas | 
			(aScript << (aCanvas jQuery id: identifierProvider value))
				value: valueProvider value;
				trigger: 'change' ]