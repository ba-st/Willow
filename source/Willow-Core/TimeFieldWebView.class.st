"
I represent a TextField containing times.
"
Class {
	#name : #TimeFieldWebView,
	#superclass : #FieldWebView,
	#instVars : [
		'textCodec'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
TimeFieldWebView class >> applying: aComponentCommand [

	^ self applying: aComponentCommand transformingWith: ISOTimeCodec new
]

{ #category : #'instance creation' }
TimeFieldWebView class >> applying: aComponentCommand transformingWith: aTextCodec [

	^ ( self
		forComponentBuiltUsing: [ :canvas | canvas textInput ]
		withInteractionDefinedBy: self changeInterpreter
		applying: [ :field | field beTimeInput + aComponentCommand ] asWebComponentCommand )
		initializeTransformingWith: aTextCodec
]

{ #category : #'Time-Container-API' }
TimeFieldWebView >> changeTimeTo: aTime [

	self changeModelTo: aTime
]

{ #category : #'private - Accessing' }
TimeFieldWebView >> identifierPrefix [

	^ 'time-field'
]

{ #category : #'private - Accessing' }
TimeFieldWebView >> initializeTransformingWith: aTextCodec [

	textCodec := aTextCodec
]

{ #category : #'private - Accessing' }
TimeFieldWebView >> textCodec [

	^ textCodec
]

{ #category : #'Time-Container-API' }
TimeFieldWebView >> time [

	^ self model
]
