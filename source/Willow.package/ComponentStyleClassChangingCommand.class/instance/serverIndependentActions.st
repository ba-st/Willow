accessing
serverIndependentActions
	^ Array with: [ :aScript :aCanvas | aScript << (transformationProvider value:(self applyStyleChangeToComponentOn: aCanvas)) ]