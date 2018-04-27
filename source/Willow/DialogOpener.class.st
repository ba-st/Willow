"
I help in opening dialogs. Useful outside of the DialogOpeningCommand.
"
Class {
	#name : #DialogOpener,
	#superclass : #GRObject,
	#category : #'Willow-WebInteraction'
}

{ #category : #actions }
DialogOpener >> open: aDialogView on: aCanvas [

	^ (aCanvas jQuery id: WillowConstants dialogSectionName) append: [ :aSubCanvas | aSubCanvas render: aDialogView ]
]
