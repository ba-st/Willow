Extension { #name : #WAApplicationDeployed }

{ #category : #'*Willow-Core' }
WAApplicationDeployed >> configureErrorHandlerTo: aWAApplication using: aWillowApplication [

	aWillowApplication configureErrorHandlerInDeployedModeTo: aWAApplication
]
