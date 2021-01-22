Class {
	#name : #SingleSelectionListBoxWebView,
	#superclass : #Object,
	#category : #'Willow-Core-MigrationTo14'
}

{ #category : #'instance creation' }
SingleSelectionListBoxWebView class >> displayingAtOnce: aNumberOfElements [

	self
		deprecated:
			'Use componentSupplier singleSelectionListBoxDisplayingAtOnce:applying: if available, otherwise create a SingleSelectionWebView using the same implementation'
			transformWith:
			'`@receiver displayingAtOnce: `@aNumberOfElements'
				->
					'self componentSupplier singleSelectionListBoxDisplayingAtOnce: `@aNumberOfElements applying: [  ]'
			when: [ thisContext activeHome notNil
					and: [ thisContext activeHome sender receiver respondsTo: #componentSupplier ]
				];
		deprecated:
			'Use componentSupplier singleSelectionListBoxDisplayingAtOnce:applying: if available, otherwise create a SingleSelectionWebView using the same implementation'
			transformWith:
			'`@receiver displayingAtOnce: `@aNumberOfElements'
				->
					'SingleSelectionWebView
		listBoxDisplayingAtOnce: `@aNumberOfElements
		applying: [  ]
		applyingToOptions: [  ]'.

	^ SingleSelectionWebView
		listBoxDisplayingAtOnce: aNumberOfElements
		applying: [  ]
		applyingToOptions: [  ]
]

{ #category : #'instance creation' }
SingleSelectionListBoxWebView class >> displayingAtOnce: aNumberOfElements applying: aComponentCommand [

	self
		deprecated:
			'Use componentSupplier singleSelectionListBoxDisplayingAtOnce:applying: if available, otherwise create a SingleSelectionWebView using the same implementation'
			transformWith:
			'`@receiver displayingAtOnce: `@aNumberOfElements applying: `@aComponentCommand'
				->
					'self componentSupplier singleSelectionListBoxDisplayingAtOnce: `@aNumberOfElements applying: `@aComponentCommand'
			when: [ thisContext activeHome notNil
					and: [ thisContext activeHome sender receiver respondsTo: #componentSupplier ]
				];
		deprecated:
			'Use componentSupplier singleSelectionListBoxDisplayingAtOnce:applying: if available, otherwise create a SingleSelectionWebView using the same implementation'
			transformWith:
			'`@receiver displayingAtOnce: `@aNumberOfElements applying: `@aComponentCommand'
				->
					'SingleSelectionWebView
		listBoxDisplayingAtOnce: `@aNumberOfElements
		applying: `@aComponentCommand
		applyingToOptions: [  ]'.

	^ SingleSelectionWebView
		listBoxDisplayingAtOnce: aNumberOfElements
		applying: aComponentCommand
		applyingToOptions: [  ]
]
