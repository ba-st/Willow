"
I represent a TextField containing numbers.
"
Class {
	#name : #NumberFieldWebView,
	#superclass : #FieldWebView,
	#instVars : [
		'textField',
		'textCodec'
	],
	#category : #'Willow-WebViews'
}

{ #category : #'instance creation' }
NumberFieldWebView class >> applying: aComponentCommand transformingWith: aTextCodec [

	^ self new initializeApplying: [ :field | field beNumberInput + aComponentCommand ] asWebComponentCommand transformingWith: aTextCodec
]

{ #category : #'number-container-API' }
NumberFieldWebView >> changeNumberTo: aNumber [

	self changeModelTo: aNumber
]

{ #category : #initialization }
NumberFieldWebView >> initializeApplying: aComponentCommand transformingWith: aTextCodec [

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: aComponentCommand.
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

{ #category : #'private - Accessing' }
NumberFieldWebView >> textField [

	^ textField
]
