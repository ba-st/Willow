Instance Creation
transformingCurrentViewInto: aViewWhileDisabled

	^self transformingComponentMatching: [:canvas | canvas jQuery this] into: aViewWhileDisabled