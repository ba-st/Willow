instance creation
displayingAtOnce: aNumberOfElements applying: aCommandComponent

	AssertionChecker enforce: [ aNumberOfElements > 1 ] because: 'A list box must display more than one element'.

	^ self new initializeApplying: (SetComponentSizeCommand setting: aNumberOfElements) + aCommandComponent