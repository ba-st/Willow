tests-rendering
testRenderingWithLabel

	| html checkbox |

	checkbox := CheckboxWebView
		labeled: 'Enable network'
		onModel: 1
		offModel: 2
		applying: [ :theCheckbox | theCheckbox addClass willow ].

	html := self render: checkbox.

	self assert: html equals: '<input class="willow" checked="checked" name="1" id="checkbox-id2" type="checkbox"/><input name="3" type="hidden"/><label for="checkbox-id2">Enable network</label>'