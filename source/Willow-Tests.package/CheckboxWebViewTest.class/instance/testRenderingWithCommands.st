tests-rendering
testRenderingWithCommands

	| html checkbox |

	checkbox := CheckboxWebView applying: (ComponentClassificationCommand toStyleWith: 'dark').

	html := self render: checkbox.

	self
		assert: html equals: '<input class="dark" checked="checked" name="1" type="checkbox"/><input name="2" type="hidden"/>';
		assert: checkbox currentSelection