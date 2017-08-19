tests
testRegisterAsDevelopmentApplication

	| handlers |

	handlers := WAAdmin defaultDispatcher handlers.
	self deny: (handlers includesKey: WillowTestingApplication handlerName).
	WillowTestingApplication registerAsDevelopmentApplication.
	self assert: (handlers includesKey: WillowTestingApplication handlerName).
	WillowTestingApplication unregisterFromApplications.
	self deny: (handlers includesKey: WillowTestingApplication handlerName)