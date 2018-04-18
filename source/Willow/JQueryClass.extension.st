Extension { #name : #JQueryClass }

{ #category : #'*Willow' }
JQueryClass >> cssSelector: aCssSelector [

	^ self expression: aCssSelector greaseString
]
