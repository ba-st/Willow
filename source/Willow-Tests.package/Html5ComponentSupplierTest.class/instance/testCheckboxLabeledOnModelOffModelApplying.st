tests-Supplying
testCheckboxLabeledOnModelOffModelApplying

	| supplier checkbox html |

	supplier := Html5ComponentSupplier new.

	checkbox := supplier
		checkboxLabeled: 'Labelization'
		onModel: 3
		offModel: 'the off'
		applying: (ComponentClassificationCommand toStyleWith: BootstrapCssStyles backgroundPrimary).

	html := self render: checkbox.

	self
		assert: html
		equals:
			'<input class="bg-primary" checked="checked" name="1" id="checkbox-id2" type="checkbox"/><input name="3" type="hidden"/><label for="checkbox-id2">Labelization</label>'