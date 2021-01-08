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
		executing: [ :aCanvas | 
			( aCanvas jQuery id: Constants >> #willow >> #notificationSectionName )
				html: [ :aSubCanvas | 
					aSubCanvas
						render:
							( ContainerWebView
								wrapping: aWebView
								intoElementBuiltUsing: [ :theCanvas | theCanvas div ]
								applying: aComponentCommand )
					]
			]
		then:
			[ :aCanvas | ( aCanvas jQuery id: Constants >> #willow >> #notificationSectionName ) html: [ :aSubCanvas |  ] ]
]

{ #category : #'private - instance creation' }
LoadingNotificationCommand class >> executing: aServerIndependentInstruction then: aModelLoadingInstruction [

	^ self new
		initializeExecuting: aServerIndependentInstruction
		then: aModelLoadingInstruction
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
