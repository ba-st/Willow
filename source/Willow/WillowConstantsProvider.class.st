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
