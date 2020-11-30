"
I provide plain HTML 5 components.
"
Class {
	#name : #Html5ComponentSupplier,
	#superclass : #FrontendComponentSupplier,
	#category : #'Willow-Core-Frontend'
}

{ #category : #Interaction }
Html5ComponentSupplier >> addStatementsTo: aJSScript toCloseDialogsIn: jQueryMatchingDialogContainer matching: dialogSupplier on: aCanvas [

	aJSScript << (dialogSupplier value: (jQueryMatchingDialogContainer children: 'dialog')) removeAttribute: 'open'
]

{ #category : #Supplying }
Html5ComponentSupplier >> asynchronicButtonLabeled: aRenderable applying: aComponentCommand [

	^ AsynchronicButtonWebView labeled: aRenderable applying: aComponentCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> asynchronicLinkLabeled: aRenderable applying: aComponentCommand [

	^ LinkWebView asynchronicLabeled: aRenderable applying: aComponentCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> checkboxLabeled: aRenderable onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	^ CheckboxWebView
		labeled: aRenderable
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent
]

{ #category : #Supplying }
Html5ComponentSupplier >> checkboxUnlabeledOnModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	^ CheckboxWebView
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: aCommandToComponent
]

{ #category : #Supplying }
Html5ComponentSupplier >> dateFieldApplying: aComponentCommand [

	^ DateFieldWebView applying: aComponentCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> decimalNumberFieldApplying: aComponentCommand [

	^ NumberFieldWebView applying: aComponentCommand transformingWith: FloatCodec new
]

{ #category : #Supplying }
Html5ComponentSupplier >> dropdownListApplying: aComponentCommand [

	^ DropDownListWebView applying: aComponentCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> fieldSetContaining: aWebView applying: fieldSetCommand withLegend: aTitle applying: legendCommand [

	^ FieldSetWebView
		containing: aWebView
		applying: fieldSetCommand
		withLegend: aTitle
		applying: legendCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> multiLineTextFieldApplying: aComponentCommand [

	^ TextFieldWebView multiLineTriggeringOnChangeApplying: aComponentCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> multipleSelectionListBoxDisplayingAtOnce: aNumberOfElements applying: aComponentCommand [

	^ MultipleSelectionListBoxWebView displayingAtOnce: aNumberOfElements applying: aComponentCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> naturalNumberFieldApplying: aComponentCommand [

	^ NumberFieldWebView applying: [ :field | field boundNotNegative + aComponentCommand ] transformingWith: NaturalNumberCodec new
]

{ #category : #Supplying }
Html5ComponentSupplier >> radioRenderingWith: aRenderingBlock applyingToLabel: aLabelCommand applyingToInput: anInputCommand [

	^ RadioGroupWebView 
		renderingWith: aRenderingBlock 
		applyingToLabel: aLabelCommand 
		applyingToInput: anInputCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> singleLineTextFieldApplying: aComponentCommand [

	^ TextFieldWebView singleLineTriggeringOnChangeApplying: aComponentCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> singleSelectionListBoxDisplayingAtOnce: aNumberOfElements applying: aComponentCommand [

	^ SingleSelectionListBoxWebView displayingAtOnce: aNumberOfElements applying: aComponentCommand
]

{ #category : #Supplying }
Html5ComponentSupplier >> synchronicButtonLabeled: aRenderable applying: aComponentCommand evaluating: anActionBlock [

	^ SynchronicSubmitButtonWebView
		labeled: aRenderable
		applying: aComponentCommand
		evaluating: anActionBlock
]

{ #category : #Supplying }
Html5ComponentSupplier >> tableBuilder [

	^ TableWebViewBuilder new
]

{ #category : #Supplying }
Html5ComponentSupplier >> unorderedListApplying: aCommandToList listing: aCollection applyingToEach: aCommandToItem [

	^ UnorderedListWebView applying: aCommandToList listing: aCollection applyingToEach: aCommandToItem
]

{ #category : #Processing }
Html5ComponentSupplier >> updateRoot: aRoot [

	aRoot beHtml5
]
