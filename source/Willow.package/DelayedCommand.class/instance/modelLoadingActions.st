accessing
modelLoadingActions

	^ Array with: [ :aScript :aCanvas | interpreter applyTo: aScript on: aCanvas ]