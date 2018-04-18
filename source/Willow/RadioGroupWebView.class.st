"
I'm a group of radio buttons allowing the user to select one of many options.
"
Class {
	#name : #RadioGroupWebView,
	#superclass : #SingleSelectionWebViewBehavior,
	#instVars : [
		'interactionInterpreter',
		'renderingBlock',
		'labelCommand',
		'inputCommand'
	],
	#category : 'Willow-WebViews'
}

{ #category : #'Instance creation' }
RadioGroupWebView class >> new [

	^self 
		renderingWith: #'yourself'
		applyingToLabel: [:group | ]
		applyingToInput: []
]

{ #category : #'Instance creation' }
RadioGroupWebView class >> renderingWith: aRenderingBlock applyingToLabel: aLabelCommand applyingToInput: anInputCommand [

	^super new
		initializeRenderingWith: aRenderingBlock
		applyingToLabel: aLabelCommand asWebComponentCommand
		applyingToInput: anInputCommand asWebComponentCommand
]

{ #category : #initialization }
RadioGroupWebView >> initializeRenderingWith: aRenderingBlock
	applyingToLabel: aLabelCommand
	applyingToInput: anInputCommand [

	labelCommand := aLabelCommand.
	inputCommand := anInputCommand.
	interactionInterpreter := WebInteractionInterpreter forChangeInComponentValue.
	renderingBlock := aRenderingBlock
]

{ #category : #configuring }
RadioGroupWebView >> onTrigger [

	^ interactionInterpreter
]

{ #category : #rendering }
RadioGroupWebView >> renderContentOn: aCanvas [

	aCanvas radioGroup
		callback: [ :element | self choose: element ];
		with: [ :radioGroup | 
			chosenElementOptional withContentDo: [ :chosenElement | radioGroup selected: chosenElement ].
			availableElements do: [ :element | self renderRadioButtonFor: element asPartOf: radioGroup on: aCanvas ] ]
]

{ #category : #'private-rendering' }
RadioGroupWebView >> renderLabelContentFor: anElement on: aCanvas [

	aCanvas render: (renderingBlock value: anElement)
]

{ #category : #'private-rendering' }
RadioGroupWebView >> renderLabelFor: radioButtonId on: aCanvas with: aRenderable [

	| label |

	label := aCanvas label.
	label for: radioButtonId.
	labelCommand applyTo: label on: aCanvas.
	label with: aRenderable
]

{ #category : #'private-rendering' }
RadioGroupWebView >> renderRadioButtonFor: anElement asPartOf: aRadioGroup on: aCanvas [

	| radioButtonId |

	radioButtonId := (IdentifierAssigner prefixedBy: 'radio-button') identifyIn: aCanvas.
	self
		renderLabelFor: radioButtonId
		on: aCanvas
		with: [ | radioButton |
			radioButton := aRadioGroup radioButton.
			radioButton id: radioButtonId.
			inputCommand applyTo: radioButton on: aCanvas.
			interactionInterpreter applyTo: radioButton on: aCanvas.
			radioButton value: anElement.
			self renderLabelContentFor: anElement on: aCanvas ]
]
