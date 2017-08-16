tests-Supplying
testSingleSelectionListBoxDisplayingAtOnceApplying

	| supplier listBox html |

	supplier := Html5ComponentSupplier new.

	listBox := supplier singleSelectionListBoxDisplayingAtOnce: 15 applying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: listBox.

	self assert: html equals: '<select name="1" size="15" class="big"></select>'