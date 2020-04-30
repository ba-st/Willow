"
A command to assign a hint for a component, using the placeholder attribute.
"
Class {
	#name : #ComponentPlaceholderCommand,
	#superclass : #WebComponentCommand,
	#instVars : [
		'suggestion'
	],
	#category : #'Willow-Core-Frontend'
}

{ #category : #'Instance Creation' }
ComponentPlaceholderCommand class >> suggestedBy: aSuggestion [

	^self new initializeSuggestedBy: aSuggestion
]

{ #category : #processing }
ComponentPlaceholderCommand >> applyTo: aComponent on: aCanvas [

	aComponent placeholder: suggestion
]

{ #category : #initialization }
ComponentPlaceholderCommand >> initializeSuggestedBy: aSuggestion [

	suggestion := aSuggestion
]
