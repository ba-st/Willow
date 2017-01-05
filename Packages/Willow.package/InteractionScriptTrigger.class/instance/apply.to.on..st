evaluating
apply: anAsynchronousCall to: aComponent on: aCanvas

	aCanvas ensureIdFor: aComponent.
	aComponent
		script: (aCanvas jQuery this perform: interacionSelector with: anAsynchronousCall)