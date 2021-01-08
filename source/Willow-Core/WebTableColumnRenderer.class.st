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
	#category : #'Willow-Core-WebViews'
}

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

	aCanvas tableData with: (renderingCommand cull: anItem cull: anIndex) applying: commandToCell
]

{ #category : #rendering }
WebTableColumnRenderer >> renderFooterCellSummarizing: tableContents on: aCanvas [

	aCanvas tableData with: (footerRenderingCommand cull: tableContents) applying: commandToCell + commandToFooterCell
]

{ #category : #rendering }
WebTableColumnRenderer >> renderHeadingOn: aCanvas [

	aCanvas tableHeading with: title applying: commandToCell + commandToHeading
]
