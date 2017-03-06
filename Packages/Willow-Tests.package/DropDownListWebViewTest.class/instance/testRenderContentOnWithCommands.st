tests-rendering
testRenderContentOnWithCommands

	| dropDownList html |

	dropDownList := DropDownListWebView applying: (ComponentClassificationCommand toStyleWith: 'rounded').
	html := self render: dropDownList.

	self assert: html equals: '<select class="rounded" name="1"></select>'