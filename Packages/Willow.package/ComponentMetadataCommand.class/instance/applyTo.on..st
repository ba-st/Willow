processing
applyTo: aComponent on: aCanvas

	(ComponentAttributeCommand named: self dataAttribute with: content)
		applyTo: aComponent
		on: aCanvas