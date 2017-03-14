configuring
evaluate: aCallbackBlock with: aParameter

	self interpretersDo: [:interpreter | interpreter evaluate: aCallbackBlock with: aParameter]