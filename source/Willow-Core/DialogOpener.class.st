"
I help in opening dialogs. Useful outside of the DialogOpeningCommand.
"
Class {
	#name : 'DialogOpener',
	#superclass : 'GRObject',
	#pools : [
		'Willow'
	],
	#category : 'Willow-Core-WebInteraction',
	#package : 'Willow-Core',
	#tag : 'WebInteraction'
}

{ #category : 'actions' }
DialogOpener >> open: aDialogView on: aCanvas [

	^ (aCanvas jQuery id: Constants >> #willow >> #dialogSectionName)
		append: [ :aSubCanvas | aSubCanvas render: aDialogView ]
]
