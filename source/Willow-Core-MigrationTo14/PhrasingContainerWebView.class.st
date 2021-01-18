Class {
	#name : #PhrasingContainerWebView,
	#superclass : #Object,
	#category : #'Willow-Core-MigrationTo14'
}

{ #category : #'instance creation' }
PhrasingContainerWebView class >> obtainingContentFrom: aContentProvider [

	self
		deprecated:
			'Use componentSupplier inlineContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'.
	^ ContainerWebView
		wrapping: [ :canvas | canvas render: aContentProvider value ]
		intoElementBuiltUsing: [ :canvas | canvas span ]
		applying: [  ]
]

{ #category : #'instance creation' }
PhrasingContainerWebView class >> obtainingContentFrom: aContentProvider applying: aComponentCommand [

	self
		deprecated:
			'Use componentSupplier inlineContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'.
	^ ContainerWebView
		wrapping: [ :canvas | canvas render: aContentProvider value ]
		intoElementBuiltUsing: [ :canvas | canvas span ]
		applying: aComponentCommand
]

{ #category : #'instance creation' }
PhrasingContainerWebView class >> wrapping: aString [

	self
		deprecated:
			'Use componentSupplier inlineContainerWrapping:applying: if available, otherwise create a ContainerWebView using the same implementation'.
	^ ContainerWebView
		wrapping: aString
		intoElementBuiltUsing: [ :canvas | canvas span ]
		applying: [  ]
]
