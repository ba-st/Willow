tests
testDate

	| dateField html currentDate |

	dateField := DateFieldWebView applying: [ :field |  ].

	self should: [ dateField date ] raise: InstanceCreationFailed.

	currentDate := Date newDay: 1 month: 1 year: 2001.
	dateField changeDateTo: currentDate.

	self assert: dateField date equals: currentDate.
	html := self render: dateField.

	self assert: html equals: '<input value="2001-01-01" name="1" type="date"/>'