accessing
serverIndependentActions

	^ Array with: [ :aScript :aCanvas | aScript << (self firstDialogButtonOn: aCanvas) call: 'click' ]