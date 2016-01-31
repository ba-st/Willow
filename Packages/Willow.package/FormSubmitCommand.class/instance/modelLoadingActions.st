acccessing
modelLoadingActions

	^ Array with: [ :aScript :aCanvas | aScript << (componentProvider value: aCanvas) call: 'submit' ]