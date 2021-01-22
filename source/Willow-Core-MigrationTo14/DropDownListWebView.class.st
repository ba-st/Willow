Class {
	#name : #DropDownListWebView,
	#superclass : #Object,
	#category : #'Willow-Core-MigrationTo14'
}

{ #category : #'instance creation' }
DropDownListWebView class >> applying: aComponentCommand [

	self
		deprecated:
			'Use componentSupplier dropdownListApplying: if available, otherwise create a SingleSelectionWebView using the same implementation'
			transformWith:
			'`@receiver applying: `@aComponentCommand'
				-> 'self componentSupplier dropdownListApplying: `@aComponentCommand'
			when: [ thisContext activeHome notNil
					and: [ thisContext activeHome sender receiver respondsTo: #componentSupplier ]
				];
		deprecated:
			'Use componentSupplier dropdownListApplying: if available, otherwise create a SingleSelectionWebView using the same implementation'
			transformWith:
			'`@receiver applying: `@aComponentCommand'
				-> 'SingleSelectionWebView dropDownListApplying: `@aComponentCommand applyingToOptions: [  ]'.

	^ SingleSelectionWebView dropDownListApplying: aComponentCommand applyingToOptions: [  ]
]
