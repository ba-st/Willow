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

{ #category : #'Instance Creation' }
WebTableColumnRenderer class >> titled: aName applyingToEachCell: aCommandToCell renderingWith: aRenderingCommand applyingToHeading: aCommandToHeading [

	^ self
		titled: aName
		applyingToEachCell: aCommandToCell asWebComponentCommand
		renderingWith: aRenderingCommand
		applyingToHeading: aCommandToHeading asWebComponentCommand
		summarizedWith: [  ]
		applyingToFooter: [ :cell |  ]
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

{ #category : #'Instance Creation' }
WebTableColumnRenderer class >> titled: aName renderingItemWith: aRenderingCommand [

	^ self
		titled: aName
		applyingToEachCell: [ :cell |  ]
		renderingWith: aRenderingCommand
		applyingToHeading: [ :heading |  ]
]

{ #category : #'Instance Creation' }
WebTableColumnRenderer class >> titled: aTitle renderingItemWith: aRenderingCommand summarizedWith: aFooterRenderingCommand [

	^ self
		titled: aTitle
		applyingToEachCell: [ :cell |  ]
		renderingWith: aRenderingCommand
		applyingToHeading: [ :heading |  ]
		summarizedWith: aFooterRenderingCommand
		applyingToFooter: [ :cell |  ]
]

{ #category : #'Instance Creation' }
WebTableColumnRenderer class >> untitledRenderingItemWith: aRenderingCommand [

	^self titled: '' renderingItemWith: aRenderingCommand
]

{ #category : #'Instance Creation' }
WebTableColumnRenderer class >> untitledRenderingItemWith: aRenderingCommand summarizedWith: aFooterRenderingCommand [

	^ self
		titled: ''
		applyingToEachCell: [ :cell |  ]
		renderingWith: aRenderingCommand
		applyingToHeading: [ :heading |  ]
		summarizedWith: aFooterRenderingCommand
		applyingToFooter: [ :cell |  ]
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

	| heading |

	heading := aCanvas tableData.
	commandToCell applyTo: heading on: aCanvas.
	commandToFooterCell applyTo: heading on: aCanvas.
	heading with: (footerRenderingCommand cull: tableContents)
]

{ #category : #rendering }
WebTableColumnRenderer >> renderHeadingOn: aCanvas [

	| heading |

	heading := aCanvas tableHeading.
	commandToCell applyTo: heading on: aCanvas.
	commandToHeading applyTo: heading on: aCanvas.
	heading with: title
]
