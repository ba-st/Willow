"
I'm a WebInteractionCommand that displays a Loading... notification while an AJAX call is beign executed.
"
Class {
	#name : #LoadingNotificationCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'serverIndependentInstructions',
		'modelLoadingInstructions'
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
LoadingNotificationCommand class >> executing: aServerIndependentInstruction then: aModelLoadingInstruction [

	^ self new
		initializeExecuting: aServerIndependentInstruction
		then: aModelLoadingInstruction
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
LoadingNotificationCommand >> initializeExecuting: aServerIndependentInstruction then: aModelLoadingInstruction [

	serverIndependentInstructions := WebInteractionInstructions
		directingTo: aServerIndependentInstruction.
	modelLoadingInstructions := WebInteractionInstructions directingTo: aModelLoadingInstruction
]

{ #category : #accessing }
LoadingNotificationCommand >> modelLoadingInstructions [

	^ modelLoadingInstructions
]

{ #category : #accessing }
LoadingNotificationCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
LoadingNotificationCommand >> requiresSerialization [

	^ false
]

{ #category : #accessing }
LoadingNotificationCommand >> serverIndependentInstructions [

	^ serverIndependentInstructions
]
