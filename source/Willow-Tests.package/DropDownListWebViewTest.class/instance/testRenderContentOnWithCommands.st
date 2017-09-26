tests-rendering
testRenderContentOnWithCommands

	| dropDownList html |

	dropDownList := DropDownListWebView applying: [ :dropdown | dropdown addClass willow ].
	html := self render: dropDownList.

	self assert: html equals: '<select name="1" class="willow"></select>'