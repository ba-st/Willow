accessing
modelLoadingActions

	^ Array with: [ :aScript :aCanvas | aScript << (DialogOpener new open: dialogView on: aCanvas) ]