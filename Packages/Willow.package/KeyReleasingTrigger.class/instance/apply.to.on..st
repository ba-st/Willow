evaluating
apply: anAsynchronousCall to: aComponent on: aCanvas

	self ensureIdFor: aComponent on: aCanvas.
	aComponent script: (aCanvas jQuery this onKeyUp: anAsynchronousCall)