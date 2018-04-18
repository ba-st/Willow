"
Command to set the title attribute of a component (using title:).
"
Class {
	#name : #ComponentTitleCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'titleProvider'
	],
	#category : 'Willow-Frontend'
}

{ #category : #'instance creation' }
ComponentTitleCommand class >> toSet: aTitle [

	^ self toSetUsing: [ aTitle ]
]

{ #category : #'instance creation' }
ComponentTitleCommand class >> toSetUsing: aTitleProvider [

	^ self new initializeToSetUsing: aTitleProvider
]

{ #category : #processing }
ComponentTitleCommand >> applyTo: aComponent on: aCanvas [

	^ aComponent title: titleProvider value
]

{ #category : #'initialize-release' }
ComponentTitleCommand >> initializeToSetUsing: aTitleProvider [

	titleProvider := aTitleProvider
]
