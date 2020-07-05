Extension { #name : #WAApplicationInDevelopment }

{ #category : #'*Willow-Core' }
WAApplicationInDevelopment >> configureErrorHandlerTo: aWAApplication using: aWillowApplication [ 

	aWillowApplication configureErrorHandlerInDevelopmentModeTo: aWAApplication
]
