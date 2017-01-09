accessing
modelLoadingActions
	^ Array
		with: [ :aScript :aCanvas | 
			(aScript << (aCanvas jQuery id: identifier))
				value: valueProvider value;
				trigger: 'change' ]