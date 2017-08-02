tests-accessing
testServerIndependentActions

	self
		assertCollection: command serverIndependentActions
		equals: (Array with: commandAction)