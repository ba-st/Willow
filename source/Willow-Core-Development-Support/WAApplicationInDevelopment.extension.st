Extension { #name : #WAApplicationInDevelopment }

{ #category : #'*Willow-Core-Development-Support' }
WAApplicationInDevelopment >> configureErrorHandlerTo: aWAApplication using: aWillowApplication [ 
"nuevo"
	aWillowApplication configureErrorHandlerInDevelopmentModeTo: aWAApplication
]
