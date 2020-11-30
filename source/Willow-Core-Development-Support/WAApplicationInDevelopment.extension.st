Extension { #name : #WAApplicationInDevelopment }

{ #category : #'*Willow-Core-Development-Support' }
WAApplicationInDevelopment >> configureErrorHandlerTo: aWAApplication using: aWillowApplication [ 
"testing line ending"
	aWillowApplication configureErrorHandlerInDevelopmentModeTo: aWAApplication
]
