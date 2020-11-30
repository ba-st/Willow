"
Abstract class for the front-end component suppliers, like Bootstrap, JqueryUI, etc.
"
Class {
	#name : #FrontendComponentSupplier,
	#superclass : #Object,
	#category : #'Willow-Core-Frontend'
}

{ #category : #Interaction }
FrontendComponentSupplier >> addStatementsTo: aJSScript toCloseDialogsIn: jQueryMatchingDialogContainer matching: dialogSupplier on: aCanvas [

	^ self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> asynchronicButtonLabeled: aRenderable applying: aComponentCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> asynchronicLinkLabeled: aRenderable applying: aComponentCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> checkboxLabeled: aRenderable onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> checkboxUnlabeledOnModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff applying: aCommandToComponent [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> dateFieldApplying: aComponentCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> decimalNumberFieldApplying: aComponentCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> delayedViewShowing: aThrobber whileEvaluating: aBlock thenRendering: aRenderable [

	^ DelayedViewRenderer showing: aThrobber whileEvaluating: aBlock thenRendering: aRenderable
]

{ #category : #Supplying }
FrontendComponentSupplier >> dropdownListApplying: aComponentCommand [

	self subclassResponsibility 
]

{ #category : #Supplying }
FrontendComponentSupplier >> fieldSetContaining: aWebView applying: fieldSetCommand withLegend: aTitle applying: legendCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> multiLineTextFieldApplying: aComponentCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> multipleSelectionListBoxDisplayingAtOnce: aNumberOfElements applying: aComponentCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> naturalNumberFieldApplying: aComponentCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> radioRenderingWith: aRenderingBlock applyingToLabel: aCommandToComponent applyingToInput: anObject [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> singleLineTextFieldApplying: aComponentCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> singleSelectionListBoxDisplayingAtOnce: aNumberOfElements applying: aComponentCommand [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> synchronicButtonLabeled: aRenderable applying: aComponentCommand evaluating: anActionBlock [

	self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> tableBuilder [

	^ self subclassResponsibility
]

{ #category : #Supplying }
FrontendComponentSupplier >> unorderedListApplying: aCommandToList listing: aCollection applyingToEach: aCommandToItem [

	^ self subclassResponsibility 
]

{ #category : #Processing }
FrontendComponentSupplier >> updateRoot: aRoot [

	self subclassResponsibility
]
