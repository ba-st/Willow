processing
applyTo: aComponent on: aCanvas

	^ aComponent onError: (actionProvider value: aCanvas)