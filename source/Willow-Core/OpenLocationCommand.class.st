"
Command to configure an anchor to open a destination into a blank page
"
Class {
	#name : #OpenLocationCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'destination',
		'targetOptional'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'instance creation' }
OpenLocationCommand class >> forNewBrowsingContextNavigatingTo: aLocation [

	^ self navigatingTo: aLocation targetingAccordingTo: (Optional containing: '_blank')
]

{ #category : #'instance creation' }
OpenLocationCommand class >> forSameBrowsingContextNavigatingTo: aLocation [

	^ self navigatingTo: aLocation targetingAccordingTo: Optional unused
]

{ #category : #'private - instance creation' }
OpenLocationCommand class >> navigatingTo: aLocation targetingAccordingTo: aTargetOptional [

	^ self new initializeNavigatingTo: aLocation targetingAccordingTo: aTargetOptional
]

{ #category : #processing }
OpenLocationCommand >> applyTo: anAnchorComponent on: aCanvas [

	anAnchorComponent url: destination.
	targetOptional
		withContentDo: [ :target | 
			anAnchorComponent
				target: target;
				relationship: 'noopener noreferrer' ]
]

{ #category : #initialization }
OpenLocationCommand >> initializeNavigatingTo: aLocation targetingAccordingTo: aTargetOptional [

	destination := aLocation.
	targetOptional := aTargetOptional
]
