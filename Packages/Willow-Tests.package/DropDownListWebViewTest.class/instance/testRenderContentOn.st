tests-rendering
testRenderContentOn

	| dropDownList html |

	dropDownList := DropDownListWebView applying: CompositeComponentCommand empty.

	html := self render: dropDownList.

	self assert: html equals: '<select name="1"></select>'