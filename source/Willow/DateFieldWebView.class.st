"
I represent a TextField containing dates.
"
Class {
	#name : #DateFieldWebView,
	#superclass : #FieldWebView,
	#instVars : [
		'textField',
		'textCodec'
	],
	#category : 'Willow-WebViews'
}

{ #category : #'instance creation' }
DateFieldWebView class >> applying: aComponentCommand [

	^ self applying: aComponentCommand transformingWith: ISODateCodec new
]

{ #category : #'instance creation' }
DateFieldWebView class >> applying: aComponentCommand transformingWith: aTextCodec [

	^ self new initializeApplying: [ :field | field beDateInput + aComponentCommand ] asWebComponentCommand transformingWith: aTextCodec
]

{ #category : #'Date-Container-API' }
DateFieldWebView >> changeDateTo: aDate [

	self changeModelTo: aDate
]

{ #category : #'Date-Container-API' }
DateFieldWebView >> date [

	^ self model
]

{ #category : #initialization }
DateFieldWebView >> initializeApplying: aComponentCommand transformingWith: aTextCodec [

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: aComponentCommand.
	textCodec := aTextCodec
]

{ #category : #'private - Accessing' }
DateFieldWebView >> textCodec [

	^ textCodec
]

{ #category : #'private - Accessing' }
DateFieldWebView >> textField [

	^ textField
]
