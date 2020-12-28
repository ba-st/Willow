"
I represent a TextField containing numbers.
"
Class {
	#name : #NumberFieldWebView,
	#superclass : #FieldWebView,
	#instVars : [
		'textCodec'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
NumberFieldWebView class >> applying: aComponentCommand transformingWith: aTextCodec [

	^ ( self
		forComponentBuiltUsing: [ :canvas | canvas textInput ]
		withInteractionDefinedBy: self changeInterpreter
		applying: [ :field | field beNumberInput + aComponentCommand ] asWebComponentCommand )
		initializeTransformingWith: aTextCodec
]

{ #category : #'number-container-API' }
NumberFieldWebView >> changeNumberTo: aNumber [

	self changeModelTo: aNumber
]

{ #category : #'private - Accessing' }
NumberFieldWebView >> identifierPrefix [

	^ 'number-field'
]

{ #category : #initialization }
NumberFieldWebView >> initializeTransformingWith: aTextCodec [

	textCodec := aTextCodec
]

{ #category : #'number-container-API' }
NumberFieldWebView >> number [

	^ self model
]

{ #category : #'private - Accessing' }
NumberFieldWebView >> textCodec [

	^ textCodec
]
