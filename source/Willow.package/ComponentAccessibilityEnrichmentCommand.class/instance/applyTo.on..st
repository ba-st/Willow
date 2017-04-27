processing
applyTo: aComponent on: aCanvas

	(ComponentAttributeCommand named: self ariaAttribute with: content)
		applyTo: aComponent
		on: aCanvas