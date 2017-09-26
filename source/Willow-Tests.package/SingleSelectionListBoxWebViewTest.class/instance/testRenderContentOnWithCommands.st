tests-rendering
testRenderContentOnWithCommands

	| listBox html |

	listBox := SingleSelectionListBoxWebView displayingAtOnce: 10 applying: [ :theListBox | theListBox addClass willow ].
	html := self render: listBox.

	self assert: html equals: '<select name="1" size="10" class="willow"></select>'