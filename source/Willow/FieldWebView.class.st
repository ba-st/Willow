"
I 'm an abstract class representing non textual HTML5 inputs.
"
Class {
	#name : #FieldWebView,
	#superclass : #TextFieldWebView,
	#instVars : [
		'textCodec'
	],
	#category : #'Willow-WebViews'
}

{ #category : #'Container-API' }
FieldWebView >> changeModelTo: aModel [

	^ self changeContentsTo: (self textCodec encode: aModel)
]

{ #category : #initialization }
FieldWebView >> initializeTransformingWith: aTextCodec [

	textCodec := aTextCodec
]

{ #category : #'Container-API' }
FieldWebView >> model [

	^ self textCodec decode: self contents
]

{ #category : #'private - Accessing' }
FieldWebView >> textCodec [

	^ textCodec
]
