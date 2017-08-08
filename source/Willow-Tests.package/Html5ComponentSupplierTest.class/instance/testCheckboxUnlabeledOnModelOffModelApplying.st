tests-Supplying
testCheckboxUnlabeledOnModelOffModelApplying

	| supplier checkbox html |

	supplier := Html5ComponentSupplier new.

	checkbox := supplier
		checkboxUnlabeledOnModel: 3
		offModel: 'the off'
		applying: (ComponentClassificationCommand toStyleWith: BootstrapCssStyles backgroundPrimary).

	html := self render: checkbox.

	self
		assert: html
		equals:
			'<input class="bg-primary" checked="checked" name="1" type="checkbox"/><input name="2" type="hidden"/>'