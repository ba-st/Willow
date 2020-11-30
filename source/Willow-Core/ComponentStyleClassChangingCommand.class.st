"
I'm a WebInteractionCommand allowing to change the css class of a component, which can be done using a specific transformation.
"
Class {
	#name : #ComponentStyleClassChangingCommand,
	#superclass : #WebInteractionCommand,
	#instVars : [
		'componentProvider',
		'styleToChange',
		'transformationMessage',
		'transformationProvider'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
ComponentStyleClassChangingCommand class >> on: aComponentProvider altering: aCssClass sending: aTransformationMessage [

	^ self
		on: aComponentProvider
		altering: aCssClass
		sending: aTransformationMessage
		using: [ :component | component ]
]

{ #category : #'instance creation' }
ComponentStyleClassChangingCommand class >> on: aComponentProvider altering: aCssClass sending: aTransformationMessage using: aTransformationAction [

	^self new
		initializeOn: aComponentProvider
		altering: aCssClass
		sending: aTransformationMessage
		using: aTransformationAction
]

{ #category : #private }
ComponentStyleClassChangingCommand >> applyStyleChangeTo: component [
	^ component perform: transformationMessage with: styleToChange
]

{ #category : #private }
ComponentStyleClassChangingCommand >> applyStyleChangeToComponentOn: aCanvas [
	^ self applyStyleChangeTo: (self componentOn: aCanvas)
]

{ #category : #accessing }
ComponentStyleClassChangingCommand >> clientIndependentActions [

	^#()
]

{ #category : #private }
ComponentStyleClassChangingCommand >> componentOn: aCanvas [
	^ componentProvider value: aCanvas
]

{ #category : #'initialize-release' }
ComponentStyleClassChangingCommand >> initializeOn: aComponentProvider altering: aCssStyle sending: aTransformationMessage using: aTransformationProvider [

	componentProvider := aComponentProvider.
	styleToChange := aCssStyle.
	transformationMessage := aTransformationMessage.
	transformationProvider := aTransformationProvider
]

{ #category : #accessing }
ComponentStyleClassChangingCommand >> modelLoadingActions [

	^#()
]

{ #category : #accessing }
ComponentStyleClassChangingCommand >> priorityActions [

	^#()
]

{ #category : #testing }
ComponentStyleClassChangingCommand >> requiresSerialization [

	^false
]

{ #category : #accessing }
ComponentStyleClassChangingCommand >> serverIndependentActions [
	^ Array with: [ :aScript :aCanvas | aScript << (transformationProvider value:(self applyStyleChangeToComponentOn: aCanvas)) ]
]
