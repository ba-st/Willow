"
I represent a TextField containing dates.
"
Class {
	#name : #DateFieldWebView,
	#superclass : #FieldWebView,
	#category : #'Willow-WebViews'
}

{ #category : #'instance creation' }
DateFieldWebView class >> applying: aComponentCommand [

	^ self applying: aComponentCommand transformingWith: ISODateCodec new
]

{ #category : #'instance creation' }
DateFieldWebView class >> applying: aComponentCommand transformingWith: aTextCodec [

	^ (self singleLineTriggeringOnChangeApplying: [ :field | aComponentCommand ] asWebComponentCommand) 
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
