tests
testRegisterAsDeployedApplication

	| handlers |

	handlers := WAAdmin defaultDispatcher handlers.
	self deny: (handlers includesKey: WillowTestingApplication handlerName).
	WillowTestingApplication registerAsDeployedApplication.
	self assert: (handlers includesKey: WillowTestingApplication handlerName).
	WillowTestingApplication unregisterFromApplications.
	self deny: (handlers includesKey: WillowTestingApplication handlerName)