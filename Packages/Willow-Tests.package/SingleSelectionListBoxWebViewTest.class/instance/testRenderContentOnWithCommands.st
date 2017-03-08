tests-rendering
testRenderContentOnWithCommands

	| listBox html |

	listBox := SingleSelectionListBoxWebView displayingAtOnce: 10 applying: (ComponentClassificationCommand toStyleWith: 'rounded').
	html := self render: listBox.

	self assert: html equals: '<select size="10" class="rounded" name="1"></select>'