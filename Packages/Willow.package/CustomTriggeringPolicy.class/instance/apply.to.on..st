evaluating
apply: anAsynchronousCall to: aComponent on: aCanvas

	self ensureIdFor: aComponent on: aCanvas.
	aComponent
		script: (triggerCommand value: anAsynchronousCall value: aCanvas)