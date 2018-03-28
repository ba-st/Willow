tests
testDeploymentMode

	self
		renderUsing:
			[ :canvas | self assert: (WillowApplication new deploymentMode isA: WAApplicationInDevelopment) ]