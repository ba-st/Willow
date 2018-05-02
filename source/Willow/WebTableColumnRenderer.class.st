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
		'commandToCell',
		'footerRenderingCommand',
		'commandToFooterCell'
	],
	#category : #'Willow-WebViews'
}

{ #category : #deprecated }
WebTableColumnRenderer class >> titled: aName applyingToEachCell: aCommandToCell renderingWith: aRenderingCommand applyingToHeading: aCommandToHeading [

	self deprecated: 'Use TableWebViewBuilder'
]

{ #category : #'Instance Creation' }
WebTableColumnRenderer class >> titled: aName applyingToEachCell: aCommandToCell renderingWith: aRenderingCommand applyingToHeading: aCommandToHeading summarizedWith: aFooterRenderingCommand applyingToFooter: aCommantToFooterCell [

	^ self new
		initializeTitled: aName
		applyingToEachCell: aCommandToCell asWebComponentCommand
		renderingWith: aRenderingCommand
		applyingToHeading: aCommandToHeading asWebComponentCommand
		summarizedWith: aFooterRenderingCommand
		applyingToFooter: aCommantToFooterCell asWebComponentCommand
]

{ #category : #deprecated }
WebTableColumnRenderer class >> titled: aName renderingItemWith: aRenderingCommand [

	self deprecated: 'Use TableWebViewBuilder'
]

{ #category : #deprecated }
WebTableColumnRenderer class >> titled: aTitle renderingItemWith: aRenderingCommand summarizedWith: aFooterRenderingCommand [

	self deprecated: 'Use TableWebViewBuilder'
]

{ #category : #deprecated }
WebTableColumnRenderer class >> untitledRenderingItemWith: aRenderingCommand [

	self deprecated: 'Use TableWebViewBuilder'.

]

{ #category : #deprecated }
WebTableColumnRenderer class >> untitledRenderingItemWith: aRenderingCommand summarizedWith: aFooterRenderingCommand [

	self deprecated: 'Use TableWebViewBuilder'
]

{ #category : #initialization }
WebTableColumnRenderer >> initializeTitled: aTitle applyingToEachCell: aCommandToCell renderingWith: aRenderingCommand applyingToHeading: aCommandToHeading summarizedWith: aFooterRenderingCommand applyingToFooter: aCommandToFooterCell [

	title := aTitle.
	renderingCommand := aRenderingCommand.
	footerRenderingCommand := aFooterRenderingCommand.
	commandToHeading := aCommandToHeading.
	commandToCell := aCommandToCell.
	commandToFooterCell := aCommandToFooterCell
]

{ #category : #rendering }
WebTableColumnRenderer >> renderCellAt: anIndex for: anItem on: aCanvas [

	| tableData |

	tableData := aCanvas tableData.
	commandToCell applyTo: tableData on: aCanvas.
	tableData with: (renderingCommand cull: anItem cull: anIndex)
]

{ #category : #rendering }
WebTableColumnRenderer >> renderFooterCellSummarizing: tableContents on: aCanvas [

	| cell |

	cell := aCanvas tableData.
	commandToCell applyTo: cell on: aCanvas.
	commandToFooterCell applyTo: cell on: aCanvas.
	cell with: (footerRenderingCommand cull: tableContents)
]

{ #category : #rendering }
WebTableColumnRenderer >> renderHeadingOn: aCanvas [

	| heading |

	heading := aCanvas tableHeading.
	commandToCell applyTo: heading on: aCanvas.
	commandToHeading applyTo: heading on: aCanvas.
	heading with: title
]
