accessing
modelLoadingActions

	^Array with: [:aScript :aCanvas |
		shouldOpen ifTrue: [aScript << (DialogOpener new open: dialogView on: aCanvas)]]