"
I represent a TextField containing numbers.
"
Class {
	#name : #NumberFieldWebView,
	#superclass : #FieldWebView,
	#category : #'Willow-WebViews'
}

{ #category : #'instance creation' }
NumberFieldWebView class >> applying: aComponentCommand transformingWith: aTextCodec [

	^ (self singleLineTriggeringOnChangeApplying: [ :field | field beNumberInput + aComponentCommand ] asWebComponentCommand) initializeTransformingWith: aTextCodec
]

{ #category : #'number-container-API' }
NumberFieldWebView >> changeNumberTo: aNumber [

	self changeModelTo: aNumber
]

{ #category : #'number-container-API' }
NumberFieldWebView >> number [

	^ self model
]
