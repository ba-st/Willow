processing
applyTo: aComponent on: aCanvas

	self contentDataCommand applyTo: aComponent on: aCanvas.
	aComponent script: (self popupScriptOn: aCanvas)