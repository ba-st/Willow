tests-rendering
testRenderContentOn

	| listBox html |

	listBox := ListBoxWebView applying: CompositeComponentCommand empty.

	html := self render: listBox.

	self assert: html equals: '<select name="1" multiple="multiple"></select><input name="2" type="hidden"/>'