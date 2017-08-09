tests-Supplying
testCheckboxLabeledOnModelOffModelApplying

	| supplier checkbox html |

	supplier := Html5ComponentSupplier new.

	checkbox := supplier
		checkboxLabeled: 'Labelization'
		onModel: 3
		offModel: 'the off'
		applying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: checkbox.

	self
		assert: html
		equals:
			'<input class="big" checked="checked" name="1" id="checkbox-id2" type="checkbox"/><input name="3" type="hidden"/><label for="checkbox-id2">Labelization</label>'