tests-rendering
testWithNonBooleanModels

	| html checkbox |

	checkbox := CheckboxWebView onModel: 1 offModel: 2.

	html := self render: checkbox.

	self
		assert: html equals: '<input checked="checked" name="1" type="checkbox"/><input name="2" type="hidden"/>';
		assert: checkbox currentSelection equals: 1.

	checkbox toggleCurrentSelection.

	html := self render: checkbox.

	self
		assert: html equals: '<input name="1" type="checkbox"/><input name="2" type="hidden"/>';
		assert: checkbox currentSelection equals: 2