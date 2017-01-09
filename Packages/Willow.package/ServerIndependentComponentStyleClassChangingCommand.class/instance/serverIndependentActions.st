accessing
serverIndependentActions
	^ Array with: [ :aScript :aCanvas | aScript << (self applyStyleChangeToComponentOn: aCanvas) ]