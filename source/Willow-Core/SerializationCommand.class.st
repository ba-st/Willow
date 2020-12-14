"
I'm a WebInteractionCommand that specifies how to serialize the component state.
"
Class {
	#name : #SerializationCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'priorityActions',
		'coverage'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'private - instance creation' }
SerializationCommand class >> executing: aPriorityAction covering: aListOfSelectors [

	^ self new initializeExecuting: aPriorityAction covering: aListOfSelectors
]

{ #category : #'instance creation' }
SerializationCommand class >> forChildForm [

	^ self
		executing: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				bePost;
				serialize: ( aCanvas jQuery this children: 'form' )
			]
		covering: #(forChildForm)
]

{ #category : #'instance creation' }
SerializationCommand class >> forCurrentObject [

	^ self
		executing: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				bePost;
				serializeThis
			]
		covering: #(forCurrentObject)
]

{ #category : #'instance creation' }
SerializationCommand class >> forCurrentObjectWithHiddenInputs [

	^ self
		executing: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				bePost;
				serializeThisWithHidden
			]
		covering: #(forCurrentObject forCurrentObjectWithHiddenInputs)
]

{ #category : #'instance creation' }
SerializationCommand class >> forForm: anIdentifiedForm [

	^ self
		executing: [ :anAsynchronousCall :aCanvas | 
			anIdentifiedForm identifyIn: aCanvas.
			anAsynchronousCall
				bePost;
				serialize: ( aCanvas jQuery id: anIdentifiedForm identifier )
			]
		covering: #()
]

{ #category : #'instance creation' }
SerializationCommand class >> forParentForm [

	^ self
		executing: [ :anAsynchronousCall :aCanvas | 
			anAsynchronousCall
				bePost;
				serializeForm
			]
		covering: #(forParentForm)
]

{ #category : #initialization }
SerializationCommand >> initializeExecuting: aPriorityAction covering: aListOfSelectors [

	priorityActions := Array with: aPriorityAction.
	coverage := aListOfSelectors
]

{ #category : #accessing }
SerializationCommand >> modelLoadingInstructions [

	^ WebInteractionInstructions empty
]

{ #category : #accessing }
SerializationCommand >> priorityActions [

	^ priorityActions
]

{ #category : #testing }
SerializationCommand >> requiresSerialization [

	^ false
]

{ #category : #accessing }
SerializationCommand >> serializationCoverage [

	^ coverage
]

{ #category : #accessing }
SerializationCommand >> serverIndependentInstructions [

	^ WebInteractionInstructions empty
]
