Extension { #name : #WAApplicationInDevelopment }

{ #category : #'*Willow-Core-Development-Support' }
WAApplicationInDevelopment >> configureErrorHandlerTo: aWAApplication using: aWillowApplication [ 
"cosa"
	aWillowApplication configureErrorHandlerInDevelopmentModeTo: aWAApplication
]
