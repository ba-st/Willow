Class {
	#name : #WebInteractionInterpreter,
	#superclass : #WebInteractionInterpreterBehavior,
	#instVars : [
		'interaction'
	],
	#category : #'Willow-Core-WebInteraction'
}

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forChangeInHiddenInputDependentComponentValue [

	self
		deprecated: 'Use an EventInterpreterDispatcher'
		transformWith:
			'WebInteractionInterpreter forChangeInHiddenInputDependentComponentValue'
				-> 'EventInterpreterDispatcher defaultingToChangeHidden'.

	^ EventInterpreterDispatcher defaultingToChangeHidden
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forClickOnHiddenInputDependentComponent [

	self
		deprecated: 'Use an EventInterpreterDispatcher'
		transformWith:
			'WebInteractionInterpreter forClickOnHiddenInputDependentComponent'
				-> 'EventInterpreterDispatcher defaultingToClickHidden'.

	^ EventInterpreterDispatcher defaultingToClickHidden
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forEvaluationOf: aSelector withAll: aParameterArray [

	^ self
		workingWith: ( WebComponentInteraction triggeredOnEvaluationOf: aSelector withAll: aParameterArray )
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> forInstantEvaluation [

	^ self workingWith: WebComponentInteraction triggeredOnDocumentLoad
]

{ #category : #'instance creation' }
WebInteractionInterpreter class >> workingWith: aWebComponentInteraction [

	^ self new initializeWorkingWith: aWebComponentInteraction
]

{ #category : #evaluating }
WebInteractionInterpreter >> applyTo: aComponent on: aCanvas [

	interaction applyTo: aComponent on: aCanvas
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

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> disable [

	interaction onTriggerExecute: ComponentEnableStatusChangingCommand disablingCurrentComponent
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> disable: aComponent [

	interaction onTriggerExecute: ( ComponentEnableStatusChangingCommand disabling: aComponent )
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> enable: aComponent [

	interaction onTriggerExecute: ( ComponentEnableStatusChangingCommand enabling: aComponent )
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> focus: anIdentifiedWebView [

	interaction onTriggerExecute: ( ComponentFocusingCommand for: anIdentifiedWebView )
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> focusUsing: aComponentProvider [

	interaction
		onTriggerExecute: ( ComponentFocusingCommand findingComponentUsing: aComponentProvider )
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

{ #category : #'Configuring - Dialogs' }
WebInteractionInterpreter >> open: aView [

	interaction onTriggerExecute: (DialogOpeningCommand alwaysOpening: aView)
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> remove: anIdentifiedView [

	interaction onTriggerExecute: ( ComponentRemovingCommand for: anIdentifiedView )
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> render: anIdentifiedView [

	interaction onTriggerExecute: ( RenderingCommand for: anIdentifiedView )
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> renderAll: anIdentifiedViewCollection [

	interaction onTriggerExecute: ( RenderingCommand forAll: anIdentifiedViewCollection )
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

{ #category : #Configuring }
WebInteractionInterpreter >> serverDo: aCallbackBlock [

	interaction
		onTriggerExecute:
			( ServerResponseCommand
				withBehaviorDeterminedBy: aCallbackBlock
				conditionedBy: Optional unused
				requiring: Optional unused )
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> setValueTo: aValueProvider thenTriggerChangeOf: anIdentifiedView [

	interaction
		onTriggerExecute: ( ComponentValueSettingCommand triggeringChangesOn: anIdentifiedView withValueFrom: aValueProvider )
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> setValueTo: aValueProvider withoutTriggeringChangeOnComponentWithId: identifier [

	interaction
		onTriggerExecute:
			( ComponentValueSettingCommand obtainingIdentifierFrom: [ identifier ] valueFrom: aValueProvider )
]

{ #category : #Configuring }
WebInteractionInterpreter >> showLoadingNotificationDisplaying: aWebView applying: aComponentCommand [

	interaction onTriggerExecute:
		(LoadingNotificationCommand displaying: aWebView applying: aComponentCommand)
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

	interaction
		onTriggerExecute: ( TemporarilyDisablingCommand transforming: anIdentifiedView into: aView )
]

{ #category : #'Configuring - DOM' }
WebInteractionInterpreter >> temporarilyDisableAndTransformInto: aView [

	interaction onTriggerExecute: ( TemporarilyDisablingCommand transformingCurrentViewInto: aView )
]

{ #category : #'Configuring - CSS' }
WebInteractionInterpreter >> updateCssClasses: aCssClassConfigurationBlock
	onElementsMatching: anElementMatchingBlock [

	interaction
		onTriggerExecute:
			( ComponentStyleClassChangingCommand
				applying: aCssClassConfigurationBlock
				targeting: anElementMatchingBlock )
]

{ #category : #Configuring }
WebInteractionInterpreter >> userAgentDo: aServerIndependentAction [

	interaction
		onTriggerExecute: (UserAgentCommand executing: aServerIndependentAction)
]

{ #category : #Configuring }
WebInteractionInterpreter >> with: aJavascriptFromUserAgent onlyWhen: aJavascriptBooleanStatement serverDo: aCallbackBlock [

	interaction
		onTriggerExecute:
			( ServerResponseCommand
				withBehaviorDeterminedBy: aCallbackBlock
				conditionedBy: ( Optional containing: aJavascriptBooleanStatement )
				requiring: ( Optional containing: aJavascriptFromUserAgent ) )
]

{ #category : #Configuring }
WebInteractionInterpreter >> with: aJavascriptFromUserAgent serverDo: aCallbackBlock [

	interaction
		onTriggerExecute:
			( ServerResponseCommand
				withBehaviorDeterminedBy: aCallbackBlock
				conditionedBy: Optional unused
				requiring: ( Optional containing: aJavascriptFromUserAgent ) )
]
