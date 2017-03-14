accessing
content

	^ checkboxView isChecked
		ifTrue: [ inputView content ]
		ifFalse: [ defaultModel ]