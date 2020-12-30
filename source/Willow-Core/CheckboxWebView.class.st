"
I'm a binary choice web view implemented as a checkbox
"
Class {
	#name : #CheckboxWebView,
	#superclass : #BinaryChoiceWebViewBehavior,
	#instVars : [
		'commandToComponent',
		'interactionInterpreter',
		'identifierAssigner',
		'isChecked',
		'labelOptional'
	],
	#category : #'Willow-Core-WebViews'
}

{ #category : #'instance creation' }
CheckboxWebView class >> labeled: aRenderable onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	^ self
		labeledAccordingTo: (Optional containing: aRenderable)
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent
]

{ #category : #'private-instance creation' }
CheckboxWebView class >> labeledAccordingTo: aLabelOptional onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	^ (super onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff)
		initializeLabeledAccordingTo: aLabelOptional
		applying: aCommandToComponent asWebComponentCommand
]

{ #category : #'instance creation' }
CheckboxWebView class >> onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff [

	^ self onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: [ :checkbox |  ]
]

{ #category : #'instance creation' }
CheckboxWebView class >> onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	^ self
		labeledAccordingTo: Optional unused
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent
]

{ #category : #accessing }
CheckboxWebView >> identifier [

	^ identifierAssigner assignedIdentifier
]

{ #category : #configuring }
CheckboxWebView >> identifyIn: aCanvas [

	^ identifierAssigner identifyIn: aCanvas
]

{ #category : #initialization }
CheckboxWebView >> initializeLabeledAccordingTo: anOptionalLabel applying: aCommandToComponent [

	labelOptional := anOptionalLabel.
	commandToComponent := aCommandToComponent.
	interactionInterpreter := EventInterpreterDispatcher defaultingToClickHidden.
	identifierAssigner := IdentifierAssigner prefixedBy: 'checkbox'.
	isChecked := true
]

{ #category : #configuring }
CheckboxWebView >> on [

	^ interactionInterpreter
]

{ #category : #rendering }
CheckboxWebView >> renderContentOn: aCanvas [

	| checkbox |

	checkbox := aCanvas checkbox.
	commandToComponent applyTo: checkbox on: aCanvas.
	checkbox
		value: isChecked;
		callback: [ :value | [ self toggleCurrentSelection ] unless: value = isChecked ].
	self renderOptionalLabelRelatedTo: checkbox on: aCanvas.
	interactionInterpreter applyTo: checkbox on: aCanvas
]

{ #category : #'rendering - private' }
CheckboxWebView >> renderOptionalLabelRelatedTo: checkbox on: aCanvas [

	labelOptional
		withContentDo: [ :label | 
			| id |

			id := self identifyIn: aCanvas.
			checkbox id: id.
			aCanvas label
				for: id;
				with: label ]
		ifUnused: [ identifierAssigner withAssignedIdentifierDo: [ :id | checkbox id: id ] ]
]

{ #category : #'Binary Choice-API' }
CheckboxWebView >> selectOffModel [

	super selectOffModel.
	isChecked := false
]

{ #category : #'Binary Choice-API' }
CheckboxWebView >> selectOnModel [

	super selectOnModel.
	isChecked := true
]

{ #category : #'Binary Choice-API' }
CheckboxWebView >> toggleCurrentSelection [

	isChecked := isChecked not.
	super toggleCurrentSelection
]
