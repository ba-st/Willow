Class {
	#name : #WebInteractionInterpreter,
	#superclass : #WebInteractionInterpreterBehavior,
	#instVars : [
		'interaction'
	],
	#category : #'Willow-WebInteraction'
}

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forChangeInComponentValue [

	^self workingWith: WebComponentInteraction triggeredOnChange
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forChangeInHiddenInputDependentComponentValue [

	^self workingWith: WebComponentInteraction triggeredOnChangeSerializingHiddenInputs
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forClickOnComponent [

	^self workingWith: WebComponentInteraction triggeredOnClick
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forClickOnHiddenInputDependentComponent [

	^self workingWith: WebComponentInteraction triggeredOnClickSerializingHiddenInputs
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forDelayedModelLoading [

	^ self workingWith: DelayedModelLoader new
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forDoubleClickOnComponent [

	^self workingWith: WebComponentInteraction triggeredOnDoubleClick
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forEvaluationOf: aSelector withAll: aParameterArray [

	^self workingWith:
		(WebComponentInteraction triggeredOnEvaluationOf: aSelector withAll: aParameterArray)
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forInstantEvaluation [

	^self workingWith: WebComponentInteraction triggeredOnDocumentLoad
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forReleaseOfKeyInComponent [

	^self workingWith: WebComponentInteraction triggeredOnKeyUp
]

{ #category : #'instance creation - private' }
WebInteractionInterpreter class >> workingWith: aWebComponentInteraction [

	^self new initializeWorkingWith: aWebComponentInteraction
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreter >> addCssClass: aCssStyle toComponentsMatching: aComponentProvider [

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: aComponentProvider
				altering: aCssStyle
				sending: #addClass:)
]

{ #category : #evaluating }
WebInteractionInterpreter >> applyTo: aComponent on: aCanvas [

	interaction applyTo: aComponent on: aCanvas
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreter >> changeCssClass: anExistingStyle to: aNewStyle [

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: [ :canvas | canvas jQuery class: anExistingStyle ]
				altering: anExistingStyle
				sending: #removeClass:
				using: [ :component | component addClass: aNewStyle ])
]

{ #category : #'Configuring - Dialogs' }
WebInteractionInterpreter >> closeAllDialogs [

	interaction onTriggerExecute: DialogClosingCommand forAllDialogs
]

{ #category : #'Configuring - Dialogs' }
WebInteractionInterpreter >> closeLastDialog [

	interaction onTriggerExecute: DialogClosingCommand onlyForLastDialog
]

{ #category : #Configuring }
WebInteractionInterpreter >> confirmAsking: aQuestion [

	interaction
		onTriggerExecute: (ConfirmationCommand asking: aQuestion)
]

{ #category : #Configuring }
WebInteractionInterpreter >> determineBehaviorByEvaluating: aCallbackBlock [

	interaction onTriggerExecute: (DelayedCommand withBehaviorDeterminedBy: aCallbackBlock)
]

{ #category : #Configuring }
WebInteractionInterpreter >> determineBehaviorByEvaluating: aCallbackBlock with: aParameter [

	interaction onTriggerExecute: (DelayedCommand withBehaviorDeterminedBy: aCallbackBlock with: aParameter)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> disable [

	interaction onTriggerExecute: ComponentEnableStatusChangingCommand disablingCurrentComponent
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> enable: aComponent [

	interaction onTriggerExecute: (ComponentEnableStatusChangingCommand enabling: aComponent)
]

{ #category : #Configuring }
WebInteractionInterpreter >> executeOnClient: aServerIndependentAction [

	interaction
		onTriggerExecute: (PluggableExecutionOnClientCommand executingOnly: aServerIndependentAction)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> focus: anIdentifiedWebView [

	interaction
		onTriggerExecute: (ComponentFocusingCommand for: anIdentifiedWebView)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> focusUsing: aComponentProvider [

	interaction
		onTriggerExecute: (ComponentFocusingCommand findingComponentUsing: aComponentProvider)
]

{ #category : #Configuring }
WebInteractionInterpreter >> inform: aMessage [

	interaction onTriggerExecute: (AlertingCommand stating: aMessage)
]

{ #category : #Configuring }
WebInteractionInterpreter >> informSelection [

	interaction onTriggerExecute: AlertingCommand informingSelection
]

{ #category : #initialization }
WebInteractionInterpreter >> initializeWorkingWith: aWebComponentInteraction [

	interaction := aWebComponentInteraction
]

{ #category : #Configuring }
WebInteractionInterpreter >> onlyWhen: aStringCondition determineBehaviorByEvaluating: aCallbackBlock with: aParameter [

	interaction
		onTriggerExecute:
			(DelayedCommand
				withBehaviorDeterminedBy: aCallbackBlock
				executedOnlyWhen: aStringCondition
				with: aParameter)
]

{ #category : #'Configuring - Dialogs' }
WebInteractionInterpreter >> open: aView [

	interaction onTriggerExecute: (DialogOpeningCommand alwaysOpening: aView)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> remove: anIdentifiedView [

	interaction onTriggerExecute: (ComponentRemovingCommand for: anIdentifiedView)
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreter >> removeCssClass: aCssStyle fromComponentsMatching: aComponentProvider [

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: aComponentProvider
				altering: aCssStyle
				sending: #removeClass:)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> render: anIdentifiedView [

	interaction onTriggerExecute: (RenderingCommand for: anIdentifiedView)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> renderAll: anIdentifiedViewCollection [

	interaction onTriggerExecute: (RenderingCommand forAll: anIdentifiedViewCollection)
]

{ #category : #Configuring }
WebInteractionInterpreter >> scrollingIntoView: anIdentifier [

	interaction onTriggerExecute: (ScrollIntoViewCommand withComponentIdentifierProvidedBy: [ anIdentifier ])
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreter >> serializeChildForm [

	interaction onTriggerExecute: SerializationCommand forChildForm
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreter >> serializeContainerForm [

	interaction onTriggerExecute: SerializationCommand forParentForm
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreter >> serializeForm: anIdentifiedForm [

	interaction onTriggerExecute: (SerializationCommand forForm: anIdentifiedForm)
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreter >> serializeIt [

	interaction onTriggerExecute: SerializationCommand forCurrentObject
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreter >> serializeWithHiddenInputs [

	interaction onTriggerExecute: SerializationCommand forCurrentObjectWithHiddenInputs
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView [

	interaction
		onTriggerExecute:
			(ComponentValueSettingCommand
				triggeringChangesObtainingIdentifierFrom: [ anIdentifiedView identifier ]
				valueFrom: aValueProvider)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> setValueTo: aValueProvider withoutTriggeringChangeOnComponentWithId: identifier [

	interaction
		onTriggerExecute:
			(ComponentValueSettingCommand
				obtainingIdentifierFrom: [ identifier ]
				valueFrom: aValueProvider)
]

{ #category : #Configuring }
WebInteractionInterpreter >> showLoadingNotificationStyledAsAll: classes [

	interaction
		onTriggerExecute: (LoadingNotificationCommand onPageTopWithClasses: classes)
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreter >> submitForm: anIdentifiedForm [

	interaction
		onTriggerExecute:
			(FormSubmitCommand
				findingComponentUsing: [ :aCanvas | 
					anIdentifiedForm identifyIn: aCanvas.
					aCanvas jQuery id: anIdentifiedForm identifier ])
]

{ #category : #'Configuring - Serialization' }
WebInteractionInterpreter >> submitFormStyledAs: aCssStyle [

	interaction onTriggerExecute: (FormSubmitCommand forFormStyledAs: aCssStyle)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> temporarilyDisableAndTransform: anIdentifiedView into: aView [

	interaction onTriggerExecute: (TemporarilyDisablingCommand transforming: anIdentifiedView into: aView)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> temporarilyDisableAndTransformInto: aView [

	interaction onTriggerExecute: (TemporarilyDisablingCommand transformingCurrentViewInto: aView)
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreter >> toggleCssClass: aCssStyle onComponentsMatching: aComponentProvider [

	interaction
		onTriggerExecute:
			(ComponentStyleClassChangingCommand
				on: aComponentProvider
				altering: aCssStyle
				sending: #toggleClass:)
]
