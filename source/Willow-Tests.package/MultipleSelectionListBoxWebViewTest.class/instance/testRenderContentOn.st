tests-rendering
testRenderContentOn

	| listBox html |

	listBox := self newListBox.

	html := self render: listBox.

	self assert: html equals: '<select name="1" multiple="multiple"></select><input name="2" type="hidden"/>'