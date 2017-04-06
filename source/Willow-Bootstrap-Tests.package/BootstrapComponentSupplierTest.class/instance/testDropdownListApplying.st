tests-Accessing
testDropdownListApplying

	| supplier dropDownList html |

	supplier := BootstrapComponentSupplier online.

	dropDownList := supplier dropdownListApplying: (ComponentMetadataCommand toDeclare: 'size' with: 10).

	html := self render: dropDownList.

	self assert: html equals: '<select class="selectpicker" data-size="10" name="1"></select>'