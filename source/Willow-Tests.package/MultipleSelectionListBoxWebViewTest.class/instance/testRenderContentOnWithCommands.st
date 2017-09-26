tests-rendering
testRenderContentOnWithCommands

	| listBox html |

	listBox := MultipleSelectionListBoxWebView applying: [ :command | command addClass willow ].
	html := self render: listBox.

	self assert: html equals: '<select name="1" class="willow" multiple="multiple"></select><input name="2" type="hidden"/>'