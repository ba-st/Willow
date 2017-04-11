tests-rendering
testRenderContentOn

	| listBox html |

	listBox := self newSingleSelectionView.

	html := self render: listBox.

	self assert: html equals: '<select name="1" size="5"></select>'