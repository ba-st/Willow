instance creation
displayingAtOnce: aNumberOfElements applying: aCommandComponent

	AssertionChecker
		enforce: [ aNumberOfElements > 1 ]
		because: 'A list box must display more than one element'.

	^ self
		applying:
			(SetComponentSizeCommand setting: aNumberOfElements)
				+ aCommandComponent asWebComponentCommand