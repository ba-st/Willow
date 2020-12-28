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
	#category : #'Willow-Core-WebViews'
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
RadioGroupWebView >> initializeRenderingWith: aRenderingBlock applyingToLabel: aLabelCommand applyingToInput: anInputCommand [

	labelCommand := aLabelCommand.
	inputCommand := anInputCommand.
	interactionInterpreter := EventInterpreterDispatcher defaultingToChange.
	renderingBlock := aRenderingBlock
]

{ #category : #configuring }
RadioGroupWebView >> on [

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

	aCanvas label
		for: radioButtonId;
		with: aRenderable applying: labelCommand
]

{ #category : #'private-rendering' }
RadioGroupWebView >> renderRadioButtonFor: anElement asPartOf: aRadioGroup on: aCanvas [

	| radioButtonId |

	radioButtonId := (IdentifierAssigner prefixedBy: 'radio-button') identifyIn: aCanvas.
	self
		renderLabelFor: radioButtonId
		on: aCanvas
		with: [ aRadioGroup radioButton
				id: radioButtonId;
				apply: inputCommand;
				interactUsing: interactionInterpreter;
				value: anElement.
			self renderLabelContentFor: anElement on: aCanvas ]
]
