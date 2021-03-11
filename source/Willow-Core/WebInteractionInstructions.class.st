Class {
	#name : #WebInteractionInstructions,
	#superclass : #Object,
	#instVars : [
		'instructions'
	],
	#classVars : [
		'Empty'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'private - instance creation' }
WebInteractionInstructions class >> containingAll: anAssociationCollection [

	^ self new initializeContainingAll: anAssociationCollection
]

{ #category : #'instance creation' }
WebInteractionInstructions class >> directingTo: aBlock [

	^ self directingTo: aBlock orderedAt: 1
]

{ #category : #'instance creation' }
WebInteractionInstructions class >> directingTo: aBlock orderedAt: aPosition [

	^ self containingAll: ( Array with: aPosition -> aBlock )
]

{ #category : #'instance creation' }
WebInteractionInstructions class >> empty [

	^ Empty
]

{ #category : #'class initialization' }
WebInteractionInstructions class >> initialize [

	<ignoreForCoverage>
	Empty := self containingAll: #()
]

{ #category : #processing }
WebInteractionInstructions >> appendTo: aScript on: aCanvas [

	( self statementsOn: aCanvas ) do: [ :statement | aScript << statement ]
]

{ #category : #combining }
WebInteractionInstructions >> combinedWith: otherInstructions [

	self isEmpty
		ifTrue: [ ^ otherInstructions ].
	otherInstructions isEmpty
		ifTrue: [ ^ self ].
	^ self class
		containingAll:
			( OrderedCollection new
				addAll: self instructions;
				addAll: otherInstructions instructions;
				yourself )
]

{ #category : #initialization }
WebInteractionInstructions >> initializeContainingAll: anAssociationCollection [

	instructions := anAssociationCollection
]

{ #category : #'private - accessing' }
WebInteractionInstructions >> instructions [

	"Only to be used by #combinedWith:"

	^ instructions
]

{ #category : #testing }
WebInteractionInstructions >> isEmpty [

	^ instructions isEmpty
]

{ #category : #testing }
WebInteractionInstructions >> notEmpty [

	^ instructions notEmpty
]

{ #category : #accessing }
WebInteractionInstructions >> statementsOn: aCanvas [

	^ ( ( instructions sorted: [ :a :b | a key <= b key ] )
		collect: [ :instruction | Array with: ( instruction value cull: aCanvas ) ] ) flattened
]
