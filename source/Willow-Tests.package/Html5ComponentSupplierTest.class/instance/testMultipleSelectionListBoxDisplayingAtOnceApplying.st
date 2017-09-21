tests-Supplying
testMultipleSelectionListBoxDisplayingAtOnceApplying

	| supplier listBox html |

	supplier := Html5ComponentSupplier new.

	listBox := supplier multipleSelectionListBoxDisplayingAtOnce: 15 applying: [ :command | command css willow ].

	html := self render: listBox.

	self assert: html equals: '<select name="1" size="15" class="willow" multiple="multiple"></select><input name="2" type="hidden"/>'