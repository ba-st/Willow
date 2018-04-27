"
I'm a submit button
"
Class {
	#name : #SynchronicSubmitButtonWebView,
	#superclass : #WAPainter,
	#instVars : [
		'label',
		'commandToComponent',
		'interactionInterpreter',
		'identifierAssigner',
		'submitCallback'
	],
	#category : #'Willow-WebViews'
}

{ #category : #'Instance Creation' }
SynchronicSubmitButtonWebView class >> labeled: aLabel applying: aComponentCommand evaluating: actionOnSubmit [

	^ self new
		initializeLabeled: aLabel
		applying: aComponentCommand asWebComponentCommand
		evaluating: actionOnSubmit
]

{ #category : #accessing }
SynchronicSubmitButtonWebView >> identifier [

	^ identifierAssigner assignedIdentifier
]

{ #category : #configuring }
SynchronicSubmitButtonWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas
]

{ #category : #initialization }
SynchronicSubmitButtonWebView >> initializeLabeled: aLabel applying: aCommandCollection evaluating: actionOnSubmit [

	label := aLabel.
	commandToComponent := aCommandCollection.
	interactionInterpreter := WebInteractionInterpreter forClickOnComponent.
	submitCallback := actionOnSubmit.
	identifierAssigner := IdentifierAssigner prefixedBy: 'submit-button'
]

{ #category : #configuring }
SynchronicSubmitButtonWebView >> onTrigger [

	^interactionInterpreter
]

{ #category : #rendering }
SynchronicSubmitButtonWebView >> renderContentOn: aCanvas [

	| submitButton |

	submitButton := aCanvas button.

	identifierAssigner withAssignedIdentifierDo: [ :id | submitButton id: id ].
	submitButton
		callback: submitCallback;
		value: label.

	interactionInterpreter applyTo: submitButton on: aCanvas.
	commandToComponent applyTo: submitButton on: aCanvas
]
