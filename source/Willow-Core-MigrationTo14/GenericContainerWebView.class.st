Class {
	#name : #GenericContainerWebView,
	#superclass : #Object,
	#category : #'Willow-Core-MigrationTo14'
}

{ #category : #'instance creation' }
GenericContainerWebView class >> obtainingContentFrom: aContentProvider [

	self
		deprecated:
			'Use componentSupplier divisionContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'.
	^ ContainerWebView
		wrapping: [ :canvas | canvas render: aContentProvider value ]
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ]
]

{ #category : #'instance creation' }
GenericContainerWebView class >> obtainingContentFrom: aContentProvider applying: aComponentCommand [

	self
		deprecated:
			'Use componentSupplier divisionContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'.
	^ ContainerWebView
		wrapping: [ :canvas | canvas render: aContentProvider value ]
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: aComponentCommand
]

{ #category : #'instance creation' }
GenericContainerWebView class >> wrapping: aString applying: aComponentCommand [

	self
		deprecated:
			'Use componentSupplier divisionContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'.
	^ ContainerWebView
		wrapping: aString
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: aComponentCommand
]
