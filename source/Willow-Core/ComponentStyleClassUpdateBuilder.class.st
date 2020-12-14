Class {
	#name : #ComponentStyleClassUpdateBuilder,
	#superclass : #Object,
	#instVars : [
		'transformations'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #configuring }
ComponentStyleClassUpdateBuilder >> addClass: aCssClass [

	transformations add: [ :element | element addClass: aCssClass ]
]

{ #category : #processing }
ComponentStyleClassUpdateBuilder >> applyTo: aJQueryInstance [

	^ transformations
		inject: aJQueryInstance
		into: [ :result :transformation | transformation value: result ]
]

{ #category : #initialization }
ComponentStyleClassUpdateBuilder >> initialize [

	super initialize.
	transformations := OrderedCollection new
]

{ #category : #configuring }
ComponentStyleClassUpdateBuilder >> removeClass: aCssClass [

	transformations add: [ :element | element removeClass: aCssClass ]
]

{ #category : #configuring }
ComponentStyleClassUpdateBuilder >> toggleClass: aCssClass [

	transformations add: [ :element | element toggleClass: aCssClass ]
]
