Extension { #name : #JSStream }

{ #category : #'*Willow-Core' }
JSStream >> << aJavascriptElement [

	self javascript: aJavascriptElement.
	^ aJavascriptElement
]
