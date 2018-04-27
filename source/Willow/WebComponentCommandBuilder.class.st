"
I'm a builder to ease the creation of component commands
"
Class {
	#name : #WebComponentCommandBuilder,
	#superclass : #GRObject,
	#category : #'Willow-Frontend'
}

{ #category : #Configuring }
WebComponentCommandBuilder >> addClass [

	^ ComponentClassificationCommandBuilder new
]

{ #category : #Configuring }
WebComponentCommandBuilder >> addScript [

	^ ComponentScriptCommandBuilder new
]

{ #category : #Building }
WebComponentCommandBuilder >> beAutofocused [

	^ AutoFocusComponentCommand new
]

{ #category : #Building }
WebComponentCommandBuilder >> beDateInput [

	^ InputModeCommand asDate
]

{ #category : #Building }
WebComponentCommandBuilder >> beDisabled [

	^ DisableComponentCommand new
]

{ #category : #Building }
WebComponentCommandBuilder >> beEmailInput [

	^ InputModeCommand asEmail
]

{ #category : #Building }
WebComponentCommandBuilder >> beNumberInput [

	^ InputModeCommand asNumber
]

{ #category : #Building }
WebComponentCommandBuilder >> bePasswordInput [

	^ InputModeCommand asPassword
]

{ #category : #Building }
WebComponentCommandBuilder >> beReadOnly [

	^ ComponentReadOnlyCommand new
]

{ #category : #Building }
WebComponentCommandBuilder >> beRequired [

	^ ComponentRequiredCommand new
]

{ #category : #Building }
WebComponentCommandBuilder >> boundBetween: aLowerBound and: anUpperBound [

	^ ComponentBoundaryCommand between: aLowerBound and: anUpperBound
]

{ #category : #Building }
WebComponentCommandBuilder >> boundNotNegative [

	^ ComponentBoundaryCommand nonNegative
]

{ #category : #Building }
WebComponentCommandBuilder >> deselectAllOptions [

	^ DeselectAllOptionsCommand new
]

{ #category : #Building }
WebComponentCommandBuilder >> disableTabCycle [

	^ DisableComponentTabCycleCommand new
]

{ #category : #Building }
WebComponentCommandBuilder >> labelItemsWith: aBlockClosure [

	^ ListLabelingCommand with: aBlockClosure
]

{ #category : #Building }
WebComponentCommandBuilder >> setARIAAttribute: aName to: aValue [

	^ ComponentAccessibilityEnrichmentCommand toDeclare: aName with: aValue
]

{ #category : #Building }
WebComponentCommandBuilder >> setAttribute: aName to: aValue [

	^ ComponentAttributeCommand named: aName with: aValue
]

{ #category : #Building }
WebComponentCommandBuilder >> setCallbackTo: aBlockClosure [

	^ ComponentCallbackSettingCommand setting: aBlockClosure
]

{ #category : #Building }
WebComponentCommandBuilder >> setData: aName to: aValue [

	^ ComponentMetadataCommand toDeclare: aName with: aValue
]

{ #category : #Building }
WebComponentCommandBuilder >> setMaximumLengthTo: anInteger [

	^ InputFieldMaxLengthCommand allowingUpTo: anInteger
]

{ #category : #Building }
WebComponentCommandBuilder >> setNameTo: aString [

	^ ComponentNamingCommand assigning: aString
]

{ #category : #Building }
WebComponentCommandBuilder >> setPlaceholderTo: aSuggestion [

	^ ComponentPlaceholderCommand suggestedBy: aSuggestion
]

{ #category : #Building }
WebComponentCommandBuilder >> setStyleTo: aBlockClosure [

	^ SetComponentStyleCommand setting: (aBlockClosure value: CssDeclarationBlock new)
]

{ #category : #Building }
WebComponentCommandBuilder >> setTabIndexTo: anInteger [

	^ SetComponentTabIndexCommand setting: anInteger
]

{ #category : #Building }
WebComponentCommandBuilder >> setTitleTo: aTitle [

	^ ComponentTitleCommand toSet: aTitle 
]

{ #category : #Building }
WebComponentCommandBuilder >> when: aCondition apply: aComponentCommand [

	^ ConditionalComponentCommand applying: aComponentCommand when: aCondition
]
