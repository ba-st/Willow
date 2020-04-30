Extension { #name : #JSObject }

{ #category : #'*Willow-Core' }
JSObject >> constants [
	
	"This method is intended to be private."
	^ Willow constants
]

{ #category : #'*Willow-Core' }
JSObject >> willow [

	^ (WillowJavascriptNamespace context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]
