evaluating
apply: aJavascriptScript to: aComponent on: aCanvas

	aCanvas ensureIdFor: aComponent.
	aComponent script: (aCanvas jQuery this perform: interacionSelector with: aJavascriptScript)