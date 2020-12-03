"
I'm an abstract subclass for component builders
"
Class {
	#name : #WillowComponentBuilder,
	#superclass : #GRObject,
	#pools : [
		'Willow'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #building }
WillowComponentBuilder >> build [

	^ self buildApplying: [ :component |  ]
]

{ #category : #building }
WillowComponentBuilder >> buildApplying: aComponentCommand [

	^ self subclassResponsibility
]
