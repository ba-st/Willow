"
I represent a TextField containing dates.
"
Class {
	#name : #DateFieldWebView,
	#superclass : #FieldWebView,
	#instVars : [
		'textCodec'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
DateFieldWebView class >> applying: aComponentCommand [

	^ self applying: aComponentCommand transformingWith: ISODateCodec new
]

{ #category : #'instance creation' }
DateFieldWebView class >> applying: aComponentCommand transformingWith: aTextCodec [

	^ (self forComponentBuiltUsing: [ :canvas | canvas textInput ] withInteractionDefinedBy: self changeInterpreter applying: [ :field | field beDateInput + aComponentCommand ] asWebComponentCommand)
		initializeTransformingWith: aTextCodec
]

{ #category : #'Date-Container-API' }
DateFieldWebView >> changeDateTo: aDate [

	self changeModelTo: aDate
]

{ #category : #'Date-Container-API' }
DateFieldWebView >> date [

	^ self model
]

{ #category : #'private - Accessing' }
DateFieldWebView >> identifierPrefix [

	^ 'date-field'
]

{ #category : #initialization }
DateFieldWebView >> initializeTransformingWith: aTextCodec [

	textCodec := aTextCodec
]

{ #category : #'private - Accessing' }
DateFieldWebView >> textCodec [

	^ textCodec
]
