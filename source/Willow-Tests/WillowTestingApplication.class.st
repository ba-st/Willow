"
I'm a test support class
"
Class {
	#name : #WillowTestingApplication,
	#superclass : #WillowApplication,
	#instVars : [
		'componentSupplier'
	],
	#category : #'Willow-Tests-Applications'
}

{ #category : #accessing }
WillowTestingApplication class >> applicationTitle [

	^ 'The official testing app'
]

{ #category : #accessing }
WillowTestingApplication class >> handlerName [

	^ 'testing-app'
]

{ #category : #'instance creation' }
WillowTestingApplication class >> new [

	^ self using: Html5ComponentSupplier new
]

{ #category : #'instance creation' }
WillowTestingApplication class >> using: aComponentSupplier [

	^ super new initializeUsing: aComponentSupplier 
]

{ #category : #accessing }
WillowTestingApplication >> componentSupplierForApplication [

	^ componentSupplier 
]

{ #category : #accessing }
WillowTestingApplication >> contentView [

	^ PhrasingContainerWebView obtainingContentFrom: [ self componentSupplier dropdownListApplying: [  ] ]
]

{ #category : #initialization }
WillowTestingApplication >> initializeUsing: aComponentSupplier [

	componentSupplier := aComponentSupplier
]

{ #category : #accessing }
WillowTestingApplication >> jQueryLibrary [

	^ JQuery3OnlineLibrary default
]

{ #category : #accessing }
WillowTestingApplication >> language [

	^ [ super language ]
		on: WARequestContextNotFound
		do: [ :ex | ex return: (WALocale fromString: 'en') ]
]
