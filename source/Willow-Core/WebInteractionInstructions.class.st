Class {
	#name : #WebInteractionInstructions,
	#superclass : #Object,
	#instVars : [
		'instructions'
	],
	#classVars : [
		'Empty'
	],
	#pools : [
		'Willow'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'private - instance creation' }
WebInteractionInstructions class >> containingAll: aCollection [

	^ self new initializeContainingAll: aCollection
]

{ #category : #'instance creation' }
WebInteractionInstructions class >> directingTo: aBlock [

	^ self containingAll: ( Array with: aBlock )
]

{ #category : #'instance creation' }
WebInteractionInstructions class >> empty [

	^ Empty
]

{ #category : #'class initialization' }
WebInteractionInstructions class >> initialize [

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
WebInteractionInstructions >> initializeContainingAll: aCollection [

	instructions := aCollection
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

	^ ( instructions collect: [ :instruction | Array with: ( instruction cull: aCanvas ) ] ) flattened
]
