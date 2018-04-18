"
I'm an abstract subclass for component builders
"
Class {
	#name : #WillowComponentBuilder,
	#superclass : #GRObject,
	#category : 'Willow-WebViews'
}

{ #category : #building }
WillowComponentBuilder >> build [

	^ self buildApplying: [ :component |  ]
]

{ #category : #building }
WillowComponentBuilder >> buildApplying: aComponentCommand [

	^ self subclassResponsibility
]
