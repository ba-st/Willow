tests-rendering
testRenderingAfterUpdatingModel

	| html checkbox |

	checkbox := CheckboxWebView
		labeled: 'Enable network'
		onModel: 1
		offModel: 2
		applying: (ComponentClassificationCommand toStyleWith: 'dark').

	checkbox selectOffModel.
	html := self render: checkbox.
	self
		assert: html
		equals:
			'<input class="dark" name="1" id="checkbox-id2" type="checkbox"/><input name="3" type="hidden"/><label for="checkbox-id2">Enable network</label>'.

	checkbox selectOnModel.
	html := self render: checkbox.
	self
		assert: html
		equals:
			'<input class="dark" checked="checked" name="1" id="checkbox-id2" type="checkbox"/><input name="2" type="hidden"/><label for="checkbox-id2">Enable network</label>'