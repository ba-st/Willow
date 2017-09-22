*Willow
asWebComponentCommand

	^ (self cull: WebComponentCommandBuilder new) ifNil: [ CompositeComponentCommand empty ]