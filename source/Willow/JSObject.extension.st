Extension { #name : #JSObject }

{ #category : #'*Willow' }
JSObject >> constants [
	
	"This method is intended to be private."
	^ Willow constants
]

{ #category : #'*Willow' }
JSObject >> willow [

	^ (WillowJavascriptNamespace context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]
