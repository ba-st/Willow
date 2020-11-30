Extension { #name : #WillowApplication }

{ #category : #'*Willow-Core-Development-Support' }
WillowApplication class >> configureErrorHandlerInDevelopmentModeTo: aWAApplication [ 

	aWAApplication filter configuration at: #exceptionHandler put: WADebugErrorHandler
]
