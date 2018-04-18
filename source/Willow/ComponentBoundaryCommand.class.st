"
Command to add boundaries to a component (using min: and/or max:).
"
Class {
	#name : #ComponentBoundaryCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'minimumHolder',
		'maximumHolder'
	],
	#category : 'Willow-Frontend'
}

{ #category : #'instance creation' }
ComponentBoundaryCommand class >> between: aMinimum and: aMaximum [

	^ self
		restrictingMinimumWith: (Optional containing: aMinimum)
		maximumTo: (Optional containing: aMaximum)
]

{ #category : #'instance creation' }
ComponentBoundaryCommand class >> nonNegative [

	^ self restrictingMinimumWith: (Optional containing: 0) maximumTo: (Optional unusedBecause: 'Maximum not restricted')
]

{ #category : #'instance creation - private' }
ComponentBoundaryCommand class >> restrictingMinimumWith: aMinimumHolder maximumTo: aMaximumHolder [

	^ self new initializeRestrictingMinimumWith: aMinimumHolder maximumTo: aMaximumHolder
]

{ #category : #processing }
ComponentBoundaryCommand >> applyTo: aComponent on: aCanvas [

	minimumHolder withContentDo: [ :minimum | aComponent attributeAt: 'min' put: minimum ].
	maximumHolder withContentDo: [ :maximum | aComponent attributeAt: 'max' put: maximum ]
]

{ #category : #'initialize-release' }
ComponentBoundaryCommand >> initializeRestrictingMinimumWith: aMinimumHolder maximumTo: aMaximumHolder [

	minimumHolder := aMinimumHolder.
	maximumHolder := aMaximumHolder
]
