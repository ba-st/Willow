"
I'm a WebInteractionCommand that displays a Loading... notification while an AJAX call is beign executed.
"
Class {
	#name : #LoadingNotificationCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'asynchronousCallCustomization'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
LoadingNotificationCommand class >> displaying: aWebView applying: aComponentCommand [

	^ self
		executing: ( self instructionToDisplay: aWebView applying: aComponentCommand )
		then: self instructionToCleanNotificationSection
]

{ #category : #'private - instance creation' }
LoadingNotificationCommand class >> executing: aPreviousAction then: aFinalizationAction [

	^ self new initializeExecuting: aPreviousAction then: aFinalizationAction
]

{ #category : #'private - accessing' }
LoadingNotificationCommand class >> instructionToCleanNotificationSection [

	^ [ :aCanvas | ( self notificationSectionOn: aCanvas ) html: [ :aSubCanvas |  ] ]
]

{ #category : #'private - accessing' }
LoadingNotificationCommand class >> instructionToDisplay: aWebView applying: aComponentCommand [

	^ [ :aCanvas | 
	( self notificationSectionOn: aCanvas )
		html: [ :aSubCanvas | 
			aSubCanvas
				render:
					( ContainerWebView
						wrapping: aWebView
						intoElementBuiltUsing: [ :theCanvas | theCanvas div ]
						applying: aComponentCommand )
			]
	]
]

{ #category : #'private - accessing' }
LoadingNotificationCommand class >> notificationSectionOn: aCanvas [

	^ aCanvas jQuery id: Constants >> #willow >> #notificationSectionName
]

{ #category : #'instance creation' }
LoadingNotificationCommand class >> onPageTopWithClasses: aCssClassCollection [

	^ self
		displaying: 'Loading...'
		applying: ( ComponentClassificationCommand toStyleWithAll: aCssClassCollection )
]

{ #category : #initialization }
LoadingNotificationCommand >> initializeExecuting: aPreviousAction then: aFinalizationAction [

	asynchronousCallCustomization := [ :ajax :canvas | 
	ajax addDecoration: ( JSConcatenateBefore on: ( aPreviousAction value: canvas ) ).
	ajax onComplete: ( aFinalizationAction value: canvas )
	]
]

{ #category : #accessing }
LoadingNotificationCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions empty
]

{ #category : #accessing }
LoadingNotificationCommand >> priorityActions [

	^ Array with: asynchronousCallCustomization
]

{ #category : #testing }
LoadingNotificationCommand >> requiresSerialization [

	^ false
]

{ #category : #accessing }
LoadingNotificationCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
