tests-rendering
testRenderingWhenEmptyDoesNotProduceHTMLContent

	| radioGroup html |

	radioGroup := self newSingleSelectionView.
	html := self render: radioGroup.

	self assert: html isEmpty