applying
applyTo: aComponent on: aCanvas

	^ aComponent script: (scriptProvider cull: aCanvas)