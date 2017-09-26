*Willow
asWebComponentCommand

	^ (self cull: WebComponentCommandBuilder new cull: WillowConstantsProvider new) ifNil: [ CompositeComponentCommand empty ]