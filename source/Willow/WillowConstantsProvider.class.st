"
I'm an entry point providing access to several constants
"
Class {
	#name : #WillowConstantsProvider,
	#superclass : #GRObject,
	#pools : [
		'RenoirSt'
	],
	#category : #'Willow-Frontend'
}

{ #category : #Accessing }
WillowConstantsProvider >> css [

	^ CssConstants
]

{ #category : #Accessing }
WillowConstantsProvider >> cssFonts [

	self deprecated: 'Use css'.
	^ self css
]

{ #category : #Accessing }
WillowConstantsProvider >> willow [

	^ WillowConstants
]
