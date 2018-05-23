Extension { #name : #JSObject }

{ #category : #'*Willow' }
JSObject >> constants [

	^ Willow constants
]

{ #category : #'*Willow' }
JSObject >> willow [

	^ (WillowJavascriptNamespace context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]
