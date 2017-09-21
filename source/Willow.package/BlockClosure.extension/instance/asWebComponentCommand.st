*Willow
asWebComponentCommand

	^ self argumentCount = 0
		ifTrue: [ CompositeComponentCommand empty ]
		ifFalse: [ self cull: WebComponentCommandBuilder new ]