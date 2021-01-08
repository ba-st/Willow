"
I'm a WebInteractionCommand allowing to enable or disable a component. 
I just generate javascript code for the client, no server communication or processing is involved.
"
Class {
	#name : #ComponentEnableStatusChangingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'componentProvider',
		'desiredStatus'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'Instance Creation' }
ComponentEnableStatusChangingCommand class >> disabling: anIdentifiedComponent [

	^ self
		obtainingComponentWith: [ :canvas | canvas jQuery id: ( anIdentifiedComponent identifierOn: canvas ) ]
		settingStatusTo: true
]

{ #category : #'Instance Creation' }
ComponentEnableStatusChangingCommand class >> disablingCurrentComponent [

	^self obtainingComponentWith: [:canvas | canvas jQuery this] settingStatusTo: true
]

{ #category : #'Instance Creation' }
ComponentEnableStatusChangingCommand class >> enabling: anIdentifiedComponent [

	^ self
		obtainingComponentWith: [ :canvas | canvas jQuery id: ( anIdentifiedComponent identifierOn: canvas ) ]
		settingStatusTo: false
]

{ #category : #private }
ComponentEnableStatusChangingCommand class >> obtainingComponentWith: aComponentProvider settingStatusTo: aBoolean [

	^self new initializeObtainingComponentWith: aComponentProvider settingStatusTo: aBoolean
]

{ #category : #initialization }
ComponentEnableStatusChangingCommand >> initializeObtainingComponentWith: aComponentProvider settingStatusTo: aBoolean [

	componentProvider := aComponentProvider.
	desiredStatus := aBoolean
]

{ #category : #accessing }
ComponentEnableStatusChangingCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions empty
]

{ #category : #accessing }
ComponentEnableStatusChangingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
ComponentEnableStatusChangingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ComponentEnableStatusChangingCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions
		directingTo: [ :aCanvas | 
			( componentProvider value: aCanvas )
				propertyAt: Constants >> #willow >> #disabledAttributeName
				put: desiredStatus
			]
]
