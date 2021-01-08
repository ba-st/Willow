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
	#category : #'Willow-Core-WebViews'
}

{ #category : #'Instance Creation' }
SynchronicSubmitButtonWebView class >> labeled: aLabel applying: aComponentCommand evaluating: actionOnSubmit [

	^ self new
		initializeLabeled: aLabel
		applying: aComponentCommand asWebComponentCommand
		evaluating: actionOnSubmit
]

{ #category : #accessing }
SynchronicSubmitButtonWebView >> identifierOn: aCanvas [

	^ identifierAssigner identifierOn: aCanvas
]

{ #category : #initialization }
SynchronicSubmitButtonWebView >> initializeLabeled: aLabel applying: aCommandCollection evaluating: actionOnSubmit [

	label := aLabel.
	commandToComponent := aCommandCollection.
	interactionInterpreter := EventInterpreterDispatcher defaultingToClick.
	submitCallback := actionOnSubmit.
	identifierAssigner := IdentifierAssigner prefixedBy: 'submit-button'
]

{ #category : #configuring }
SynchronicSubmitButtonWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
SynchronicSubmitButtonWebView >> renderContentOn: aCanvas [

	| submitButton |

	submitButton := aCanvas button.
	submitButton
		callback: submitCallback;
		value: label;
		beIdentifiableUsing: identifierAssigner;
		interactUsing: interactionInterpreter;
		apply: commandToComponent
]
