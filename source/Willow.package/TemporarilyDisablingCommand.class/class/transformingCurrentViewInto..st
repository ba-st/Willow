Instance Creation
transformingCurrentViewInto: aViewWhileDisabled

	^self transformingComponengMatching: [:canvas | canvas jQuery this] into: aViewWhileDisabled