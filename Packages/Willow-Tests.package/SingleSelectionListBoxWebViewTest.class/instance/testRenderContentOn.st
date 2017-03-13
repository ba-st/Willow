tests-rendering
testRenderContentOn

	| listBox html |

	listBox := self newSingleSelectionView.

	html := self render: listBox.

	self assert: html equals: '<select size="5" name="1"></select>'