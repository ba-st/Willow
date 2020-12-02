"
I'm a WebInteractionCommand used to show an alert, useful for low level debugging purposes.
"
Class {
	#name : #AlertingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'messageProvider'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
AlertingCommand class >> informingSelection [

	^ self
		obtainingMessageFrom: [ :aCanvas | ( aCanvas jQuery this children: 'option:selected' ) call: 'text' ]
]

{ #category : #'instance creation' }
AlertingCommand class >> obtainingMessageFrom: aMessageProvider [

	^ self new initializeObtainingMessageFrom: aMessageProvider
]

{ #category : #'instance creation' }
AlertingCommand class >> stating: aText [

	^ self obtainingMessageFrom: [ :aCanvas | aText ]
]

{ #category : #initialization }
AlertingCommand >> initializeObtainingMessageFrom: aMessageProvider [

	messageProvider := aMessageProvider
]

{ #category : #accessing }
AlertingCommand >> modelLoadingActions [

	^ #()
]

{ #category : #accessing }
AlertingCommand >> priorityActions [

	^ #()
]

{ #category : #testing }
AlertingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
AlertingCommand >> serverIndependentActions [

	^ Array with: [ :aCanvas | aCanvas javascript alert: ( messageProvider value: aCanvas ) ]
]
