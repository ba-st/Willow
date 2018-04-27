"
I'm an entry point providing access to several constants
"
Class {
	#name : #WillowConstantsProvider,
	#superclass : #GRObject,
	#category : #'Willow-Frontend'
}

{ #category : #Accessing }
WillowConstantsProvider >> css [

	^ CssConstants
]

{ #category : #Accessing }
WillowConstantsProvider >> cssFonts [

	^ CssFontConstants
]

{ #category : #Accessing }
WillowConstantsProvider >> cssMediaQuery [

	^ CssMediaQueryConstants
]

{ #category : #Accessing }
WillowConstantsProvider >> willow [

	^ WillowConstants
]
