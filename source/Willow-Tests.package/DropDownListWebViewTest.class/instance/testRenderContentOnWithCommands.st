tests-rendering
testRenderContentOnWithCommands

	| dropDownList html |

	dropDownList := DropDownListWebView applying: (ComponentClassificationCommand toStyleWith: 'rounded').
	html := self render: dropDownList.

	self assert: html equals: '<select name="1" class="rounded"></select>'