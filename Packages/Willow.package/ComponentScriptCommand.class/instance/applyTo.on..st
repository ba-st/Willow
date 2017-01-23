applying
applyTo: aComponent on: aCanvas

	^ aComponent script: (scriptProvider value: aCanvas)