accessing
modelLoadingActions

	^ Array
		with:
			[ :aScript :aCanvas | 
			aScript << (aCanvas jQuery id: identifiedView identifier)
				value: valueProvider value;
				trigger: 'change' ]