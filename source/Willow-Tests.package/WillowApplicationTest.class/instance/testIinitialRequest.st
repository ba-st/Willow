tests
testIinitialRequest

	applicationStarted := false.
	self
		renderUsing: [ :canvas | 
			WillowApplication new initialRequest: 'Not relevant'.
			self assert: applicationStarted ]