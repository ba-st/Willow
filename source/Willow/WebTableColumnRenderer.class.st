"
I'm responsible of rendering a column and header in a table.
"
Class {
	#name : #WebTableColumnRenderer,
	#superclass : #WebTableColumnRendererBehavior,
	#instVars : [
		'title',
		'renderingCommand',
		'commandToHeading',
		'commandToCell'
	],
	#category : 'Willow-WebViews'
}

{ #category : #'Instance Creation' }
WebTableColumnRenderer class >> titled: aName applyingToEachCell: aCommandToCell renderingWith: aRenderingCommand applyingToHeading: aCommandToHeading [

	^ self new
		initializeTitled: aName
		applyingToEachCell: aCommandToCell asWebComponentCommand
		renderingWith: aRenderingCommand
		applyingToHeading: aCommandToHeading asWebComponentCommand
]

{ #category : #'Instance Creation' }
WebTableColumnRenderer class >> titled: aName renderingItemWith: aRenderingCommand [

	^ self
		titled: aName
		applyingToEachCell: [ :cell |  ]
		renderingWith: aRenderingCommand
		applyingToHeading: [ :heading |  ]
]

{ #category : #'Instance Creation' }
WebTableColumnRenderer class >> untitledRenderingItemWith: aRenderingCommand [

	^self titled: '' renderingItemWith: aRenderingCommand
]

{ #category : #initialization }
WebTableColumnRenderer >> initializeTitled: aTitle applyingToEachCell: aCommandToCell renderingWith: aRenderingCommand applyingToHeading: aCommandToHeading [

	title := aTitle.
	renderingCommand := aRenderingCommand.
	commandToHeading := aCommandToHeading.
	commandToCell := aCommandToCell
]

{ #category : #rendering }
WebTableColumnRenderer >> renderCellFor: anItem on: aCanvas [

	| tableData |

	tableData := aCanvas tableData.
	commandToCell applyTo: tableData on: aCanvas.
	tableData with: (renderingCommand value: anItem)
]

{ #category : #rendering }
WebTableColumnRenderer >> renderHeadingOn: aCanvas [

	| heading |

	heading := aCanvas tableHeading.
	commandToCell applyTo: heading on: aCanvas.
	commandToHeading applyTo: heading on: aCanvas.
	heading with: title
]
