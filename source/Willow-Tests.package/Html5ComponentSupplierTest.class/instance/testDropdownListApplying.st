tests-Supplying
testDropdownListApplying

	| supplier dropdownList html |

	supplier := Html5ComponentSupplier new.

	dropdownList := supplier dropdownListApplying: (ComponentClassificationCommand toStyleWith: 'big').

	html := self render: dropdownList.

	self assert: html equals: '<select name="1" class="big"></select>'