"
I'm a WebInteractionCommand used to change the value of some input field. I can be configured to trigger a change event.
"
Class {
	#name : #ComponentValueSettingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'valueProvider',
		'identifierProvider',
		'triggeringAction'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
ComponentValueSettingCommand class >> obtainingIdentifierFrom: anIdentifierProvider valueFrom: aValueProvider [

	^ self
		obtainingIdentifierFrom: aValueProvider
		valueFrom: anIdentifierProvider
		triggeringAction: [ :jQueryInstance | jQueryInstance ]
]

{ #category : #private }
ComponentValueSettingCommand class >> obtainingIdentifierFrom: aValueProvider valueFrom: anIdentifierProvider triggeringAction: aTriggeringAction [

	^ self new initializeObtainingIdentifierFrom: anIdentifierProvider valueFrom: aValueProvider triggeringAction: aTriggeringAction
]

{ #category : #'instance creation' }
ComponentValueSettingCommand class >> triggeringChangesObtainingIdentifierFrom: anIdentifierProvider valueFrom: aValueProvider [

	^ self
		obtainingIdentifierFrom: aValueProvider
		valueFrom: anIdentifierProvider
		triggeringAction: [ :jQueryInstance | jQueryInstance trigger: 'change' ]
]

{ #category : #'instance creation' }
ComponentValueSettingCommand class >> triggeringChangesOn: anIdentifiableView withValueFrom: aValueProvider [

	^ self
		triggeringChangesObtainingIdentifierFrom: [ :canvas | 
			anIdentifiableView identifyIn: canvas.
			anIdentifiableView identifier
			]
		valueFrom: aValueProvider
]

{ #category : #'initialize-release' }
ComponentValueSettingCommand >> initializeObtainingIdentifierFrom: anIdentifierProvider valueFrom: aValueProvider triggeringAction: anAction [

	identifierProvider := anIdentifierProvider.
	valueProvider := aValueProvider.
	triggeringAction := anAction
]

{ #category : #accessing }
ComponentValueSettingCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | 
			| jQueryInstance |

			jQueryInstance := aCanvas jQuery id: ( identifierProvider cull: aCanvas ).
			jQueryInstance value: valueProvider value.
			triggeringAction cull: jQueryInstance
			]
]

{ #category : #accessing }
ComponentValueSettingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
ComponentValueSettingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ComponentValueSettingCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
