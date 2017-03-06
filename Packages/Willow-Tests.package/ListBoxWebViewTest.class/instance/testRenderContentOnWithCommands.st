tests-rendering
testRenderContentOnWithCommands

	| listBox html |

	listBox := ListBoxWebView applying: (ComponentClassificationCommand toStyleWith: 'rounded').
	html := self render: listBox.

	self assert: html equals: '<select class="rounded" name="1" multiple="multiple"></select><input name="2" type="hidden"/>'