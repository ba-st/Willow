Instance Creation
transforming: anIdentifieView into: aViewWhileDisabled

	^self
		transformingComponengMatching: [:canvas | canvas jQuery id: anIdentifieView id]
		into: aViewWhileDisabled