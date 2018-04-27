"
I 'm an abstract class representing non textual HTML5 inputs.
"
Class {
	#name : #FieldWebView,
	#superclass : #WAPainter,
	#category : #'Willow-WebViews'
}

{ #category : #'Container-API' }
FieldWebView >> changeModelTo: aModel [

	^ self textField changeContentsTo: (self textCodec encode: aModel)
]

{ #category : #configuring }
FieldWebView >> identifyIn: aCanvas [

	^ self textField identifyIn: aCanvas
]

{ #category : #'Container-API' }
FieldWebView >> model [

	^ self textCodec decode: self textField contents
]

{ #category : #'Container-API' }
FieldWebView >> notifyChangesTo: aSupervisor [

	^ self textField notifyChangesTo: aSupervisor
]

{ #category : #configuring }
FieldWebView >> onTrigger [

	^ self textField onTrigger
]

{ #category : #rendering }
FieldWebView >> renderContentOn: aCanvas [

	aCanvas render: self textField
]

{ #category : #'private - Accessing' }
FieldWebView >> textCodec [

	^ self subclassResponsibility
]

{ #category : #'private - Accessing' }
FieldWebView >> textField [

	^ self subclassResponsibility
]
