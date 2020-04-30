Extension { #name : #JQueryClass }

{ #category : #'*Willow-Core' }
JQueryClass >> cssSelector: aCssSelector [

	^ self expression: aCssSelector greaseString
]
