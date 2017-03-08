tests-rendering
testRenderContentOn

	| dropDownList html |

	dropDownList := self newSingleSelectionView.

	html := self render: dropDownList.

	self assert: html equals: '<select name="1"></select>'