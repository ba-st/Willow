"
I'm responsible of rendering several columns in a table with an unique header.
"
Class {
	#name : #WebTableMultiColumnRenderer,
	#superclass : #WebTableColumnRendererBehavior,
	#instVars : [
		'title',
		'renderingCommands',
		'commandToHeading',
		'commandToCell'
	],
	#category : #'Willow-WebViews'
}

{ #category : #'Instance Creation' }
WebTableMultiColumnRenderer class >> titled: aTitle applyingToEachCell: aCommandToCell renderingWithAll: aRenderingCommandCollection applyingToHeading: aCommandToHeading [

	AssertionChecker enforce: [ aRenderingCommandCollection size > 1 ] because: 'Don''t use this renderer with less than two column rendering commands. Use WebTableColumnRenderer instead.'.

	^ self new
		initializeTitled: aTitle
		applyingToEachCell: aCommandToCell asWebComponentCommand 
		renderingWithAll: aRenderingCommandCollection
		applyingToHeading: aCommandToHeading asWebComponentCommand 
]

{ #category : #'Instance Creation' }
WebTableMultiColumnRenderer class >> titled: aName renderingItemWithAll: aRenderingCommandCollection [

	^ self
		titled: aName
		applyingToEachCell: [ :cell |  ]
		renderingWithAll: aRenderingCommandCollection
		applyingToHeading: [ :heading |  ]
]

{ #category : #initialization }
WebTableMultiColumnRenderer >> initializeTitled: aTitle applyingToEachCell: aCommandToCell renderingWithAll: aRenderingCommandCollection applyingToHeading: aCommandToHeading [

	title := aTitle.
	renderingCommands := aRenderingCommandCollection.
	commandToHeading := aCommandToHeading.
	commandToCell := aCommandToCell
]

{ #category : #rendering }
WebTableMultiColumnRenderer >> renderCellFor: anItem on: aCanvas [

	renderingCommands
		do: [ :renderingCommand | 
			| tableData |
			tableData := aCanvas tableData.
			commandToCell applyTo: tableData on: aCanvas.
			tableData with: (renderingCommand value: anItem) ]
]

{ #category : #rendering }
WebTableMultiColumnRenderer >> renderHeadingOn: aCanvas [

	| heading |

	heading := aCanvas tableHeading.
	commandToCell applyTo: heading on: aCanvas.
	(SetColumnSpanCommand setting: renderingCommands size) applyTo: heading on: aCanvas.
	commandToHeading applyTo: heading on: aCanvas.
	heading with: title
]
